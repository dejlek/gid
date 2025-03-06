module gdk.event_touch;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.event_sequence;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Used for touch events.
  @type field will be one of [gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
  [gdk.types.EventType.TouchEnd] or [gdk.types.EventType.TouchCancel].
  
  Touch events are grouped into sequences by means of the @sequence
  field, which can also be obtained with [gdk.event.Event.getEventSequence].
  Each sequence begins with a [gdk.types.EventType.TouchBegin] event, followed by
  any number of [gdk.types.EventType.TouchUpdate] events, and ends with a [gdk.types.EventType.TouchEnd]
  (or [gdk.types.EventType.TouchCancel]) event. With multitouch devices, there may be
  several active sequences at the same time.
*/
class EventTouch
{
  GdkEventTouch cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventTouch");

    cInstance = *cast(GdkEventTouch*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventTouch*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventTouch*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventTouch*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventTouch*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventTouch*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventTouch*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventTouch*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventTouch*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventTouch*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventTouch*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventTouch*)cPtr).y = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventTouch*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventTouch*)cPtr).state = cast(GdkModifierType)propval;
  }

  @property gdk.event_sequence.EventSequence sequence()
  {
    return new gdk.event_sequence.EventSequence(cast(GdkEventSequence*)(cast(GdkEventTouch*)cPtr).sequence);
  }

  @property bool emulatingPointer()
  {
    return (cast(GdkEventTouch*)cPtr).emulatingPointer;
  }

  @property void emulatingPointer(bool propval)
  {
    (cast(GdkEventTouch*)cPtr).emulatingPointer = propval;
  }

  @property gdk.device.Device device()
  {
    return ObjectG.getDObject!(gdk.device.Device)((cast(GdkEventTouch*)cPtr).device, No.Take);
  }

  @property double xRoot()
  {
    return (cast(GdkEventTouch*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventTouch*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventTouch*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventTouch*)cPtr).yRoot = propval;
  }
}
