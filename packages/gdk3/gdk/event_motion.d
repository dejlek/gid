/// Module for [EventMotion] class
module gdk.event_motion;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the pointer moves.
*/
class EventMotion
{
  GdkEventMotion cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventMotion");

    cInstance = *cast(GdkEventMotion*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventMotion*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventMotion*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventMotion*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventMotion*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventMotion*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventMotion*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventMotion*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventMotion*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventMotion*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventMotion*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventMotion*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventMotion*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventMotion*)cPtr).y = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventMotion*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventMotion*)cPtr).state = cast(GdkModifierType)propval;
  }

  @property short isHint()
  {
    return (cast(GdkEventMotion*)cPtr).isHint;
  }

  @property void isHint(short propval)
  {
    (cast(GdkEventMotion*)cPtr).isHint = propval;
  }

  @property gdk.device.Device device()
  {
    return cToD!(gdk.device.Device)(cast(void*)(cast(GdkEventMotion*)cPtr).device);
  }

  @property void device(gdk.device.Device propval)
  {
    cValueFree!(gdk.device.Device)(cast(void*)(cast(GdkEventMotion*)cPtr).device);
    dToC(propval, cast(void*)&(cast(GdkEventMotion*)cPtr).device);
  }

  @property double xRoot()
  {
    return (cast(GdkEventMotion*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventMotion*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventMotion*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventMotion*)cPtr).yRoot = propval;
  }
}
