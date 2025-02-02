module Gtk.EventControllerLegacy;

import GObject.DClosure;
import Gdk.Event;
import Gid.gid;
import Gtk.EventController;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkEventControllerLegacy` is an event controller that provides raw
 * access to the event stream.
 * It should only be used as a last resort if none of the other event
 * controllers or gestures do the job.
 */
class EventControllerLegacy : EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gtk_event_controller_legacy_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new legacy event controller.
   * Returns: the newly created event controller.
   */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_legacy_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Emitted for each GDK event delivered to controller.
   * Params
   *   event = the `GdkEvent` which triggered this signal
   *   eventControllerLegacy = the instance the signal is connected to
   * Returns: %TRUE to stop other handlers from being invoked for the event
   *   and the emission of this signal. %FALSE to propagate the event further.
   */
  alias EventCallbackDlg = bool delegate(Event event, EventControllerLegacy eventControllerLegacy);
  alias EventCallbackFunc = bool function(Event event, EventControllerLegacy eventControllerLegacy);

  /**
   * Connect to Event signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EventCallbackDlg) || is(T : EventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto eventControllerLegacy = getVal!EventControllerLegacy(_paramVals);
      auto event = getVal!Event(&_paramVals[1]);
      _retval = _dClosure.dlg(event, eventControllerLegacy);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}
