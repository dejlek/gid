module gdk.scroll_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event related to a scrolling motion.
*/
class ScrollEvent : gdk.event.Event
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.ScrollEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts the scroll deltas of a scroll event.
    
    The deltas will be zero unless the scroll direction
    is [gdk.types.ScrollDirection.smooth].
    
    For the representation unit of these deltas, see
    [gdk.scroll_event.ScrollEvent.getUnit].
    Params:
      deltaX =       return location for x scroll delta
      deltaY =       return location for y scroll delta
  */
  void getDeltas(out double deltaX, out double deltaY)
  {
    gdk_scroll_event_get_deltas(cast(GdkEvent*)cPtr, cast(double*)&deltaX, cast(double*)&deltaY);
  }

  /**
      Extracts the direction of a scroll event.
    Returns:     the scroll direction of event
  */
  gdk.types.ScrollDirection getDirection()
  {
    GdkScrollDirection _cretval;
    _cretval = gdk_scroll_event_get_direction(cast(GdkEvent*)cPtr);
    gdk.types.ScrollDirection _retval = cast(gdk.types.ScrollDirection)_cretval;
    return _retval;
  }

  /**
      Extracts the scroll delta unit of a scroll event.
    
    The unit will always be [gdk.types.ScrollUnit.wheel] if the scroll direction is not
    [gdk.types.ScrollDirection.smooth].
    Returns:     the scroll unit.
  */
  gdk.types.ScrollUnit getUnit()
  {
    GdkScrollUnit _cretval;
    _cretval = gdk_scroll_event_get_unit(cast(GdkEvent*)cPtr);
    gdk.types.ScrollUnit _retval = cast(gdk.types.ScrollUnit)_cretval;
    return _retval;
  }

  /**
      Check whether a scroll event is a stop scroll event.
    
    Scroll sequences with smooth scroll information may provide
    a stop scroll event once the interaction with the device finishes,
    e.g. by lifting a finger. This stop scroll event is the signal
    that a widget may trigger kinetic scrolling based on the current
    velocity.
    
    Stop scroll events always have a delta of 0/0.
    Returns:     true if the event is a scroll stop event
  */
  bool isStop()
  {
    bool _retval;
    _retval = gdk_scroll_event_is_stop(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
