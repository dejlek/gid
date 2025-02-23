module gdk.focus_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
 * An event related to a keyboard focus change.
 */
class FocusEvent : Event
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.FocusEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
   * Extracts whether this event is about focus entering or
   * leaving the surface.
   * Returns: %TRUE of the focus is entering
   */
  bool getIn()
  {
    bool _retval;
    _retval = gdk_focus_event_get_in(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
