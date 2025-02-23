module gtk.event_controller_focus;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
 * `GtkEventControllerFocus` is an event controller to keep track of
 * keyboard focus.
 * The event controller offers [Gtk.EventControllerFocus.enter]
 * and [Gtk.EventControllerFocus.leave] signals, as well as
 * property@Gtk.EventControllerFocus:is-focus and
 * property@Gtk.EventControllerFocus:contains-focus properties
 * which are updated to reflect focus changes inside the widget hierarchy
 * that is rooted at the controllers widget.
 */
class EventControllerFocus : EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_focus_get_type != &gidSymbolNotFound ? gtk_event_controller_focus_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new event controller that will handle focus events.
   * Returns: a new `GtkEventControllerFocus`
   */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_focus_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Returns %TRUE if focus is within self or one of its children.
   * Returns: %TRUE if focus is within self or one of its children
   */
  bool containsFocus()
  {
    bool _retval;
    _retval = gtk_event_controller_focus_contains_focus(cast(GtkEventControllerFocus*)cPtr);
    return _retval;
  }

  /**
   * Returns %TRUE if focus is within self, but not one of its children.
   * Returns: %TRUE if focus is within self, but not one of its children
   */
  bool isFocus()
  {
    bool _retval;
    _retval = gtk_event_controller_focus_is_focus(cast(GtkEventControllerFocus*)cPtr);
    return _retval;
  }

  /**
   * Emitted whenever the focus enters into the widget or one
   * of its descendents.
   * Note that this means you may not get an ::enter signal
   * even though the widget becomes the focus location, in
   * certain cases $(LPAREN)such as when the focus moves from a descendent
   * of the widget to the widget itself$(RPAREN). If you are interested
   * in these cases, you can monitor the
   * propertyGtk.EventControllerFocus:is-focus
   * property for changes.
   *   eventControllerFocus = the instance the signal is connected to
   */
  alias EnterCallbackDlg = void delegate(EventControllerFocus eventControllerFocus);
  alias EnterCallbackFunc = void function(EventControllerFocus eventControllerFocus);

  /**
   * Connect to Enter signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EnterCallbackDlg) || is(T : EnterCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerFocus = getVal!EventControllerFocus(_paramVals);
      _dClosure.dlg(eventControllerFocus);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
   * Emitted whenever the focus leaves the widget hierarchy
   * that is rooted at the widget that the controller is attached to.
   * Note that this means you may not get a ::leave signal
   * even though the focus moves away from the widget, in
   * certain cases $(LPAREN)such as when the focus moves from the widget
   * to a descendent$(RPAREN). If you are interested in these cases, you
   * can monitor the propertyGtk.EventControllerFocus:is-focus
   * property for changes.
   *   eventControllerFocus = the instance the signal is connected to
   */
  alias LeaveCallbackDlg = void delegate(EventControllerFocus eventControllerFocus);
  alias LeaveCallbackFunc = void function(EventControllerFocus eventControllerFocus);

  /**
   * Connect to Leave signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LeaveCallbackDlg) || is(T : LeaveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerFocus = getVal!EventControllerFocus(_paramVals);
      _dClosure.dlg(eventControllerFocus);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }
}
