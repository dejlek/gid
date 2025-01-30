module Gtk.MountOperationClass;

import Gid.gid;
import Gio.MountOperationClass : DGioMountOperationClass = MountOperationClass;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

class MountOperationClass
{
  GtkMountOperationClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.MountOperationClass");

    cInstance = *cast(GtkMountOperationClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DGioMountOperationClass parentClass()
  {
    return new DGioMountOperationClass(cast(GMountOperationClass*)&(cast(GtkMountOperationClass*)cPtr).parentClass);
  }
}
