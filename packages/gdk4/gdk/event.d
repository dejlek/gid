/// Module for [Event] class
module gdk.event;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.device_tool;
import gdk.display;
import gdk.event_sequence;
import gdk.seat;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.object;

/**
    [gdk.event.Event]s are immutable data structures, created by GDK to
    represent windowing system events.
    
    In GTK applications the events are handled automatically by toplevel
    widgets and passed on to the event controllers of appropriate widgets,
    so using [gdk.event.Event] and its related API is rarely needed.
*/
class Event
{
  GdkEvent* cInstancePtr;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.event.Event");

    cInstancePtr = cast(GdkEvent*)ptr;

    if (!take)
      gdk_event_ref(cInstancePtr);
  }

  ~this()
  {
    gdk_event_unref(cInstancePtr);
  }


  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      gdk_event_ref(cInstancePtr);

    return cInstancePtr;
  }

  /**
      Extracts all axis values from an event.
      
      To find out which axes are used, use [gdk.device_tool.DeviceTool.getAxes]
      on the device tool returned by [gdk.event.Event.getDeviceTool].
  
      Params:
        axes = the array of values for all axes
      Returns: true on success, otherwise false
  */
  bool getAxes(out double[] axes)
  {
    bool _retval;
    uint _nAxes;
    double* _axes;
    _retval = gdk_event_get_axes(cast(GdkEvent*)this._cPtr, &_axes, &_nAxes);
    axes.length = _nAxes;
    axes[0 .. $] = (cast(double*)_axes)[0 .. _nAxes];
    return _retval;
  }

  /**
      Extract the axis value for a particular axis use from
      an event structure.
      
      To find out which axes are used, use [gdk.device_tool.DeviceTool.getAxes]
      on the device tool returned by [gdk.event.Event.getDeviceTool].
  
      Params:
        axisUse = the axis use to look for
        value = location to store the value found
      Returns: true if the specified axis was found, otherwise false
  */
  bool getAxis(gdk.types.AxisUse axisUse, out double value)
  {
    bool _retval;
    _retval = gdk_event_get_axis(cast(GdkEvent*)this._cPtr, axisUse, cast(double*)&value);
    return _retval;
  }

  /**
      Returns the device of an event.
      Returns: a [gdk.device.Device]
  */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_event_get_device(cast(GdkEvent*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gdk.device_tool.DeviceTool] representing the tool that
      caused the event.
      
      If the was not generated by a device that supports
      different tools (such as a tablet), this function will
      return null.
      
      Note: the [gdk.device_tool.DeviceTool] will be constant during
      the application lifetime, if settings must be stored
      persistently across runs, see [gdk.device_tool.DeviceTool.getSerial].
      Returns: The current device tool
  */
  gdk.device_tool.DeviceTool getDeviceTool()
  {
    GdkDeviceTool* _cretval;
    _cretval = gdk_event_get_device_tool(cast(GdkEvent*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the display associated to the event.
      Returns: a [gdk.display.Display]
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_event_get_display(cast(GdkEvent*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the event sequence to which the event belongs.
      
      Related touch events are connected in a sequence. Other
      events typically don't have event sequence information.
      Returns: the event sequence that the event belongs to
  */
  gdk.event_sequence.EventSequence getEventSequence()
  {
    GdkEventSequence* _cretval;
    _cretval = gdk_event_get_event_sequence(cast(GdkEvent*)this._cPtr);
    auto _retval = _cretval ? new gdk.event_sequence.EventSequence(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the type of the event.
      Returns: a [gdk.event.Event]Type
  */
  gdk.types.EventType getEventType()
  {
    GdkEventType _cretval;
    _cretval = gdk_event_get_event_type(cast(GdkEvent*)this._cPtr);
    gdk.types.EventType _retval = cast(gdk.types.EventType)_cretval;
    return _retval;
  }

  /**
      Retrieves the history of the device that event is for, as a list of
      time and coordinates.
      
      The history includes positions that are not delivered as separate events
      to the application because they occurred in the same frame as event.
      
      Note that only motion and scroll events record history, and motion
      events do it only if one of the mouse buttons is down, or the device
      has a tool.
      Returns: an
          array of time and coordinates
  */
  gdk.types.TimeCoord[] getHistory()
  {
    GdkTimeCoord* _cretval;
    uint _cretlength;
    _cretval = gdk_event_get_history(cast(GdkEvent*)this._cPtr, &_cretlength);
    gdk.types.TimeCoord[] _retval;

    if (_cretval)
    {
      _retval = new gdk.types.TimeCoord[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i];
    }
    return _retval;
  }

  /**
      Returns the modifier state field of an event.
      Returns: the modifier state of event
  */
  gdk.types.ModifierType getModifierState()
  {
    GdkModifierType _cretval;
    _cretval = gdk_event_get_modifier_state(cast(GdkEvent*)this._cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      Returns whether this event is an 'emulated' pointer event.
      
      Emulated pointer events typically originate from a touch events.
      Returns: true if this event is emulated
  */
  bool getPointerEmulated()
  {
    bool _retval;
    _retval = gdk_event_get_pointer_emulated(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Extract the event surface relative x/y coordinates from an event.
      
      This position is in [surface coordinates](coordinates.html).
  
      Params:
        x = location to put event surface x coordinate
        y = location to put event surface y coordinate
      Returns: 
  */
  bool getPosition(out double x, out double y)
  {
    bool _retval;
    _retval = gdk_event_get_position(cast(GdkEvent*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Returns the seat that originated the event.
      Returns: a [gdk.seat.Seat].
  */
  gdk.seat.Seat getSeat()
  {
    GdkSeat* _cretval;
    _cretval = gdk_event_get_seat(cast(GdkEvent*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
      Extracts the surface associated with an event.
      Returns: The [gdk.surface.Surface] associated with the event
  */
  gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_event_get_surface(cast(GdkEvent*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the timestamp of event.
      
      Not all events have timestamps. In that case, this function
      returns `GDK_CURRENT_TIME`.
      Returns: timestamp field from event
  */
  uint getTime()
  {
    uint _retval;
    _retval = gdk_event_get_time(cast(GdkEvent*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether a [gdk.event.Event] should trigger a context menu,
      according to platform conventions.
      
      The right mouse button typically triggers context menus.
      
      This function should always be used instead of simply checking for
      event->button == `GDK_BUTTON_SECONDARY`.
      Returns: true if the event should trigger a context menu.
  */
  bool triggersContextMenu()
  {
    bool _retval;
    _retval = gdk_event_triggers_context_menu(cast(GdkEvent*)this._cPtr);
    return _retval;
  }
}
