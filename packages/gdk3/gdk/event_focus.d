/// Module for [EventFocus] class
module gdk.event_focus;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Describes a change of keyboard focus.
*/
class EventFocus
{
  GdkEventFocus cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventFocus");

    cInstance = *cast(GdkEventFocus*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventFocus*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventFocus*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventFocus*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventFocus*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventFocus*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventFocus*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventFocus*)cPtr).sendEvent = propval;
  }

  @property short in_()
  {
    return (cast(GdkEventFocus*)cPtr).in_;
  }

  @property void in_(short propval)
  {
    (cast(GdkEventFocus*)cPtr).in_ = propval;
  }
}
