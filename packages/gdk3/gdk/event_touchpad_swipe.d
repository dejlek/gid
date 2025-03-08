module gdk.event_touchpad_swipe;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated during touchpad swipe gestures.
*/
class EventTouchpadSwipe
{
  GdkEventTouchpadSwipe cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventTouchpadSwipe");

    cInstance = *cast(GdkEventTouchpadSwipe*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouchpadSwipe*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventTouchpadSwipe*)cPtr).window, No.take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).sendEvent = propval;
  }

  @property byte phase()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).phase;
  }

  @property void phase(byte propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).phase = propval;
  }

  @property byte nFingers()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).nFingers;
  }

  @property void nFingers(byte propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).nFingers = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).y = propval;
  }

  @property double dx()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).dx;
  }

  @property void dx(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).dx = propval;
  }

  @property double dy()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).dy;
  }

  @property void dy(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).dy = propval;
  }

  @property double xRoot()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventTouchpadSwipe*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).yRoot = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouchpadSwipe*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventTouchpadSwipe*)cPtr).state = cast(GdkModifierType)propval;
  }
}
