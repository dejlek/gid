module gdk.event_window_state;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated when the state of a toplevel window changes.
*/
class EventWindowState
{
  GdkEventWindowState cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventWindowState");

    cInstance = *cast(GdkEventWindowState*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventWindowState*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventWindowState*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventWindowState*)cPtr).window, No.take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventWindowState*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventWindowState*)cPtr).sendEvent = propval;
  }

  @property gdk.types.WindowState changedMask()
  {
    return cast(gdk.types.WindowState)(cast(GdkEventWindowState*)cPtr).changedMask;
  }

  @property void changedMask(gdk.types.WindowState propval)
  {
    (cast(GdkEventWindowState*)cPtr).changedMask = cast(GdkWindowState)propval;
  }

  @property gdk.types.WindowState newWindowState()
  {
    return cast(gdk.types.WindowState)(cast(GdkEventWindowState*)cPtr).newWindowState;
  }

  @property void newWindowState(gdk.types.WindowState propval)
  {
    (cast(GdkEventWindowState*)cPtr).newWindowState = cast(GdkWindowState)propval;
  }
}
