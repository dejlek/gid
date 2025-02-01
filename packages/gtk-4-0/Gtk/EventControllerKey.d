module Gtk.EventControllerKey;

import GObject.DClosure;
import GObject.ObjectG;
import Gdk.Types;
import Gid.gid;
import Gtk.EventController;
import Gtk.IMContext;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkEventControllerKey` is an event controller that provides access
 * to key events.
 */
class EventControllerKey : EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_event_controller_key_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new event controller that will handle key events.
   * Returns: a new `GtkEventControllerKey`
   */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_key_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Forwards the current event of this controller to a widget.
   * This function can only be used in handlers for the
   * signalGtk.EventControllerKey::key-pressed,
   * signalGtk.EventControllerKey::key-released
   * or [Gtk.EventControllerKey.modifiers] signals.
   * Params:
   *   widget = a `GtkWidget`
   * Returns: whether the widget handled the event
   */
  bool forward(Widget widget)
  {
    bool _retval;
    _retval = gtk_event_controller_key_forward(cast(GtkEventControllerKey*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Gets the key group of the current event of this controller.
   * See [Gdk.KeyEvent.getLayout].
   * Returns: the key group
   */
  uint getGroup()
  {
    uint _retval;
    _retval = gtk_event_controller_key_get_group(cast(GtkEventControllerKey*)cPtr);
    return _retval;
  }

  /**
   * Gets the input method context of the key controller.
   * Returns: the `GtkIMContext`
   */
  IMContext getImContext()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_event_controller_key_get_im_context(cast(GtkEventControllerKey*)cPtr);
    auto _retval = ObjectG.getDObject!IMContext(cast(GtkIMContext*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the input method context of the key controller.
   * Params:
   *   imContext = a `GtkIMContext`
   */
  void setImContext(IMContext imContext)
  {
    gtk_event_controller_key_set_im_context(cast(GtkEventControllerKey*)cPtr, imContext ? cast(GtkIMContext*)imContext.cPtr(No.Dup) : null);
  }

  /**
   * Emitted whenever the input method context filters away
   * a keypress and prevents the controller receiving it.
   * See [Gtk.EventControllerKey.setImContext] and
   * [Gtk.IMContext.filterKeypress].
   *   eventControllerKey = the instance the signal is connected to
   */
  alias ImUpdateCallbackDlg = void delegate(EventControllerKey eventControllerKey);
  alias ImUpdateCallbackFunc = void function(EventControllerKey eventControllerKey);

  /**
   * Connect to ImUpdate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectImUpdate(T)(T callback, Flag!"After" after = No.After)
  if (is(T == ImUpdateCallbackDlg) || is(T == ImUpdateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerKey = getVal!EventControllerKey(_paramVals);
      _dClosure.dlg(eventControllerKey);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("im-update", closure, after);
  }

  /**
   * Emitted whenever a key is pressed.
   * Params
   *   keyval = the pressed key.
   *   keycode = the raw code of the pressed key.
   *   state = the bitmask, representing the state of modifier keys and pointer buttons.
   *   eventControllerKey = the instance the signal is connected to
   * Returns: %TRUE if the key press was handled, %FALSE otherwise.
   */
  alias KeyPressedCallbackDlg = bool delegate(uint keyval, uint keycode, ModifierType state, EventControllerKey eventControllerKey);
  alias KeyPressedCallbackFunc = bool function(uint keyval, uint keycode, ModifierType state, EventControllerKey eventControllerKey);

  /**
   * Connect to KeyPressed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectKeyPressed(T)(T callback, Flag!"After" after = No.After)
  if (is(T == KeyPressedCallbackDlg) || is(T == KeyPressedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerKey = getVal!EventControllerKey(_paramVals);
      auto keyval = getVal!uint(&_paramVals[1]);
      auto keycode = getVal!uint(&_paramVals[2]);
      auto state = getVal!ModifierType(&_paramVals[3]);
      _retval = _dClosure.dlg(keyval, keycode, state, eventControllerKey);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-pressed", closure, after);
  }

  /**
   * Emitted whenever a key is released.
   * Params
   *   keyval = the released key.
   *   keycode = the raw code of the released key.
   *   state = the bitmask, representing the state of modifier keys and pointer buttons.
   *   eventControllerKey = the instance the signal is connected to
   */
  alias KeyReleasedCallbackDlg = void delegate(uint keyval, uint keycode, ModifierType state, EventControllerKey eventControllerKey);
  alias KeyReleasedCallbackFunc = void function(uint keyval, uint keycode, ModifierType state, EventControllerKey eventControllerKey);

  /**
   * Connect to KeyReleased signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectKeyReleased(T)(T callback, Flag!"After" after = No.After)
  if (is(T == KeyReleasedCallbackDlg) || is(T == KeyReleasedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerKey = getVal!EventControllerKey(_paramVals);
      auto keyval = getVal!uint(&_paramVals[1]);
      auto keycode = getVal!uint(&_paramVals[2]);
      auto state = getVal!ModifierType(&_paramVals[3]);
      _dClosure.dlg(keyval, keycode, state, eventControllerKey);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-released", closure, after);
  }

  /**
   * Emitted whenever the state of modifier keys and pointer buttons change.
   * Params
   *   state = the bitmask, representing the new state of modifier keys and
   *     pointer buttons.
   *   eventControllerKey = the instance the signal is connected to
   * Returns:
   */
  alias ModifiersCallbackDlg = bool delegate(ModifierType state, EventControllerKey eventControllerKey);
  alias ModifiersCallbackFunc = bool function(ModifierType state, EventControllerKey eventControllerKey);

  /**
   * Connect to Modifiers signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectModifiers(T)(T callback, Flag!"After" after = No.After)
  if (is(T == ModifiersCallbackDlg) || is(T == ModifiersCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerKey = getVal!EventControllerKey(_paramVals);
      auto state = getVal!ModifierType(&_paramVals[1]);
      _retval = _dClosure.dlg(state, eventControllerKey);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("modifiers", closure, after);
  }
}
