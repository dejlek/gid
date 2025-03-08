module gdk.event_pad_axis;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated during [gdk.types.InputSource.tabletPad] interaction with tactile sensors.
*/
class EventPadAxis
{
  GdkEventPadAxis cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventPadAxis");

    cInstance = *cast(GdkEventPadAxis*)ptr;

    if (take)
      safeFree(ptr);
  }

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
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventPadAxis*)cPtr).window, No.take);
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
