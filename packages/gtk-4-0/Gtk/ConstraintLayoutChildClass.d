module Gtk.ConstraintLayoutChildClass;

import Gid.gid;
import Gtk.LayoutChildClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class ConstraintLayoutChildClass
{
  GtkConstraintLayoutChildClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ConstraintLayoutChildClass");

    cInstance = *cast(GtkConstraintLayoutChildClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property LayoutChildClass parentClass()
  {
    return new LayoutChildClass(cast(GtkLayoutChildClass*)&(cast(GtkConstraintLayoutChildClass*)cPtr).parentClass);
  }
}
