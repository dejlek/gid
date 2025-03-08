module gdk.event_dnd;

import gdk.c.functions;
import gdk.c.types;
import gdk.drag_context;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated during DND operations.
*/
class EventDND
{
  GdkEventDND cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventDND");

    cInstance = *cast(GdkEventDND*)ptr;

    if (take)
      safeFree(ptr);
  }

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
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventDND*)cPtr).window, No.Take);
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
    return ObjectG.getDObject!(gdk.drag_context.DragContext)((cast(GdkEventDND*)cPtr).context, No.Take);
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
