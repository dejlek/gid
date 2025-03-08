module gdk.event_pad_group_mode;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated during [gdk.types.InputSource.tabletPad] mode switches in a group.
*/
class EventPadGroupMode
{
  GdkEventPadGroupMode cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventPadGroupMode");

    cInstance = *cast(GdkEventPadGroupMode*)ptr;

    if (take)
      safeFree(ptr);
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
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventPadGroupMode*)cPtr).window, No.take);
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
