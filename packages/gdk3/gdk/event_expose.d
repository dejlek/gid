module gdk.event_expose;

import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.rectangle;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated when all or part of a window becomes visible and needs to be
  redrawn.
*/
class EventExpose
{
  GdkEventExpose cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventExpose");

    cInstance = *cast(GdkEventExpose*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventExpose*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventExpose*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventExpose*)cPtr).window, No.take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventExpose*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventExpose*)cPtr).sendEvent = propval;
  }

  @property gdk.rectangle.Rectangle area()
  {
    return new gdk.rectangle.Rectangle(cast(GdkRectangle*)&(cast(GdkEventExpose*)cPtr).area);
  }

  @property cairo.region.Region region()
  {
    return new cairo.region.Region(cast(cairo_region_t*)(cast(GdkEventExpose*)cPtr).region);
  }

  @property int count()
  {
    return (cast(GdkEventExpose*)cPtr).count;
  }

  @property void count(int propval)
  {
    (cast(GdkEventExpose*)cPtr).count = propval;
  }
}
