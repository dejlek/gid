module gdk.touch_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.gid;

/**
 * An event related to a touch-based device.
 */
class TouchEvent : Event
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.TouchEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
   * Extracts whether a touch event is emulating a pointer event.
   * Returns: %TRUE if event is emulating
   */
  bool getEmulatingPointer()
  {
    bool _retval;
    _retval = gdk_touch_event_get_emulating_pointer(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
