module gdk.event_button;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Used for button press and button release events. The
  @type field will be one of [gdk.types.EventType.buttonPress],
  [gdk.types.EventType._2buttonPress], [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.buttonRelease],
  
  Double and triple-clicks result in a sequence of events being received.
  For double-clicks the order of events will be:
  
  $(LIST
    * [gdk.types.EventType.buttonPress]
    * [gdk.types.EventType.buttonRelease]
    * [gdk.types.EventType.buttonPress]
    * [gdk.types.EventType._2buttonPress]
    * [gdk.types.EventType.buttonRelease]
  )
    
  Note that the first click is received just like a normal
  button press, while the second click results in a [gdk.types.EventType._2buttonPress]
  being received just after the [gdk.types.EventType.buttonPress].
  
  Triple-clicks are very similar to double-clicks, except that
  [gdk.types.EventType._3buttonPress] is inserted after the third click. The order of the
  events is:
  
  $(LIST
    * [gdk.types.EventType.buttonPress]
    * [gdk.types.EventType.buttonRelease]
    * [gdk.types.EventType.buttonPress]
    * [gdk.types.EventType._2buttonPress]
    * [gdk.types.EventType.buttonRelease]
    * [gdk.types.EventType.buttonPress]
    * [gdk.types.EventType._3buttonPress]
    * [gdk.types.EventType.buttonRelease]
  )
    
  For a double click to occur, the second button press must occur within
  1/4 of a second of the first. For a triple click to occur, the third
  button press must also occur within 1/2 second of the first button press.
*/
class EventButton
{
  GdkEventButton cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventButton");

    cInstance = *cast(GdkEventButton*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventButton*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventButton*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventButton*)cPtr).window, No.take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventButton*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventButton*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventButton*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventButton*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventButton*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventButton*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventButton*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventButton*)cPtr).y = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventButton*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventButton*)cPtr).state = cast(GdkModifierType)propval;
  }

  @property uint button()
  {
    return (cast(GdkEventButton*)cPtr).button;
  }

  @property void button(uint propval)
  {
    (cast(GdkEventButton*)cPtr).button = propval;
  }

  @property gdk.device.Device device()
  {
    return ObjectG.getDObject!(gdk.device.Device)((cast(GdkEventButton*)cPtr).device, No.take);
  }

  @property double xRoot()
  {
    return (cast(GdkEventButton*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventButton*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventButton*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventButton*)cPtr).yRoot = propval;
  }
}
