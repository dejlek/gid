module gtk.fixed_child;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

class FixedChild
{
  GtkFixedChild cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.FixedChild");

    cInstance = *cast(GtkFixedChild*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.widget.Widget widget()
  {
    return ObjectG.getDObject!(gtk.widget.Widget)((cast(GtkFixedChild*)cPtr).widget, No.Take);
  }

  @property int x()
  {
    return (cast(GtkFixedChild*)cPtr).x;
  }

  @property void x(int propval)
  {
    (cast(GtkFixedChild*)cPtr).x = propval;
  }

  @property int y()
  {
    return (cast(GtkFixedChild*)cPtr).y;
  }

  @property void y(int propval)
  {
    (cast(GtkFixedChild*)cPtr).y = propval;
  }
}
