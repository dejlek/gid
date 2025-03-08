module gdk.event_owner_change;

import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
    Generated when the owner of a selection changes. On X11, this
  information is only available if the X server supports the XFIXES
  extension.
*/
class EventOwnerChange
{
  GdkEventOwnerChange cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventOwnerChange");

    cInstance = *cast(GdkEventOwnerChange*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventOwnerChange*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventOwnerChange*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventOwnerChange*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).sendEvent = propval;
  }

  @property gdk.window.Window owner()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventOwnerChange*)cPtr).owner, No.Take);
  }

  @property gdk.types.OwnerChange reason()
  {
    return cast(gdk.types.OwnerChange)(cast(GdkEventOwnerChange*)cPtr).reason;
  }

  @property void reason(gdk.types.OwnerChange propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).reason = cast(GdkOwnerChange)propval;
  }

  @property gdk.atom.Atom selection()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventOwnerChange*)cPtr).selection);
  }

  @property uint time()
  {
    return (cast(GdkEventOwnerChange*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).time = propval;
  }

  @property uint selectionTime()
  {
    return (cast(GdkEventOwnerChange*)cPtr).selectionTime;
  }

  @property void selectionTime(uint propval)
  {
    (cast(GdkEventOwnerChange*)cPtr).selectionTime = propval;
  }
}
