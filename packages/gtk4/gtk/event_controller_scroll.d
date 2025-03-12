module gtk.event_controller_scroll;

import gdk.types;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.event_controller_scroll.EventControllerScroll] is an event controller that handles scroll
  events.
  
  It is capable of handling both discrete and continuous scroll
  events from mice or touchpads, abstracting them both with the
  [gtk.event_controller_scroll.EventControllerScroll.scroll] signal. Deltas in
  the discrete case are multiples of 1.
  
  In the case of continuous scroll events, [gtk.event_controller_scroll.EventControllerScroll]
  encloses all [gtk.event_controller_scroll.EventControllerScroll.scroll] emissions
  between two [gtk.event_controller_scroll.EventControllerScroll.scroll] and
  [gtk.event_controller_scroll.EventControllerScroll.scroll] signals.
  
  The behavior of the event controller can be modified by the flags
  given at creation time, or modified at a later point through
  [gtk.event_controller_scroll.EventControllerScroll.setFlags] (e.g. because the scrolling
  conditions of the widget changed).
  
  The controller can be set up to emit motion for either/both vertical
  and horizontal scroll events through [gtk.types.EventControllerScrollFlags.Vertical],
  [gtk.types.EventControllerScrollFlags.Horizontal] and [gtk.types.EventControllerScrollFlags.BothAxes].
  If any axis is disabled, the respective [gtk.event_controller_scroll.EventControllerScroll.scroll]
  delta will be 0. Vertical scroll events will be translated to horizontal
  motion for the devices incapable of horizontal scrolling.
  
  The event controller can also be forced to emit discrete events on all
  devices through [gtk.types.EventControllerScrollFlags.Discrete]. This can be used
  to implement discrete actions triggered through scroll events (e.g.
  switching across combobox options).
  
  The [gtk.types.EventControllerScrollFlags.Kinetic] flag toggles the emission of the
  [gtk.event_controller_scroll.EventControllerScroll.decelerate] signal, emitted at the end
  of scrolling with two X/Y velocity arguments that are consistent with the
  motion that was received.
*/
class EventControllerScroll : gtk.event_controller.EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_scroll_get_type != &gidSymbolNotFound ? gtk_event_controller_scroll_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override EventControllerScroll self()
  {
    return this;
  }

  /**
      Creates a new event controller that will handle scroll events.
    Params:
      flags =       flags affecting the controller behavior
    Returns:     a new [gtk.event_controller_scroll.EventControllerScroll]
  */
  this(gtk.types.EventControllerScrollFlags flags)
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_scroll_new(flags);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the flags conditioning the scroll controller behavior.
    Returns:     the controller flags.
  */
  gtk.types.EventControllerScrollFlags getFlags()
  {
    GtkEventControllerScrollFlags _cretval;
    _cretval = gtk_event_controller_scroll_get_flags(cast(GtkEventControllerScroll*)cPtr);
    gtk.types.EventControllerScrollFlags _retval = cast(gtk.types.EventControllerScrollFlags)_cretval;
    return _retval;
  }

  /**
      Gets the scroll unit of the last
    [gtk.event_controller_scroll.EventControllerScroll.scroll] signal received.
    
    Always returns [gdk.types.ScrollUnit.Wheel] if the
    [gtk.types.EventControllerScrollFlags.Discrete] flag is set.
    Returns:     the scroll unit.
  */
  gdk.types.ScrollUnit getUnit()
  {
    GdkScrollUnit _cretval;
    _cretval = gtk_event_controller_scroll_get_unit(cast(GtkEventControllerScroll*)cPtr);
    gdk.types.ScrollUnit _retval = cast(gdk.types.ScrollUnit)_cretval;
    return _retval;
  }

  /**
      Sets the flags conditioning scroll controller behavior.
    Params:
      flags =       flags affecting the controller behavior
  */
  void setFlags(gtk.types.EventControllerScrollFlags flags)
  {
    gtk_event_controller_scroll_set_flags(cast(GtkEventControllerScroll*)cPtr, flags);
  }

  /**
      Emitted after scroll is finished if the
    [gtk.types.EventControllerScrollFlags.Kinetic] flag is set.
    
    vel_x and vel_y express the initial velocity that was
    imprinted by the scroll events. vel_x and vel_y are expressed in
    pixels/ms.
  
    ## Parameters
    $(LIST
      * $(B velX)       X velocity
      * $(B velY)       Y velocity
      * $(B eventControllerScroll) the instance the signal is connected to
    )
  */
  alias DecelerateCallbackDlg = void delegate(double velX, double velY, gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /** ditto */
  alias DecelerateCallbackFunc = void function(double velX, double velY, gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /**
    Connect to Decelerate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDecelerate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DecelerateCallbackDlg) || is(T : DecelerateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerScroll = getVal!(gtk.event_controller_scroll.EventControllerScroll)(_paramVals);
      auto velX = getVal!(double)(&_paramVals[1]);
      auto velY = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(velX, velY, eventControllerScroll);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("decelerate", closure, after);
  }

  /**
      Signals that the widget should scroll by the
    amount specified by dx and dy.
    
    For the representation unit of the deltas, see
    [gtk.event_controller_scroll.EventControllerScroll.getUnit].
  
    ## Parameters
    $(LIST
      * $(B dx)       X delta
      * $(B dy)       Y delta
      * $(B eventControllerScroll) the instance the signal is connected to
    )
    Returns:     true if the scroll event was handled,
        false otherwise.
  */
  alias ScrollCallbackDlg = bool delegate(double dx, double dy, gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /** ditto */
  alias ScrollCallbackFunc = bool function(double dx, double dy, gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /**
    Connect to Scroll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectScroll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ScrollCallbackDlg) || is(T : ScrollCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerScroll = getVal!(gtk.event_controller_scroll.EventControllerScroll)(_paramVals);
      auto dx = getVal!(double)(&_paramVals[1]);
      auto dy = getVal!(double)(&_paramVals[2]);
      _retval = _dClosure.dlg(dx, dy, eventControllerScroll);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll", closure, after);
  }

  /**
      Signals that a new scrolling operation has begun.
    
    It will only be emitted on devices capable of it.
  
    ## Parameters
    $(LIST
      * $(B eventControllerScroll) the instance the signal is connected to
    )
  */
  alias ScrollBeginCallbackDlg = void delegate(gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /** ditto */
  alias ScrollBeginCallbackFunc = void function(gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /**
    Connect to ScrollBegin signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectScrollBegin(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ScrollBeginCallbackDlg) || is(T : ScrollBeginCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerScroll = getVal!(gtk.event_controller_scroll.EventControllerScroll)(_paramVals);
      _dClosure.dlg(eventControllerScroll);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-begin", closure, after);
  }

  /**
      Signals that a scrolling operation has finished.
    
    It will only be emitted on devices capable of it.
  
    ## Parameters
    $(LIST
      * $(B eventControllerScroll) the instance the signal is connected to
    )
  */
  alias ScrollEndCallbackDlg = void delegate(gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /** ditto */
  alias ScrollEndCallbackFunc = void function(gtk.event_controller_scroll.EventControllerScroll eventControllerScroll);

  /**
    Connect to ScrollEnd signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectScrollEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ScrollEndCallbackDlg) || is(T : ScrollEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto eventControllerScroll = getVal!(gtk.event_controller_scroll.EventControllerScroll)(_paramVals);
      _dClosure.dlg(eventControllerScroll);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-end", closure, after);
  }
}
