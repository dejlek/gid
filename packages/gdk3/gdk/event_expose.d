module gdk.event_expose;

import cairo.region;
import gdk.c.functions;
import gdk.c.types;
import gdk.rectangle;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when all or part of a window becomes visible and needs to be
  redrawn.
*/
class EventExpose
{
  GdkEventExpose cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventExpose");

    cInstance = *cast(GdkEventExpose*)ptr;

    if (take)
      gFree(ptr);
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
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventExpose*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventExpose*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventExpose*)cPtr).window);
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
    return cToD!(gdk.rectangle.Rectangle)(cast(void*)&(cast(GdkEventExpose*)cPtr).area);
  }

  @property cairo.region.Region region()
  {
    return cToD!(cairo.region.Region)(cast(void*)(cast(GdkEventExpose*)cPtr).region);
  }

  @property void region(cairo.region.Region propval)
  {
    cValueFree!(cairo.region.Region)(cast(void*)(cast(GdkEventExpose*)cPtr).region);
    dToC(propval, cast(void*)&(cast(GdkEventExpose*)cPtr).region);
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
