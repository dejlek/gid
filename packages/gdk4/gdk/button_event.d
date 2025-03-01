module gdk.button_event;

import gdk.c.functions;
import gdk.c.types;
import gdk.event;
import gdk.types;
import gid.global;

/**
 * An event related to a button on a pointer device.
 */
class ButtonEvent : Event
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.ButtonEvent");

    super(cast(GdkEvent*)ptr, take);
  }

  /**
   * Extract the button number from a button event.
   * Returns: the button of event
   */
  uint getButton()
  {
    uint _retval;
    _retval = gdk_button_event_get_button(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
