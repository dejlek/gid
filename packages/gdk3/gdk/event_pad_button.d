/// Module for [EventPadButton] class
module gdk.event_pad_button;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] button presses and releases.
*/
class EventPadButton
{
  GdkEventPadButton cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventPadButton");

    cInstance = *cast(GdkEventPadButton*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadButton*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadButton*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadButton*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadButton*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadButton*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventPadButton*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadButton*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventPadButton*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).time = propval;
  }

  @property uint group()
  {
    return (cast(GdkEventPadButton*)cPtr).group;
  }

  @property void group(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).group = propval;
  }

  @property uint button()
  {
    return (cast(GdkEventPadButton*)cPtr).button;
  }

  @property void button(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).button = propval;
  }

  @property uint mode()
  {
    return (cast(GdkEventPadButton*)cPtr).mode;
  }

  @property void mode(uint propval)
  {
    (cast(GdkEventPadButton*)cPtr).mode = propval;
  }
}
