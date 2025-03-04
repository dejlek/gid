module gobject.object;

import gid.gid;
import glib.types;
import gobject.binding;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.dclosure;
import gobject.param_spec;
import gobject.types;
import gobject.value;


import core.atomic;
import std.conv : to;
public import std.typecons : Flag, No, Yes;

import glib.types;
import glib.c.functions;
import gobject.dclosure;
import gobject.value;

debug
{
  // Used for enabling GObject lifecycle debug messages by setting GID_OBJECT_DEBUG=1
  private immutable bool gidObjectDebug;

  shared static this()
  {
    import std.process : environment;
    gidObjectDebug = environment.get("GID_OBJECT_DEBUG", "0") == "1";
  }
}

shared static this()
{
  gidObjectQuark = g_quark_from_string("_gidObject");
}

private extern (C) Object _d_newclass(const TypeInfo_Class ci);

// String quark used to assign the D ObjectG to the C GObject keyed-data list
private immutable Quark gidObjectQuark;

private shared TypeInfo_Class[GType] gtypeClasses; // Map of GTypes to D class info
private shared TypeInfo_Class[TypeInfo_Interface] ifaceProxyClasses; // Map of interface type info to proxy class info
private shared bool classMapsInitialized;

/**
 * A convenient string mixin to be used for ObjectG derived classes to declare boilerplate constructors.
 * Returns: A string value to use with mixin() within ObjectG derived classes.
 */
string objectGMixin()
{
  return
  `  this(void* cObj, Flag!"Take" take = No.Take)
  {
    super(cObj, take);
  }
  `;
}

/// Base class wrapper for GObject types
/**
 * The base object type.
 * `GObject` is the fundamental type providing the common attributes and
 * methods for all object types in GTK, Pango and other libraries
 * based on GObject. The `GObject` class provides methods for object
 * construction and destruction, property access methods, and signal
 * support. Signals are described in detail [here][gobject-Signals].
 * For a tutorial on implementing a new `GObject` class, see [How to define and
 * implement a new GObject]$(LPAREN)tutorial.html#how-to-define-and-implement-a-new-gobject$(RPAREN).
 * For a list of naming conventions for GObjects and their methods, see the
 * [GType conventions](concepts.html#conventions). For the high-level concepts
 * behind GObject, read
 * [Instantiatable classed types: Objects](concepts.html#instantiatable-classed-types-objects).
 * Since GLib 2.72, all `GObject`s are guaranteed to be aligned to at least the
 * alignment of the largest basic GLib type $(LPAREN)typically this is `guint64` or
 * `gdouble`$(RPAREN). If you need larger alignment for an element in a `GObject`, you
 * should allocate it on the heap $(LPAREN)aligned$(RPAREN), or arrange for your `GObject` to be
 * appropriately padded. This guarantee applies to the `GObject` $(LPAREN)or derived$(RPAREN)
 * struct, the `GObjectClass` $(LPAREN)or derived$(RPAREN) struct, and any private data allocated
 * by `G_ADD_PRIVATE$(LPAREN)$(RPAREN)`.
 */
class ObjectG
{
  protected ObjectC* cInstancePtr; // Pointer to wrapped C GObject

  /**
   * Create an ObjectG which is wrapping a C GObject with the given GType.
   * Useful for creating custom D classes which are derived from ObjectG.
   * Params:
   *   type = The GType value to use for creating the wrapped GObject
   */
  final this(GType type)
  {
    this(g_object_new(type, null), Yes.Take);
  }

  /**
   * Constructor to wrap a C GObject with a D proxy object.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference (default)
   */
  final this(void* cObj, Flag!"Take" take = No.Take)
  {
    if (!cObj)
      throw new GidConstructException("Null instance pointer for " ~ typeid(this).name);

    setGObject(cObj, take);
  }

  ~this()
  { // D object is being garbage collected. Only happens when there is only the toggle reference on GObject and there are no more pointers to the D proxy object.
    if (cInstancePtr) // Might be null if an exception occurred during construction
    {
      import core.memory : GC;

      if (!GC.inFinalizer)
        debug objectDebugLog("dtor");

      g_object_remove_toggle_ref(cInstancePtr, &_cObjToggleNotify, cast(void*)this); // Remove the toggle reference, which will likely lead to the destruction of the GObject
    }
  }

