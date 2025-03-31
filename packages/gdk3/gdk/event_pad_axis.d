/// Module for [EventPadAxis] class
module gdk.event_pad_axis;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] interaction with tactile sensors.
*/
class EventPadAxis
{
  GdkEventPadAxis cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventPadAxis");

    cInstance = *cast(GdkEventPadAxis*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventPadAxis*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadAxis*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadAxis*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadAxis*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadAxis*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventPadAxis*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadAxis*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventPadAxis*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventPadAxis*)cPtr).time = propval;
  }

  @property uint group()
  {
    return (cast(GdkEventPadAxis*)cPtr).group;
  }

  @property void group(uint propval)
  {
    (cast(GdkEventPadAxis*)cPtr).group = propval;
  }

  @property uint index()
  {
    return (cast(GdkEventPadAxis*)cPtr).index;
  }

  @property void index(uint propval)
  {
    (cast(GdkEventPadAxis*)cPtr).index = propval;
  }

  @property uint mode()
  {
    return (cast(GdkEventPadAxis*)cPtr).mode;
  }

  @property void mode(uint propval)
  {
    (cast(GdkEventPadAxis*)cPtr).mode = propval;
  }

  @property double value()
  {
    return (cast(GdkEventPadAxis*)cPtr).value;
  }

  @property void value(double propval)
  {
    (cast(GdkEventPadAxis*)cPtr).value = propval;
  }
}
