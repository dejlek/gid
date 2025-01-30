//!generate funcs
import core.atomic;
import std.conv : to;
public import std.typecons : Flag, No, Yes;

import GLib.Types;
import GLib.c.functions;
import GObject.DClosure;
import GObject.Value;

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

/// Base class wrapper for GObject types
class ObjectG
{
  protected ObjectC* cInstancePtr; // Pointer to wrapped C GObject

  /**
   * Create an unset GObject wrapper.
   */
  this()
  {
  }

  /**
   * Create an ObjectG which is wrapping a C GObject with the given GType.
   * Useful for creating custom D classes which are derived from ObjectG.
   * Params:
   *   type = The GType value to use for creating the wrapped GObject
   */
  this(GType type)
  {
    this(g_object_new(type, null), Yes.Take);
  }

  /**
   * Constructor to wrap a C GObject with a D proxy object.
   * Params:
   *   cObj = Pointer to the GObject
   *   take = Yes.Take if the D object should take ownership of the passed reference, No.Take to add a new reference (default)
   */
  this(void* cObj, Flag!"Take" take = No.Take)
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
}

/// Interface proxy class - used to wrap unknown GObjects as a specific interface
abstract class IfaceProxy : ObjectG
{
  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(ptr, take);
  }

  abstract TypeInfo_Interface getIface();
}
