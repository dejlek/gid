module gtk.event_controller_key;

import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.imcontext;
import gtk.types;
import gtk.widget;

/**
    #GtkEventControllerKey is an event controller meant for situations
  where you need access to key events.
  
  This object was added in 3.24.
*/
class EventControllerKey : gtk.event_controller.EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_key_get_type != &gidSymbolNotFound ? gtk_event_controller_key_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(gtk.widget.Widget widget)
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_key_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool forward(gtk.widget.Widget widget)
  {
    bool _retval;
    _retval = gtk_event_controller_key_forward(cast(GtkEventControllerKey*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  uint getGroup()
  {
    uint _retval;
    _retval = gtk_event_controller_key_get_group(cast(GtkEventControllerKey*)cPtr);
    return _retval;
  }

  /**
      Gets the IM context of a key controller.
    Returns:     the IM context
  */
  gtk.imcontext.IMContext getImContext()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_event_controller_key_get_im_context(cast(GtkEventControllerKey*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.imcontext.IMContext)(cast(GtkIMContext*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void setImContext(gtk.imcontext.IMContext imContext)
  {
    gtk_event_controller_key_set_im_context(cast(GtkEventControllerKey*)cPtr, imContext ? cast(GtkIMContext*)imContext.cPtr(No.Dup) : null);
  }

  /** */
  alias FocusInCallbackDlg = void delegate(gtk.event_controller_key.EventControllerKey eventControllerKey);

  /** ditto */
  alias FocusInCallbackFunc = void function(gtk.event_controller_key.EventControllerKey eventControllerKey);

  /**
    Connect to FocusIn signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectFocusIn(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FocusInCallbackDlg) || is(T : FocusInCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerKey = getVal!(gtk.event_controller_key.EventControllerKey)(_paramVals);
      _dClosure.dlg(eventControllerKey);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-in", closure, after);
  }

  /** */
  alias FocusOutCallbackDlg = void delegate(gtk.event_controller_key.EventControllerKey eventControllerKey);

  /** ditto */
  alias FocusOutCallbackFunc = void function(gtk.event_controller_key.EventControllerKey eventControllerKey);

  /**
    Connect to FocusOut signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectFocusOut(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FocusOutCallbackDlg) || is(T : FocusOutCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerKey = getVal!(gtk.event_controller_key.EventControllerKey)(_paramVals);
      _dClosure.dlg(eventControllerKey);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("focus-out", closure, after);
  }

  /** */
  alias ImUpdateCallbackDlg = void delegate(gtk.event_controller_key.EventControllerKey eventControllerKey);

  /** ditto */
  alias ImUpdateCallbackFunc = void function(gtk.event_controller_key.EventControllerKey eventControllerKey);

  /**
    Connect to ImUpdate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectImUpdate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ImUpdateCallbackDlg) || is(T : ImUpdateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerKey = getVal!(gtk.event_controller_key.EventControllerKey)(_paramVals);
      _dClosure.dlg(eventControllerKey);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("im-update", closure, after);
  }

  /**
      This signal is emitted whenever a key is pressed.
  
    ## Parameters
    $(LIST
      * $(B keyval)       the pressed key.
      * $(B keycode)       the raw code of the pressed key.
      * $(B state)       the bitmask, representing the state of modifier keys and pointer buttons. See #GdkModifierType.
      * $(B eventControllerKey) the instance the signal is connected to
    )
    Returns:     true if the key press was handled, false otherwise.
  */
  alias KeyPressedCallbackDlg = bool delegate(uint keyval, uint keycode, gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey);

  /** ditto */
  alias KeyPressedCallbackFunc = bool function(uint keyval, uint keycode, gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey);

  /**
    Connect to KeyPressed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectKeyPressed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : KeyPressedCallbackDlg) || is(T : KeyPressedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerKey = getVal!(gtk.event_controller_key.EventControllerKey)(_paramVals);
      auto keyval = getVal!(uint)(&_paramVals[1]);
      auto keycode = getVal!(uint)(&_paramVals[2]);
      auto state = getVal!(gdk.types.ModifierType)(&_paramVals[3]);
      _retval = _dClosure.dlg(keyval, keycode, state, eventControllerKey);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-pressed", closure, after);
  }

  /**
      This signal is emitted whenever a key is released.
  
    ## Parameters
    $(LIST
      * $(B keyval)       the released key.
      * $(B keycode)       the raw code of the released key.
      * $(B state)       the bitmask, representing the state of modifier keys and pointer buttons. See #GdkModifierType.
      * $(B eventControllerKey) the instance the signal is connected to
    )
  */
  alias KeyReleasedCallbackDlg = void delegate(uint keyval, uint keycode, gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey);

  /** ditto */
  alias KeyReleasedCallbackFunc = void function(uint keyval, uint keycode, gdk.types.ModifierType state, gtk.event_controller_key.EventControllerKey eventControllerKey);

  /**
    Connect to KeyReleased signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectKeyReleased(T)(T callback, Flag!"After" after = No.After)
  if (is(T : KeyReleasedCallbackDlg) || is(T : KeyReleasedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerKey = getVal!(gtk.event_controller_key.EventControllerKey)(_paramVals);
      auto keyval = getVal!(uint)(&_paramVals[1]);
      auto keycode = getVal!(uint)(&_paramVals[2]);
      auto state = getVal!(gdk.types.ModifierType)(&_paramVals[3]);
      _dClosure.dlg(keyval, keycode, state, eventControllerKey);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-released", closure, after);
  }

  /** */
  alias ModifiersCallbackDlg = bool delegate(gdk.types.ModifierType object, gtk.event_controller_key.EventControllerKey eventControllerKey);

  /** ditto */
  alias ModifiersCallbackFunc = bool function(gdk.types.ModifierType object, gtk.event_controller_key.EventControllerKey eventControllerKey);

  /**
    Connect to Modifiers signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectModifiers(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ModifiersCallbackDlg) || is(T : ModifiersCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerKey = getVal!(gtk.event_controller_key.EventControllerKey)(_paramVals);
      auto object = getVal!(gdk.types.ModifierType)(&_paramVals[1]);
      _retval = _dClosure.dlg(object, eventControllerKey);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("modifiers", closure, after);
  }
}
