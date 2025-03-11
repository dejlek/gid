module gtk.accel_group_entry;

import gid.gid;
import glib.types;
import gobject.closure;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class AccelGroupEntry
{
  GtkAccelGroupEntry cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.AccelGroupEntry");

    cInstance = *cast(GtkAccelGroupEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.types.AccelKey key()
  {
    return cToD!(gtk.types.AccelKey)(cast(void*)&(cast(GtkAccelGroupEntry*)cPtr).key);
  }

  @property void key(gtk.types.AccelKey propval)
  {
    (cast(GtkAccelGroupEntry*)cPtr).key = propval;
  }

  @property gobject.closure.Closure closure()
  {
    return cToD!(gobject.closure.Closure)(cast(void*)(cast(GtkAccelGroupEntry*)cPtr).closure);
  }

  @property void closure(gobject.closure.Closure propval)
  {
    cValueFree!(gobject.closure.Closure)(cast(void*)(cast(GtkAccelGroupEntry*)cPtr).closure);
    dToC(propval, cast(void*)&(cast(GtkAccelGroupEntry*)cPtr).closure);
  }

  @property glib.types.Quark accelPathQuark()
  {
    return (cast(GtkAccelGroupEntry*)cPtr).accelPathQuark;
  }

  @property void accelPathQuark(glib.types.Quark propval)
  {
    (cast(GtkAccelGroupEntry*)cPtr).accelPathQuark = propval;
  }
}
