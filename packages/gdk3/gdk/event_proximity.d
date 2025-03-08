module gdk.event_proximity;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Proximity events are generated when using GDK’s wrapper for the
  XInput extension. The XInput extension is an add-on for standard X
  that allows you to use nonstandard devices such as graphics tablets.
  A proximity event indicates that the stylus has moved in or out of
  contact with the tablet, or perhaps that the user’s finger has moved
  in or out of contact with a touch screen.
  
  This event type will be used pretty rarely. It only is important for
  XInput aware programs that are drawing their own cursor.
*/
class EventProximity
{
  GdkEventProximity cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventProximity");

    cInstance = *cast(GdkEventProximity*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventProximity*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventProximity*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventProximity*)cPtr).window, No.take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventProximity*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventProximity*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventProximity*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventProximity*)cPtr).time = propval;
  }

  @property gdk.device.Device device()
  {
    return ObjectG.getDObject!(gdk.device.Device)((cast(GdkEventProximity*)cPtr).device, No.take);
  }
}
