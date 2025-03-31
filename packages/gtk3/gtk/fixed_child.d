/// Module for [FixedChild] class
module gtk.fixed_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/** */
class FixedChild
{
  GtkFixedChild cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.FixedChild");

    cInstance = *cast(GtkFixedChild*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.widget.Widget widget()
  {
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)cPtr).widget);
  }

  @property void widget(gtk.widget.Widget propval)
  {
    cValueFree!(gtk.widget.Widget)(cast(void*)(cast(GtkFixedChild*)cPtr).widget);
    dToC(propval, cast(void*)&(cast(GtkFixedChild*)cPtr).widget);
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
