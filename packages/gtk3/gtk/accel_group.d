module gtk.accel_group;

import gdk.types;
import gid.gid;
import glib.types;
import gobject.closure;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkAccelGroup represents a group of keyboard accelerators,
  typically attached to a toplevel #GtkWindow (with
  [gtk.window.Window.addAccelGroup]). Usually you won’t need to create a
  #GtkAccelGroup directly; instead, when using #GtkUIManager, GTK+
  automatically sets up the accelerators for your menus in the ui
  manager’s #GtkAccelGroup.
  
  Note that “accelerators” are different from
  “mnemonics”. Accelerators are shortcuts for
  activating a menu item; they appear alongside the menu item they’re a
  shortcut for. For example “Ctrl+Q” might appear alongside the “Quit”
  menu item. Mnemonics are shortcuts for GUI elements such as text
  entries or buttons; they appear as underlined characters. See
  [gtk.label.Label.newWithMnemonic]. Menu items can have both accelerators
  and mnemonics, of course.
*/
class AccelGroup : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accel_group_get_type != &gidSymbolNotFound ? gtk_accel_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override AccelGroup self()
  {
    return this;
  }

  /**
      Creates a new #GtkAccelGroup.
    Returns:     a new #GtkAccelGroup object
  */
  this()
  {
    GtkAccelGroup* _cretval;
    _cretval = gtk_accel_group_new();
    this(_cretval, Yes.Take);
  }

  /**
      Finds the #GtkAccelGroup to which closure is connected;
    see [gtk.accel_group.AccelGroup.connect].
    Params:
      closure =       a #GClosure
    Returns:     the #GtkAccelGroup to which closure
          is connected, or null
  */
  static gtk.accel_group.AccelGroup fromAccelClosure(gobject.closure.Closure closure)
  {
    GtkAccelGroup* _cretval;
    _cretval = gtk_accel_group_from_accel_closure(closure ? cast(GClosure*)closure.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.accel_group.AccelGroup)(cast(GtkAccelGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the first accelerator in accel_group that matches
    accel_key and accel_mods, and activates it.
    Params:
      accelQuark =       the quark for the accelerator name
      acceleratable =       the #GObject, usually a #GtkWindow, on which
           to activate the accelerator
      accelKey =       accelerator keyval from a key event
      accelMods =       keyboard state mask from a key event
    Returns:     true if an accelerator was activated and handled
          this keypress
  */
  bool activate(glib.types.Quark accelQuark, gobject.object.ObjectG acceleratable, uint accelKey, gdk.types.ModifierType accelMods)
  {
    bool _retval;
    _retval = gtk_accel_group_activate(cast(GtkAccelGroup*)cPtr, accelQuark, acceleratable ? cast(ObjectC*)acceleratable.cPtr(No.Dup) : null, accelKey, accelMods);
    return _retval;
  }

  /**
      Installs an accelerator in this group. When accel_group is being
    activated in response to a call to [gtk.global.accelGroupsActivate],
    closure will be invoked if the accel_key and accel_mods from
    [gtk.global.accelGroupsActivate] match those of this connection.
    
    The signature used for the closure is that of #GtkAccelGroupActivate.
    
    Note that, due to implementation details, a single closure can
    only be connected to one accelerator group.
    Params:
      accelKey =       key value of the accelerator
      accelMods =       modifier combination of the accelerator
      accelFlags =       a flag mask to configure this accelerator
      closure =       closure to be executed upon accelerator activation
  */
  void connect(uint accelKey, gdk.types.ModifierType accelMods, gtk.types.AccelFlags accelFlags, gobject.closure.Closure closure)
  {
    gtk_accel_group_connect(cast(GtkAccelGroup*)cPtr, accelKey, accelMods, accelFlags, closure ? cast(GClosure*)closure.cPtr(No.Dup) : null);
  }

  /**
      Installs an accelerator in this group, using an accelerator path
    to look up the appropriate key and modifiers (see
    [gtk.accel_map.AccelMap.addEntry]). When accel_group is being activated
    in response to a call to [gtk.global.accelGroupsActivate], closure will
    be invoked if the accel_key and accel_mods from
    [gtk.global.accelGroupsActivate] match the key and modifiers for the path.
    
    The signature used for the closure is that of #GtkAccelGroupActivate.
    
    Note that accel_path string will be stored in a #GQuark. Therefore,
    if you pass a static string, you can save some memory by interning it
    first with [glib.global.internStaticString].
    Params:
      accelPath =       path used for determining key and modifiers
      closure =       closure to be executed upon accelerator activation
  */
  void connectByPath(string accelPath, gobject.closure.Closure closure)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_accel_group_connect_by_path(cast(GtkAccelGroup*)cPtr, _accelPath, closure ? cast(GClosure*)closure.cPtr(No.Dup) : null);
  }

  /**
      Removes an accelerator previously installed through
    [gtk.accel_group.AccelGroup.connect].
    
    Since 2.20 closure can be null.
    Params:
      closure =       the closure to remove from this accelerator
            group, or null to remove all closures
    Returns:     true if the closure was found and got disconnected
  */
  bool disconnect(gobject.closure.Closure closure = null)
  {
    bool _retval;
    _retval = gtk_accel_group_disconnect(cast(GtkAccelGroup*)cPtr, closure ? cast(GClosure*)closure.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes an accelerator previously installed through
    [gtk.accel_group.AccelGroup.connect].
    Params:
      accelKey =       key value of the accelerator
      accelMods =       modifier combination of the accelerator
    Returns:     true if there was an accelerator which could be
          removed, false otherwise
  */
  bool disconnectKey(uint accelKey, gdk.types.ModifierType accelMods)
  {
    bool _retval;
    _retval = gtk_accel_group_disconnect_key(cast(GtkAccelGroup*)cPtr, accelKey, accelMods);
    return _retval;
  }

  /**
      Finds the first entry in an accelerator group for which
    find_func returns true and returns its #GtkAccelKey.
    Params:
      findFunc =       a function to filter the entries
           of accel_group with
    Returns:     the key of the first entry passing
         find_func. The key is owned by GTK+ and must not be freed.
  */
  gtk.types.AccelKey find(gtk.types.AccelGroupFindFunc findFunc)
  {
    extern(C) bool _findFuncCallback(GtkAccelKey* key, GClosure* closure, void* data)
    {
      auto _dlg = cast(gtk.types.AccelGroupFindFunc*)data;

      bool _retval = (*_dlg)(*key, closure ? new gobject.closure.Closure(cast(void*)closure, No.Take) : null);
      return _retval;
    }
    auto _findFuncCB = findFunc ? &_findFuncCallback : null;

    GtkAccelKey* _cretval;
    auto _findFunc = findFunc ? cast(void*)&(findFunc) : null;
    _cretval = gtk_accel_group_find(cast(GtkAccelGroup*)cPtr, _findFuncCB, _findFunc);
    gtk.types.AccelKey _retval;
    if (_cretval)
      _retval = *cast(gtk.types.AccelKey*)_cretval;
    return _retval;
  }

  /**
      Locks are added and removed using [gtk.accel_group.AccelGroup.lock] and
    [gtk.accel_group.AccelGroup.unlock].
    Returns:     true if there are 1 or more locks on the accel_group,
          false otherwise.
  */
  bool getIsLocked()
  {
    bool _retval;
    _retval = gtk_accel_group_get_is_locked(cast(GtkAccelGroup*)cPtr);
    return _retval;
  }

  /**
      Gets a #GdkModifierType representing the mask for this
    accel_group. For example, #GDK_CONTROL_MASK, #GDK_SHIFT_MASK, etc.
    Returns:     the modifier mask for this accel group.
  */
  gdk.types.ModifierType getModifierMask()
  {
    GdkModifierType _cretval;
    _cretval = gtk_accel_group_get_modifier_mask(cast(GtkAccelGroup*)cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Locks the given accelerator group.
    
    Locking an acelerator group prevents the accelerators contained
    within it to be changed during runtime. Refer to
    [gtk.accel_map.AccelMap.changeEntry] about runtime accelerator changes.
    
    If called more than once, accel_group remains locked until
    [gtk.accel_group.AccelGroup.unlock] has been called an equivalent number
    of times.
  */
  void lock()
  {
    gtk_accel_group_lock(cast(GtkAccelGroup*)cPtr);
  }

  /**
      Undoes the last call to [gtk.accel_group.AccelGroup.lock] on this accel_group.
  */
  void unlock()
  {
    gtk_accel_group_unlock(cast(GtkAccelGroup*)cPtr);
  }

  /**
      The accel-activate signal is an implementation detail of
    #GtkAccelGroup and not meant to be used by applications.
  
    ## Parameters
    $(LIST
      * $(B acceleratable)       the object on which the accelerator was activated
      * $(B keyval)       the accelerator keyval
      * $(B modifier)       the modifier combination of the accelerator
      * $(B accelGroup) the instance the signal is connected to
    )
    Returns:     true if the accelerator was activated
  */
  alias AccelActivateCallbackDlg = bool delegate(gobject.object.ObjectG acceleratable, uint keyval, gdk.types.ModifierType modifier, gtk.accel_group.AccelGroup accelGroup);

  /** ditto */
  alias AccelActivateCallbackFunc = bool function(gobject.object.ObjectG acceleratable, uint keyval, gdk.types.ModifierType modifier, gtk.accel_group.AccelGroup accelGroup);

  /**
    Connect to AccelActivate signal.
    Params:
      detail = Signal detail or null (default)
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAccelActivate(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : AccelActivateCallbackDlg) || is(T : AccelActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto accelGroup = getVal!(gtk.accel_group.AccelGroup)(_paramVals);
      auto acceleratable = getVal!(gobject.object.ObjectG)(&_paramVals[1]);
      auto keyval = getVal!(uint)(&_paramVals[2]);
      auto modifier = getVal!(gdk.types.ModifierType)(&_paramVals[3]);
      _retval = _dClosure.dlg(acceleratable, keyval, modifier, accelGroup);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-activate"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      The accel-changed signal is emitted when an entry
    is added to or removed from the accel group.
    
    Widgets like #GtkAccelLabel which display an associated
    accelerator should connect to this signal, and rebuild
    their visual representation if the accel_closure is theirs.
  
    ## Parameters
    $(LIST
      * $(B keyval)       the accelerator keyval
      * $(B modifier)       the modifier combination of the accelerator
      * $(B accelClosure)       the #GClosure of the accelerator
      * $(B accelGroup) the instance the signal is connected to
    )
  */
  alias AccelChangedCallbackDlg = void delegate(uint keyval, gdk.types.ModifierType modifier, gobject.closure.Closure accelClosure, gtk.accel_group.AccelGroup accelGroup);

  /** ditto */
  alias AccelChangedCallbackFunc = void function(uint keyval, gdk.types.ModifierType modifier, gobject.closure.Closure accelClosure, gtk.accel_group.AccelGroup accelGroup);

  /**
    Connect to AccelChanged signal.
    Params:
      detail = Signal detail or null (default)
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAccelChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : AccelChangedCallbackDlg) || is(T : AccelChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto accelGroup = getVal!(gtk.accel_group.AccelGroup)(_paramVals);
      auto keyval = getVal!(uint)(&_paramVals[1]);
      auto modifier = getVal!(gdk.types.ModifierType)(&_paramVals[2]);
      auto accelClosure = getVal!(gobject.closure.Closure)(&_paramVals[3]);
      _dClosure.dlg(keyval, modifier, accelClosure, accelGroup);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accel-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
