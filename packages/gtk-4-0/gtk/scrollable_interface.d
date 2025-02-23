module gtk.scrollable_interface;

import gid.gid;
import gobject.type_interface;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

class ScrollableInterface
{
  GtkScrollableInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ScrollableInterface");

    cInstance = *cast(GtkScrollableInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface baseIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkScrollableInterface*)cPtr).baseIface);
  }

  alias GetBorderFuncType = extern(C) bool function(GtkScrollable* scrollable, GtkBorder* border);

  @property GetBorderFuncType getBorder()
  {
    return (cast(GtkScrollableInterface*)cPtr).getBorder;
  }
}
