module gdk.event_selection;

import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
 * Generated when a selection is requested or ownership of a selection
 * is taken over by another client application.
 */
class EventSelection
{
  GdkEventSelection cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventSelection");

    cInstance = *cast(GdkEventSelection*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventSelection*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventSelection*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventSelection*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventSelection*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventSelection*)cPtr).sendEvent = propval;
  }

  @property gdk.atom.Atom selection()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)cPtr).selection);
  }

  @property gdk.atom.Atom target()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)cPtr).target);
  }

  @property gdk.atom.Atom property()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventSelection*)cPtr).property);
  }

  @property uint time()
  {
    return (cast(GdkEventSelection*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventSelection*)cPtr).time = propval;
  }

  @property gdk.window.Window requestor()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventSelection*)cPtr).requestor, No.Take);
  }
}
