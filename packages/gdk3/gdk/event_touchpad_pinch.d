/// Module for [EventTouchpadPinch] class
module gdk.event_touchpad_pinch;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during touchpad swipe gestures.
*/
class EventTouchpadPinch
{
  GdkEventTouchpadPinch cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventTouchpadPinch");

    cInstance = *cast(GdkEventTouchpadPinch*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventTouchpadPinch*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadPinch*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventTouchpadPinch*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventTouchpadPinch*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).sendEvent = propval;
  }

  @property byte phase()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).phase;
  }

  @property void phase(byte propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).phase = propval;
  }

  @property byte nFingers()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).nFingers;
  }

  @property void nFingers(byte propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).nFingers = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).y = propval;
  }

  @property double dx()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).dx;
  }

  @property void dx(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).dx = propval;
  }

  @property double dy()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).dy;
  }

  @property void dy(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).dy = propval;
  }

  @property double angleDelta()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).angleDelta;
  }

  @property void angleDelta(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).angleDelta = propval;
  }

  @property double scale()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).scale;
  }

  @property void scale(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).scale = propval;
  }

  @property double xRoot()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventTouchpadPinch*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).yRoot = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouchpadPinch*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventTouchpadPinch*)cPtr).state = cast(GdkModifierType)propval;
  }
}
