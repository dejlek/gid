module gdk.event_property;

import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
 * Describes a property change on a window.
 */
class EventProperty
{
  GdkEventProperty cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.EventProperty");

    cInstance = *cast(GdkEventProperty*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEventProperty*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEventProperty*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.window.Window window()
  {
    return ObjectG.getDObject!(gdk.window.Window)((cast(GdkEventProperty*)cPtr).window, No.Take);
  }

  @property byte sendEvent()
  {
    return (cast(GdkEventProperty*)cPtr).sendEvent;
  }

  @property void sendEvent(byte propval)
  {
    (cast(GdkEventProperty*)cPtr).sendEvent = propval;
  }

  @property gdk.atom.Atom atom()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GdkEventProperty*)cPtr).atom);
  }

  @property uint time()
  {
    return (cast(GdkEventProperty*)cPtr).time;
  }

  @property void time(uint propval)
  {
    (cast(GdkEventProperty*)cPtr).time = propval;
  }

  @property gdk.types.PropertyState state()
  {
    return cast(gdk.types.PropertyState)(cast(GdkEventProperty*)cPtr).state;
  }

  @property void state(gdk.types.PropertyState propval)
  {
    (cast(GdkEventProperty*)cPtr).state = cast(GdkPropertyState)propval;
  }
}
