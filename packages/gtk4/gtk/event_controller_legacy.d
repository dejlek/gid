module gtk.event_controller_legacy;

import gdk.event;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.event_controller_legacy.EventControllerLegacy] is an event controller that provides raw
  access to the event stream.
  
  It should only be used as a last resort if none of the other event
  controllers or gestures do the job.
*/
class EventControllerLegacy : gtk.event_controller.EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_legacy_get_type != &gidSymbolNotFound ? gtk_event_controller_legacy_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a new legacy event controller.
    Returns:     the newly created event controller.
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_legacy_new();
    this(_cretval, Yes.Take);
  }

  /**
      Emitted for each GDK event delivered to controller.
  
    ## Parameters
    $(LIST
      * $(B event)       the [gdk.event.Event] which triggered this signal
      * $(B eventControllerLegacy) the instance the signal is connected to
    )
    Returns:     true to stop other handlers from being invoked for the event
        and the emission of this signal. false to propagate the event further.
  */
  alias EventCallbackDlg = bool delegate(gdk.event.Event event, gtk.event_controller_legacy.EventControllerLegacy eventControllerLegacy);

  /** ditto */
  alias EventCallbackFunc = bool function(gdk.event.Event event, gtk.event_controller_legacy.EventControllerLegacy eventControllerLegacy);

  /**
    Connect to Event signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EventCallbackDlg) || is(T : EventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerLegacy = getVal!(gtk.event_controller_legacy.EventControllerLegacy)(_paramVals);
      auto event = getVal!(gdk.event.Event)(&_paramVals[1]);
      _retval = _dClosure.dlg(event, eventControllerLegacy);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}
