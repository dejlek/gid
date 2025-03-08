module gdk.event_configure;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated when a window size or position has changed.
*/
class EventConfigure
{
  GdkEventConfigure cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventConfigure");

    cInstance = *cast(GdkEventConfigure*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventConfigure*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventConfigure*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventConfigure*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventConfigure*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventConfigure*)cPtr).sendEvent = propval;
  }

  @property int x()
  {
    return (cast(GdkEventConfigure*)cPtr).x;
  }

  @property void x(int propval)
  {
    (cast(GdkEventConfigure*)cPtr).x = propval;
  }

  @property int y()
  {
    return (cast(GdkEventConfigure*)cPtr).y;
  }

  @property void y(int propval)
  {
    (cast(GdkEventConfigure*)cPtr).y = propval;
  }

  @property int width()
  {
    return (cast(GdkEventConfigure*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(GdkEventConfigure*)cPtr).width = propval;
  }

  @property int height()
  {
    return (cast(GdkEventConfigure*)cPtr).height;
  }

  @property void height(int propval)
  {
    (cast(GdkEventConfigure*)cPtr).height = propval;
  }
}
