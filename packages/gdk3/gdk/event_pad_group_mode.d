module gdk.event_pad_group_mode;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;

/**
    Generated during [gdk.types.InputSource.TabletPad] mode switches in a group.
*/
class EventPadGroupMode
{
  GdkEventPadGroupMode cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventPadGroupMode");

    cInstance = *cast(GdkEventPadGroupMode*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventPadGroupMode*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return cToD!(gdk.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)cPtr).window);
  }

  @property void window(gdk.window.Window propval)
  {
    cValueFree!(gdk.window.Window)(cast(void*)(cast(GdkEventPadGroupMode*)cPtr).window);
    dToC(propval, cast(void*)&(cast(GdkEventPadGroupMode*)cPtr).window);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).sendEvent = propval;
  }

  @property uint time()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).time = propval;
  }

  @property uint group()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).group;
  }

  @property void group(uint propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).group = propval;
  }

  @property uint mode()
  {
    return (cast(GdkEventPadGroupMode*)cPtr).mode;
  }

  @property void mode(uint propval)
  {
    (cast(GdkEventPadGroupMode*)cPtr).mode = propval;
  }
}
