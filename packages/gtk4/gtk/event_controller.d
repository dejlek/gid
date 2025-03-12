module gtk.event_controller;

import gdk.device;
import gdk.event;
import gdk.types;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.event_controller.EventController] is the base class for event controllers.
  
  These are ancillary objects associated to widgets, which react
  to `GdkEvents`, and possibly trigger actions as a consequence.
  
  Event controllers are added to a widget with
  [gtk.widget.Widget.addController]. It is rarely necessary to
  explicitly remove a controller with [gtk.widget.Widget.removeController].
  
  See the chapter on [input handling](input-handling.html) for
  an overview of the basic concepts, such as the capture and bubble
  phases of event propagation.
*/
class EventController : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_get_type != &gidSymbolNotFound ? gtk_event_controller_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override EventController self()
  {
    return this;
  }

  /**
      Returns the event that is currently being handled by the controller.
    
    At other times, null is returned.
    Returns:     the event that is currently
        handled by controller
  */
  gdk.event.Event getCurrentEvent()
  {
    GdkEvent* _cretval;
    _cretval = gtk_event_controller_get_current_event(cast(GtkEventController*)cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the device of the event that is currently being
    handled by the controller.
    
    At other times, null is returned.
    Returns:     device of the event is
        currently handled by controller
  */
  gdk.device.Device getCurrentEventDevice()
  {
    GdkDevice* _cretval;
    _cretval = gtk_event_controller_get_current_event_device(cast(GtkEventController*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the modifier state of the event that is currently being
    handled by the controller.
    
    At other times, 0 is returned.
    Returns:     modifier state of the event is currently handled by controller
  */
  gdk.types.ModifierType getCurrentEventState()
  {
    GdkModifierType _cretval;
    _cretval = gtk_event_controller_get_current_event_state(cast(GtkEventController*)cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Returns the timestamp of the event that is currently being
    handled by the controller.
    
    At other times, 0 is returned.
    Returns:     timestamp of the event is currently handled by controller
  */
  uint getCurrentEventTime()
  {
    uint _retval;
    _retval = gtk_event_controller_get_current_event_time(cast(GtkEventController*)cPtr);
    return _retval;
  }

  /**
      Gets the name of controller.
    Returns:     The controller name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_event_controller_get_name(cast(GtkEventController*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the propagation limit of the event controller.
    Returns:     the propagation limit
  */
  gtk.types.PropagationLimit getPropagationLimit()
  {
    GtkPropagationLimit _cretval;
    _cretval = gtk_event_controller_get_propagation_limit(cast(GtkEventController*)cPtr);
    gtk.types.PropagationLimit _retval = cast(gtk.types.PropagationLimit)_cretval;
    return _retval;
  }

  /**
      Gets the propagation phase at which controller handles events.
    Returns:     the propagation phase
  */
  gtk.types.PropagationPhase getPropagationPhase()
  {
    GtkPropagationPhase _cretval;
    _cretval = gtk_event_controller_get_propagation_phase(cast(GtkEventController*)cPtr);
    gtk.types.PropagationPhase _retval = cast(gtk.types.PropagationPhase)_cretval;
    return _retval;
  }

  /**
      Returns the [gtk.widget.Widget] this controller relates to.
    Returns:     a [gtk.widget.Widget]
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_event_controller_get_widget(cast(GtkEventController*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Resets the controller to a clean state.
  */
  void reset()
  {
    gtk_event_controller_reset(cast(GtkEventController*)cPtr);
  }

  /**
      Sets a name on the controller that can be used for debugging.
    Params:
      name =       a name for controller
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_event_controller_set_name(cast(GtkEventController*)cPtr, _name);
  }

  /**
      Sets the event propagation limit on the event controller.
    
    If the limit is set to [gtk.types.PropagationLimit.SameNative], the controller
    won't handle events that are targeted at widgets on a different
    surface, such as popovers.
    Params:
      limit =       the propagation limit
  */
  void setPropagationLimit(gtk.types.PropagationLimit limit)
  {
    gtk_event_controller_set_propagation_limit(cast(GtkEventController*)cPtr, limit);
  }

  /**
      Sets the propagation phase at which a controller handles events.
    
    If phase is [gtk.types.PropagationPhase.None], no automatic event handling will be
    performed, but other additional gesture maintenance will.
    Params:
      phase =       a propagation phase
  */
  void setPropagationPhase(gtk.types.PropagationPhase phase)
  {
    gtk_event_controller_set_propagation_phase(cast(GtkEventController*)cPtr, phase);
  }

  /**
      Sets a name on the controller that can be used for debugging.
    Params:
      name =       a name for controller, must be a static string
  */
  void setStaticName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_event_controller_set_static_name(cast(GtkEventController*)cPtr, _name);
  }
}
