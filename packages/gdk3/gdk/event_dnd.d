/// Module for [EventDND] class
module gdk.event_dnd;

import gdk.c.functions;
import gdk.c.types;
import gdk.drag_context;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during DND operations.
*/
class EventDND
{
  GdkEventDND cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventDND");

    cInstance = *cast(GdkEventDND*)ptr;

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
    return cast(gdk.types.EventType)(cast(GdkEventDND*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventDND*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventDND*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventDND*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventDND*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventDND*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventDND*)cPtr).sendEvent = propval;
  }

  @property gdk.drag_context.DragContext context()
  {
    return cToD!(gdk.drag_context.DragContext)(cast(void*)(cast(GdkEventDND*)cPtr).context);
  }

  @property void context(gdk.drag_context.DragContext propval)
  {
    cValueFree!(gdk.drag_context.DragContext)(cast(void*)(cast(GdkEventDND*)cPtr).context);
    dToC(propval, cast(void*)&(cast(GdkEventDND*)cPtr).context);
  }

  @property uint time()
  {
    return (cast(GdkEventDND*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventDND*)cPtr).time = propval;
  }

  @property short xRoot()
  {
    return (cast(GdkEventDND*)cPtr).xRoot;
  }

  @property void xRoot(short propval)
  {
    (cast(GdkEventDND*)cPtr).xRoot = propval;
  }

  @property short yRoot()
  {
    return (cast(GdkEventDND*)cPtr).yRoot;
  }

  @property void yRoot(short propval)
  {
    (cast(GdkEventDND*)cPtr).yRoot = propval;
  }
}
