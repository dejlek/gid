module gdk.crossing_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
    An event caused by a pointing device moving between surfaces.
*/
class CrossingEvent : gdk.event.Event
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.CrossingEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
      Extracts the notify detail from a crossing event.
    Returns:     the notify detail of event
  */
  gdk.types.NotifyType getDetail()
  {
    GdkNotifyType _cretval;
    _cretval = gdk_crossing_event_get_detail(cast(GdkEvent*)cPtr);
    gdk.types.NotifyType _retval = cast(gdk.types.NotifyType)_cretval;
    return _retval;
  }

  /**
      Checks if the event surface is the focus surface.
    Returns:     true if the surface is the focus surface
  */
  bool getFocus()
  {
    bool _retval;
    _retval = gdk_crossing_event_get_focus(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
      Extracts the crossing mode from a crossing event.
    Returns:     the mode of event
  */
  gdk.types.CrossingMode getMode()
  {
    GdkCrossingMode _cretval;
    _cretval = gdk_crossing_event_get_mode(cast(GdkEvent*)cPtr);
    gdk.types.CrossingMode _retval = cast(gdk.types.CrossingMode)_cretval;
    return _retval;
  }
}
