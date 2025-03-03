module gdk.event_any;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
 * Contains the fields which are common to all event structs.
 * Any event pointer can safely be cast to a pointer to a #GdkEventAny to
 * access these fields.
 */
class EventAny
{
  GdkEventAny cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventAny");

    cInstance = *cast(GdkEventAny*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventAny*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventAny*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventAny*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventAny*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventAny*)cPtr).sendEvent = propval;
  }
}
