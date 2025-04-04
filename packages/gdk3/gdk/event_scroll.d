/// Module for [EventScroll] class
module gdk.event_scroll;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated from button presses for the buttons 4 to 7. Wheel mice are
    usually configured to generate button press events for buttons 4 and 5
    when the wheel is turned.
    
    Some GDK backends can also generate “smooth” scroll events, which
    can be recognized by the [gdk.types.ScrollDirection.Smooth] scroll direction. For
    these, the scroll deltas can be obtained with
    [gdk.event.Event.getScrollDeltas].
*/
class EventScroll
{
  GdkEventScroll cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventScroll");

    cInstance = *cast(GdkEventScroll*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventScroll*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventScroll*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventScroll*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventScroll*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventScroll*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventScroll*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventScroll*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventScroll*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventScroll*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventScroll*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventScroll*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventScroll*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventScroll*)cPtr).y = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventScroll*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventScroll*)cPtr).state = cast(GdkModifierType)propval;
  }

  @property gdk.types.ScrollDirection direction()
  {
    return cast(gdk.types.ScrollDirection)(cast(GdkEventScroll*)cPtr).direction;
  }

  @property void direction(gdk.types.ScrollDirection propval)
  {
    (cast(GdkEventScroll*)cPtr).direction = cast(GdkScrollDirection)propval;
  }

  @property gdk.device.Device device()
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventScroll*)cPtr).device);
  }

  @property void device(gdk.device.Device propval)
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventScroll*)cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventScroll*)cPtr).device);
  }

  @property double xRoot()
  {
    return (cast(GdkEventScroll*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventScroll*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventScroll*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventScroll*)cPtr).yRoot = propval;
  }

  @property double deltaX()
  {
    return (cast(GdkEventScroll*)cPtr).deltaX;
  }

  @property void deltaX(double propval)
  {
    (cast(GdkEventScroll*)cPtr).deltaX = propval;
  }

  @property double deltaY()
  {
    return (cast(GdkEventScroll*)cPtr).deltaY;
  }

  @property void deltaY(double propval)
  {
    (cast(GdkEventScroll*)cPtr).deltaY = propval;
  }

  @property uint isStop()
  {
    return (cast(GdkEventScroll*)cPtr).isStop;
  }

  @property void isStop(uint propval)
  {
    (cast(GdkEventScroll*)cPtr).isStop = propval;
  }
}
