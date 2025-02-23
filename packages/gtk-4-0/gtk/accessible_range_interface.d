module gtk.accessible_range_interface;

import gid.gid;
import gobject.type_interface;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

class AccessibleRangeInterface
{
  GtkAccessibleRangeInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.AccessibleRangeInterface");

    cInstance = *cast(GtkAccessibleRangeInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface gIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkAccessibleRangeInterface*)cPtr).gIface);
  }

  alias SetCurrentValueFuncType = extern(C) bool function(GtkAccessibleRange* self, double value);

  @property SetCurrentValueFuncType setCurrentValue()
  {
    return (cast(GtkAccessibleRangeInterface*)cPtr).setCurrentValue;
  }
}
