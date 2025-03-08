module gtk.event_controller_motion;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.event_controller_motion.EventControllerMotion] is an event controller tracking the pointer
  position.
  
  The event controller offers [gtk.event_controller_motion.EventControllerMotion.enter]
  and [gtk.event_controller_motion.EventControllerMotion.leave] signals, as well as
  `property@Gtk.EventControllerMotion:is-pointer` and
  `property@Gtk.EventControllerMotion:contains-pointer` properties
  which are updated to reflect changes in the pointer position as it
  moves over the widget.
*/
class EventControllerMotion : gtk.event_controller.EventController
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_motion_get_type != &gidSymbolNotFound ? gtk_event_controller_motion_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new event controller that will handle motion events.
    Returns:     a new [gtk.event_controller_motion.EventControllerMotion]
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_motion_new();
    this(_cretval, Yes.take);
  }

  /**
      Returns if a pointer is within self or one of its children.
    Returns:     true if a pointer is within self or one of its children
  */
  bool containsPointer()
  {
    bool _retval;
    _retval = gtk_event_controller_motion_contains_pointer(cast(GtkEventControllerMotion*)cPtr);
    return _retval;
  }

  /**
      Returns if a pointer is within self, but not one of its children.
    Returns:     true if a pointer is within self but not one of its children
  */
  bool isPointer()
  {
    bool _retval;
    _retval = gtk_event_controller_motion_is_pointer(cast(GtkEventControllerMotion*)cPtr);
    return _retval;
  }

  /**
      Signals that the pointer has entered the widget.
  
    ## Parameters
    $(LIST
      * $(B x)       coordinates of pointer location
      * $(B y)       coordinates of pointer location
      * $(B eventControllerMotion) the instance the signal is connected to
    )
  */
  alias EnterCallbackDlg = void delegate(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion);

  /** ditto */
  alias EnterCallbackFunc = void function(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion);

  /**
    Connect to Enter signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectEnter(T)(T callback, Flag!"after" after = No.after)
  if (is(T : EnterCallbackDlg) || is(T : EnterCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerMotion = getVal!(gtk.event_controller_motion.EventControllerMotion)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(x, y, eventControllerMotion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Signals that the pointer has left the widget.
  
    ## Parameters
    $(LIST
      * $(B eventControllerMotion) the instance the signal is connected to
    )
  */
  alias LeaveCallbackDlg = void delegate(gtk.event_controller_motion.EventControllerMotion eventControllerMotion);

  /** ditto */
  alias LeaveCallbackFunc = void function(gtk.event_controller_motion.EventControllerMotion eventControllerMotion);

  /**
    Connect to Leave signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectLeave(T)(T callback, Flag!"after" after = No.after)
  if (is(T : LeaveCallbackDlg) || is(T : LeaveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerMotion = getVal!(gtk.event_controller_motion.EventControllerMotion)(_paramVals);
      _dClosure.dlg(eventControllerMotion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Emitted when the pointer moves inside the widget.
  
    ## Parameters
    $(LIST
      * $(B x)       the x coordinate
      * $(B y)       the y coordinate
      * $(B eventControllerMotion) the instance the signal is connected to
    )
  */
  alias MotionCallbackDlg = void delegate(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion);

  /** ditto */
  alias MotionCallbackFunc = void function(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion);

  /**
    Connect to Motion signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectMotion(T)(T callback, Flag!"after" after = No.after)
  if (is(T : MotionCallbackDlg) || is(T : MotionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerMotion = getVal!(gtk.event_controller_motion.EventControllerMotion)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(x, y, eventControllerMotion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}
