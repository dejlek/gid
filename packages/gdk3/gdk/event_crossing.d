/// Module for [EventCrossing] class
module gdk.event_crossing;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated when the pointer enters or leaves a window.
*/
class EventCrossing
{
  GdkEventCrossing cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventCrossing");

    cInstance = *cast(GdkEventCrossing*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventCrossing*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventCrossing*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventCrossing*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventCrossing*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventCrossing*)cPtr).sendEvent = propval;
  }

  @property gdk.window.Window subwindow()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)cPtr).subwindow);
  }

  @property void subwindow(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventCrossing*)cPtr).subwindow);
    dToC(propval, cast(void*)&(cast(GdkEventCrossing*)cPtr).subwindow);
  }

  @property uint time()
  {
    return (cast(GdkEventCrossing*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventCrossing*)cPtr).time = propval;
  }

  @property double x()
  {
    return (cast(GdkEventCrossing*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(GdkEventCrossing*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(GdkEventCrossing*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(GdkEventCrossing*)cPtr).y = propval;
  }

  @property double xRoot()
  {
    return (cast(GdkEventCrossing*)cPtr).xRoot;
  }

  @property void xRoot(double propval)
  {
    (cast(GdkEventCrossing*)cPtr).xRoot = propval;
  }

  @property double yRoot()
  {
    return (cast(GdkEventCrossing*)cPtr).yRoot;
  }

  @property void yRoot(double propval)
  {
    (cast(GdkEventCrossing*)cPtr).yRoot = propval;
  }

  @property gdk.types.CrossingMode mode()
  {
    return cast(gdk.types.CrossingMode)(cast(GdkEventCrossing*)cPtr).mode;
  }

  @property void mode(gdk.types.CrossingMode propval)
  {
    (cast(GdkEventCrossing*)cPtr).mode = cast(GdkCrossingMode)propval;
  }

  @property gdk.types.NotifyType detail()
  {
    return cast(gdk.types.NotifyType)(cast(GdkEventCrossing*)cPtr).detail;
  }

  @property void detail(gdk.types.NotifyType propval)
  {
    (cast(GdkEventCrossing*)cPtr).detail = cast(GdkNotifyType)propval;
  }

  @property bool focus()
  {
    return (cast(GdkEventCrossing*)cPtr).focus;
  }

  @property void focus(bool propval)
  {
    (cast(GdkEventCrossing*)cPtr).focus = propval;
  }

  @property gdk.types.ModifierType state()
  {
    return cast(gdk.types.ModifierType)(cast(GdkEventCrossing*)cPtr).state;
  }

  @property void state(gdk.types.ModifierType propval)
  {
    (cast(GdkEventCrossing*)cPtr).state = cast(GdkModifierType)propval;
  }
}