  /**
   * Set the GObject of a D ObjectG wrapper.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference (default)
   */
  final void setGObject(void* cObj, Flag!"Take" take = No.Take)
  {
    assert(!cInstancePtr);

    cInstancePtr = cast(ObjectC*)cObj;

    // Add a data pointer to the D object from the C GObject
    g_object_set_qdata(cInstancePtr, gidObjectQuark, cast(void*)this);

    // Add a toggle reference to bind the GObject to this proxy D Object to prevent the GObject from being destroyed, while also preventing ref loops.
    g_object_add_toggle_ref(cInstancePtr, &_cObjToggleNotify, cast(void*)this);

    // Add D object as a root to garbage collector so that it doesn't get collected as long as the GObject has a strong reference on it (toggle ref + 1 or more other refs).
    // There will always be at least 2 references at this point, one from the caller and one for the toggle ref.
    ptrFreezeGC(cast(void*)this);

    // If object has a floating reference (GInitiallyOwned), take ownership of it
    if (g_object_is_floating(cInstancePtr))
      g_object_ref_sink(cInstancePtr);

    // If taking ownership of the object, remove the extra reference. May trigger toggle notify if it is the last remaining ref,
    // which will call GC.removeRoot() allowing the D object to be garbage collected if it is no longer being accessed, resulting in the destruction of the GObject in dtor.
    if (take)
      g_object_unref(cInstancePtr);

    debug objectDebugLog("new");
  }

  // Toggle ref callback
  extern(C) static void _cObjToggleNotify(void *dObj, ObjectC* gObj, bool isLastRef)
  {
    if (isLastRef) // Is the toggle reference the only reference?
      ptrThawGC(dObj);
    else // Toggle reference was the last reference, but now there is an additional one
      ptrFreezeGC(dObj);
  }

  /**
   * Get a pointer to the underlying C object.
   * Params:
   *   dup = Yes.Dup to add a reference with g_object_ref(), No.Dup otherwise (default)
   * Returns: The C object (reference added according to addRef parameter)
   */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      g_object_ref(cInstancePtr);

    debug objectDebugLog("cPtr(" ~ dup.to!string ~ ")");

    return cast(void*)cInstancePtr;
  }

  /**
   * Calls g_object_ref() on a GObject.
   * Params:
   *   gObj = The GObject to reference
   * Returns: The GObject
   */
  static void* ref_(void* gObj)
  {
    return g_object_ref(cast(ObjectC*)gObj);
  }

  /**
   * Calls g_object_unref() on a GObject.
   * Params:
   *   gObj = The GObject to reference
   */
  static unref(void* gObj)
  {
    g_object_unref(cast(ObjectC*)gObj);
  }

  /**
   * Get the GType of an object.
   * Returns: The GType
   */
  static GType getType()
  {
    return g_object_get_type();
  }

  /**
   * GObject GType property.
   * Returns: The GType of the GObject class.
   */
  @property GType gType()
  {
    return getType;
  }

  /**
   * Template to get the D object from a C GObject and cast it to the given D object type.
   * Params:
   *   T = The D object type
   *   cInstance = The C GObject (can be null, in which case null is returned)
   *   take = If Yes.Take then the D object will consume a GObject reference (No.Take by default).
   * Returns: The D object (which may be a new object if the GObject wasn't already wrapped)
   */
  static T getDObject(T)(void* cptr, Flag!"Take" take = No.Take)
  {
    if (!cptr)
      return null;

    // Cast return value to ObjectG or D pointer resolution will break if T is an interface (cast from void* to Interface not the same as Object to Interface)
    if (auto dObj = cast(ObjectG)g_object_get_qdata(cast(ObjectC*)cptr, gidObjectQuark))
    {
      if (take)
        g_object_unref(cast(ObjectC*)cptr);

      return cast(T)dObj;
    }

    if (!atomicLoad(classMapsInitialized)) // One time initialization of class maps
    {
      synchronized
      {
        auto gobjClass = typeid(ObjectG);
        auto ifProxyClass = typeid(IfaceProxy);

        foreach (m; ModuleInfo)
        {
          if (!m)
            continue;

          foreach (c; m.localClasses)
          {
            if (c && ifProxyClass.isBaseOf(c))
            {
              if (c is ifProxyClass)
                continue;

              auto obj = cast(IfaceProxy)_d_newclass(c);

              if (auto ifaceInfo = obj.getIface)
                ifaceProxyClasses[ifaceInfo] = cast(shared)c;
            }
            else if (c && gobjClass.isBaseOf(c))
            { // Create object without calling the constructor which could have side effects - FIXME is there a better way to do this?
              auto obj = _d_newclass(c);

              if (auto gType = (cast(ObjectG)obj).gType)
                gtypeClasses[gType] = cast(shared)c;
            }
          }
        }

        atomicStore(classMapsInitialized, true);
      }
    }

    // Traverse the C GObject type ancestry until we find a corresponding D class
    for (auto gTypeClass = (cast(GTypeInstance*)cptr).gClass; gTypeClass;
      gTypeClass = g_type_class_peek_parent(gTypeClass))
    {
      if (auto dClassType = gTypeClass.gType in gtypeClasses)
      { // If T is an interface type, make sure the matching object class implements it
        if (is(T == interface) && !typeid(T).isBaseOf(cast(const)*dClassType))
          break;

        if (auto obj = _d_newclass(cast()*dClassType))
        {
          (cast(ObjectG)obj).setGObject(cptr, take);
          return cast(T)obj;
        }

        return null;
      }
    }

    static if (is(T == interface))
    {
      if (auto proxyClass = typeid(T) in ifaceProxyClasses) // Interface has a proxy object?
      {
        if (auto obj = _d_newclass(cast()*proxyClass)) // Create the object without calling the constructor
        {
          (cast(ObjectG)obj).setGObject(cptr, take); // Assign the C GObject
          return cast(T)obj;
        }
      }

      return null;
    }
    else
      return new T(cptr, take); // Fallback to attempting to create Object from this template Object type
  }

  debug
  {
    void objectDebugLog(string action)
    {
      if (gidObjectDebug)
      {
        import std.stdio : writeln;
        import std.conv : to;
        writeln(action, " ", typeid(this).name, "@0x", (cast(ulong)cast(void*)this).to!string(16), "(GObject@0x",
        (cast(ulong)cast(void*)cInstancePtr).to!string(16), ") refcount=", cInstancePtr.refCount);
      }
    }
  }

  /**
   * Connect a D closure to an object signal.
   * Params:
   *   signalDetail = Signal name and optional detail separated by '::'
   *   closure = Closure to connect signal to
   *   after = Yes.After to invoke the signal after the default handler, No.After to execute before (default)
   * Returns: The signal connection ID
   */
  ulong connectSignalClosure(string signalDetail, DClosure closure, Flag!"After" after = No.After)
  {
    return g_signal_connect_closure(cInstancePtr, signalDetail.toCString(No.Alloc), cast(GClosure*)(cast(Closure)closure).cPtr, after == Yes.After);
  }

  /**
   * Template for setting a GObject property.
   * Params:
   *   propertyName = Name of the GObject property
   *   val = The value to assign (must match the property value type)
   */
  void setProperty(T)(string propertyName, T val)
  {
    GValue value;
    initVal!T(&value);
    setVal(&value, val);
    g_object_set_property(cInstancePtr, toCString(propertyName, No.Alloc), &value);
    g_value_unset(&value);
  }

  /**
   * Template for getting a GObject property.
   * Params:
   *   propertyName = Name of the GObject property
   * Returns: The property value (must match the property value type)
   */
  T getProperty(T)(string propertyName) const
  {
    GValue value;
    initVal!T(&value);
    g_object_get_property(cInstancePtr, toCString(propertyName, No.Alloc), &value);
    T retval = getVal(&value, val);
    g_value_unset(&value);
    return retval;
  }

  static size_t compatControl(size_t what, void* data = null)
  {
    size_t _retval;
    _retval = g_object_compat_control(what, data);
    return _retval;
  }

  /**
   * Creates a binding between source_property on source and target_property
   * on target.
   * Whenever the source_property is changed the target_property is
   * updated using the same value. For instance:
   * |[<!-- language\="C" -->
   * g_object_bind_property $(LPAREN)action, "active", widget, "sensitive", 0$(RPAREN);
   * ]|
   * Will result in the "sensitive" property of the widget #GObject instance to be
   * updated with the same value of the "active" property of the action #GObject
   * instance.
   * If flags contains %G_BINDING_BIDIRECTIONAL then the binding will be mutual:
   * if target_property on target changes then the source_property on source
   * will be updated as well.
   * The binding will automatically be removed when either the source or the
   * target instances are finalized. To remove the binding without affecting the
   * source and the target you can just call [gobject.object.ObjectG.unref] on the returned
   * #GBinding instance.
   * Removing the binding by calling [gobject.object.ObjectG.unref] on it must only be done if
   * the binding, source and target are only used from a single thread and it
   * is clear that both source and target outlive the binding. Especially it
   * is not safe to rely on this if the binding, source or target can be
   * finalized from different threads. Keep another reference to the binding and
   * use [gobject.binding.Binding.unbind] instead to be on the safe side.
   * A #GObject can have multiple bindings.
   * Params:
   *   sourceProperty = the property on source to bind
   *   target = the target #GObject
   *   targetProperty = the property on target to bind
   *   flags = flags to pass to #GBinding
   * Returns: the #GBinding instance representing the
   *   binding between the two #GObject instances. The binding is released
   *   whenever the #GBinding reference count reaches zero.
   */
  gobject.binding.Binding bindProperty(string sourceProperty, gobject.object.ObjectG target, string targetProperty, gobject.types.BindingFlags flags)
  {
    GBinding* _cretval;
    const(char)* _sourceProperty = sourceProperty.toCString(No.Alloc);
    const(char)* _targetProperty = targetProperty.toCString(No.Alloc);
    _cretval = g_object_bind_property(cast(ObjectC*)cPtr, _sourceProperty, target ? cast(ObjectC*)target.cPtr(No.Dup) : null, _targetProperty, flags);
    auto _retval = ObjectG.getDObject!(gobject.binding.Binding)(cast(GBinding*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a binding between source_property on source and target_property
   * on target, allowing you to set the transformation functions to be used by
   * the binding.
   * This function is the language bindings friendly version of
   * [gobject.object.ObjectG.bindPropertyFull], using #GClosures instead of
   * function pointers.
   * Params:
   *   sourceProperty = the property on source to bind
   *   target = the target #GObject
   *   targetProperty = the property on target to bind
   *   flags = flags to pass to #GBinding
   *   transformTo = a #GClosure wrapping the transformation function
   *     from the source to the target, or %NULL to use the default
   *   transformFrom = a #GClosure wrapping the transformation function
   *     from the target to the source, or %NULL to use the default
   * Returns: the #GBinding instance representing the
   *   binding between the two #GObject instances. The binding is released
   *   whenever the #GBinding reference count reaches zero.
   */
  gobject.binding.Binding bindPropertyFull(string sourceProperty, gobject.object.ObjectG target, string targetProperty, gobject.types.BindingFlags flags, gobject.closure.Closure transformTo, gobject.closure.Closure transformFrom)
  {
    GBinding* _cretval;
    const(char)* _sourceProperty = sourceProperty.toCString(No.Alloc);
    const(char)* _targetProperty = targetProperty.toCString(No.Alloc);
    _cretval = g_object_bind_property_with_closures(cast(ObjectC*)cPtr, _sourceProperty, target ? cast(ObjectC*)target.cPtr(No.Dup) : null, _targetProperty, flags, transformTo ? cast(GClosure*)transformTo.cPtr(No.Dup) : null, transformFrom ? cast(GClosure*)transformFrom.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gobject.binding.Binding)(cast(GBinding*)_cretval, No.Take);
    return _retval;
  }

  /**
   * This function is intended for #GObject implementations to re-enforce
   * a [floating][floating-ref] object reference. Doing this is seldom
   * required: all #GInitiallyUnowneds are created with a floating reference
   * which usually just needs to be sunken by calling [gobject.object.ObjectG.refSink].
   */
  void forceFloating()
  {
    g_object_force_floating(cast(ObjectC*)cPtr);
  }

  /**
   * Increases the freeze count on object. If the freeze count is
   * non-zero, the emission of "notify" signals on object is
   * stopped. The signals are queued until the freeze count is decreased
   * to zero. Duplicate notifications are squashed so that at most one
   * #GObject::notify signal is emitted for each property modified while the
   * object is frozen.
   * This is necessary for accessors that modify multiple properties to prevent
   * premature notification while the object is still being modified.
   */
  void freezeNotify()
  {
    g_object_freeze_notify(cast(ObjectC*)cPtr);
  }

  /**
   * Gets a named field from the objects table of associations $(LPAREN)see [gobject.object.ObjectG.setData]$(RPAREN).
   * Params:
   *   key = name of the key for that association
   * Returns: the data if found,
   *   or %NULL if no such data exists.
   */
  void* getData(string key)
  {
    const(char)* _key = key.toCString(No.Alloc);
    auto _retval = g_object_get_data(cast(ObjectC*)cPtr, _key);
    return _retval;
  }

  /**
   * Gets a property of an object.
   * The value can be:
   * - an empty #GValue initialized by %G_VALUE_INIT, which will be
   * automatically initialized with the expected type of the property
   * $(LPAREN)since GLib 2.60$(RPAREN)
   * - a #GValue initialized with the expected type of the property
   * - a #GValue initialized with a type to which the expected type
   * of the property can be transformed
   * In general, a copy is made of the property contents and the caller is
   * responsible for freeing the memory by calling [gobject.value.Value.unset].
   * Note that [gobject.object.ObjectG.getProperty] is really intended for language
   * bindings, [gobject.object.ObjectG.get] is much more convenient for C programming.
   * Params:
   *   propertyName = the name of the property to get
   *   value = return location for the property value
   */
  void getProperty(string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    g_object_get_property(cast(ObjectC*)cPtr, _propertyName, value ? cast(GValue*)value.cPtr(No.Dup) : null);
  }

  /**
   * This function gets back user data pointers stored via
   * [gobject.object.ObjectG.setQdata].
   * Params:
   *   quark = A #GQuark, naming the user data pointer
   * Returns: The user data pointer set, or %NULL
   */
  void* getQdata(glib.types.Quark quark)
  {
    auto _retval = g_object_get_qdata(cast(ObjectC*)cPtr, quark);
    return _retval;
  }

  /**
   * Gets n_properties properties for an object.
   * Obtained properties will be set to values. All properties must be valid.
   * Warnings will be emitted and undefined behaviour may result if invalid
   * properties are passed in.
   * Params:
   *   names = the names of each property to get
   *   values = the values of each property to get
   */
  void getv(string[] names, gobject.value.Value[] values)
  {
    uint _nProperties;
    if (names)
      _nProperties = cast(uint)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    const(char*)* _names = _tmpnames.ptr;

    if (values)
      _nProperties = cast(uint)values.length;

    GValue[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= *cast(GValue*)obj.cPtr;
    GValue* _values = _tmpvalues.ptr;
    g_object_getv(cast(ObjectC*)cPtr, _nProperties, _names, _values);
  }

  /**
   * Checks whether object has a [floating][floating-ref] reference.
   * Returns: %TRUE if object has a floating reference
   */
  bool isFloating()
  {
    bool _retval;
    _retval = g_object_is_floating(cast(ObjectC*)cPtr);
    return _retval;
  }

  /**
   * Emits a "notify" signal for the property property_name on object.
   * When possible, eg. when signaling a property change from within the class
   * that registered the property, you should use [gobject.object.ObjectG.notifyByPspec]
   * instead.
   * Note that emission of the notify signal may be blocked with
   * [gobject.object.ObjectG.freezeNotify]. In this case, the signal emissions are queued
   * and will be emitted $(LPAREN)in reverse order$(RPAREN) when [gobject.object.ObjectG.thawNotify] is
   * called.
   * Params:
   *   propertyName = the name of a property installed on the class of object.
   */
  void notify(string propertyName)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    g_object_notify(cast(ObjectC*)cPtr, _propertyName);
  }

  /**
   * Emits a "notify" signal for the property specified by pspec on object.
   * This function omits the property name lookup, hence it is faster than
   * [gobject.object.ObjectG.notify].
   * One way to avoid using [gobject.object.ObjectG.notify] from within the
   * class that registered the properties, and using [gobject.object.ObjectG.notifyByPspec]
   * instead, is to store the GParamSpec used with
   * [gobject.object_class.ObjectClass.installProperty] inside a static array, e.g.:
   * |[<!-- language\="C" -->
   * typedef enum
   * {
   * PROP_FOO \= 1,
   * PROP_LAST
   * } MyObjectProperty;
   * static GParamSpec *properties[PROP_LAST];
   * static void
   * my_object_class_init $(LPAREN)MyObjectClass *klass$(RPAREN)
   * {
   * properties[PROP_FOO] \= g_param_spec_int $(LPAREN)"foo", NULL, NULL,
   * 0, 100,
   * 50,
   * G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS$(RPAREN);
   * g_object_class_install_property $(LPAREN)gobject_class,
   * PROP_FOO,
   * properties[PROP_FOO]$(RPAREN);
   * }
   * ]|
   * and then notify a change on the "foo" property with:
   * |[<!-- language\="C" -->
   * g_object_notify_by_pspec $(LPAREN)self, properties[PROP_FOO]$(RPAREN);
   * ]|
   * Params:
   *   pspec = the #GParamSpec of a property installed on the class of object.
   */
  void notifyByPspec(gobject.param_spec.ParamSpec pspec)
  {
    g_object_notify_by_pspec(cast(ObjectC*)cPtr, pspec ? cast(GParamSpec*)pspec.cPtr(No.Dup) : null);
  }

  /**
   * Increase the reference count of object, and possibly remove the
   * [floating][floating-ref] reference, if object has a floating reference.
   * In other words, if the object is floating, then this call "assumes
   * ownership" of the floating reference, converting it to a normal
   * reference by clearing the floating flag while leaving the reference
   * count unchanged.  If the object is not floating, then this call
   * adds a new normal reference increasing the reference count by one.
   * Since GLib 2.56, the type of object will be propagated to the return type
   * under the same conditions as for [gobject.object.ObjectG.ref_].
   * Returns: object
   */
  gobject.object.ObjectG refSink()
  {
    ObjectC* _cretval;
    _cretval = g_object_ref_sink(cast(ObjectC*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Releases all references to other objects. This can be used to break
   * reference cycles.
   * This function should only be called from object system implementations.
   */
  void runDispose()
  {
    g_object_run_dispose(cast(ObjectC*)cPtr);
  }

  /**
   * Each object carries around a table of associations from
   * strings to pointers.  This function lets you set an association.
   * If the object already had an association with that name,
   * the old association will be destroyed.
   * Internally, the key is converted to a #GQuark using [glib.global.quarkFromString].
   * This means a copy of key is kept permanently $(LPAREN)even after object has been
   * finalized$(RPAREN) — so it is recommended to only use a small, bounded set of values
   * for key in your program, to avoid the #GQuark storage growing unbounded.
   * Params:
   *   key = name of the key
   *   data = data to associate with that key
   */
  void setData(string key, void* data = null)
  {
    const(char)* _key = key.toCString(No.Alloc);
    g_object_set_data(cast(ObjectC*)cPtr, _key, data);
  }

  /**
   * Sets a property on an object.
   * Params:
   *   propertyName = the name of the property to set
   *   value = the value
   */
  void setProperty(string propertyName, gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    g_object_set_property(cast(ObjectC*)cPtr, _propertyName, value ? cast(const(GValue)*)value.cPtr(No.Dup) : null);
  }

  /**
   * Remove a specified datum from the object's data associations,
   * without invoking the association's destroy handler.
   * Params:
   *   key = name of the key
   * Returns: the data if found, or %NULL
   *   if no such data exists.
   */
  void* stealData(string key)
  {
    const(char)* _key = key.toCString(No.Alloc);
    auto _retval = g_object_steal_data(cast(ObjectC*)cPtr, _key);
    return _retval;
  }

  /**
   * This function gets back user data pointers stored via
   * [gobject.object.ObjectG.setQdata] and removes the data from object
   * without invoking its destroy$(LPAREN)$(RPAREN) function $(LPAREN)if any was
   * set$(RPAREN).
   * Usually, calling this function is only required to update
   * user data pointers with a destroy notifier, for example:
   * |[<!-- language\="C" -->
   * void
   * object_add_to_user_list $(LPAREN)GObject     *object,
   * const gchar *new_string$(RPAREN)
   * {
   * // the quark, naming the object data
   * GQuark quark_string_list \= g_quark_from_static_string $(LPAREN)"my-string-list"$(RPAREN);
   * // retrieve the old string list
   * GList *list \= g_object_steal_qdata $(LPAREN)object, quark_string_list$(RPAREN);
   * // prepend new string
   * list \= g_list_prepend $(LPAREN)list, g_strdup $(LPAREN)new_string$(RPAREN)$(RPAREN);
   * // this changed 'list', so we need to set it again
   * g_object_set_qdata_full $(LPAREN)object, quark_string_list, list, free_string_list$(RPAREN);
   * }
   * static void
   * free_string_list $(LPAREN)gpointer data$(RPAREN)
   * {
   * GList *node, *list \= data;
   * for $(LPAREN)node \= list; node; node \= node->next$(RPAREN)
   * g_free $(LPAREN)node->data$(RPAREN);
   * g_list_free $(LPAREN)list$(RPAREN);
   * }
   * ]|
   * Using [gobject.object.ObjectG.getQdata] in the above example, instead of
   * [gobject.object.ObjectG.stealQdata] would have left the destroy function set,
   * and thus the partial string list would have been freed upon
   * [gobject.object.ObjectG.setQdataFull].
   * Params:
   *   quark = A #GQuark, naming the user data pointer
   * Returns: The user data pointer set, or %NULL
   */
  void* stealQdata(glib.types.Quark quark)
  {
    auto _retval = g_object_steal_qdata(cast(ObjectC*)cPtr, quark);
    return _retval;
  }

  /**
   * Reverts the effect of a previous call to
   * [gobject.object.ObjectG.freezeNotify]. The freeze count is decreased on object
   * and when it reaches zero, queued "notify" signals are emitted.
   * Duplicate notifications for each property are squashed so that at most one
   * #GObject::notify signal is emitted for each property, in the reverse order
   * in which they have been queued.
   * It is an error to call this function when the freeze count is zero.
   */
  void thawNotify()
  {
    g_object_thaw_notify(cast(ObjectC*)cPtr);
  }

  /**
   * This function essentially limits the life time of the closure to
   * the life time of the object. That is, when the object is finalized,
   * the closure is invalidated by calling [gobject.closure.Closure.invalidate] on
   * it, in order to prevent invocations of the closure with a finalized
   * $(LPAREN)nonexisting$(RPAREN) object. Also, [gobject.object.ObjectG.ref_] and [gobject.object.ObjectG.unref] are
   * added as marshal guards to the closure, to ensure that an extra
   * reference count is held on object during invocation of the
   * closure.  Usually, this function will be called on closures that
   * use this object as closure data.
   * Params:
   *   closure = #GClosure to watch
   */
  void watchClosure(gobject.closure.Closure closure)
  {
    g_object_watch_closure(cast(ObjectC*)cPtr, closure ? cast(GClosure*)closure.cPtr(No.Dup) : null);
  }

  /**
   * The notify signal is emitted on an object when one of its properties has
   * its value set through [gobject.object.ObjectG.setProperty], [gobject.object.ObjectG.set], et al.
   * Note that getting this signal doesn’t itself guarantee that the value of
   * the property has actually changed. When it is emitted is determined by the
   * derived GObject class. If the implementor did not create the property with
   * %G_PARAM_EXPLICIT_NOTIFY, then any call to [gobject.object.ObjectG.setProperty] results
   * in ::notify being emitted, even if the new value is the same as the old.
   * If they did pass %G_PARAM_EXPLICIT_NOTIFY, then this signal is emitted only
   * when they explicitly call [gobject.object.ObjectG.notify] or [gobject.object.ObjectG.notifyByPspec],
   * and common practice is to do that only when the value has actually changed.
   * This signal is typically used to obtain change notification for a
   * single property, by specifying the property name as a detail in the
   * g_signal_connect$(LPAREN)$(RPAREN) call, like this:
   * |[<!-- language\="C" -->
   * g_signal_connect $(LPAREN)text_view->buffer, "notify::paste-target-list",
   * G_CALLBACK $(LPAREN)gtk_text_view_target_list_notify$(RPAREN),
   * text_view$(RPAREN)
   * ]|
   * It is important to note that you must use
   * [canonical parameter names][canonical-parameter-names] as
   * detail strings for the notify signal.
   * Params
   *   pspec = the #GParamSpec of the property which changed.
   *   objectG = the instance the signal is connected to
   */
  alias NotifyCallbackDlg = void delegate(gobject.param_spec.ParamSpec pspec, gobject.object.ObjectG objectG);
  alias NotifyCallbackFunc = void function(gobject.param_spec.ParamSpec pspec, gobject.object.ObjectG objectG);

  /**
   * Connect to Notify signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectNotify(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : NotifyCallbackDlg) || is(T : NotifyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto objectG = getVal!(gobject.object.ObjectG)(_paramVals);
      auto pspec = getVal!(gobject.param_spec.ParamSpec)(&_paramVals[1]);
      _dClosure.dlg(pspec, objectG);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}

/// Interface proxy class - used to wrap unknown GObjects as a specific interface
abstract class IfaceProxy : ObjectG
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(ptr, take);
  }

  abstract TypeInfo_Interface getIface();
}
