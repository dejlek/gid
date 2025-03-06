module gtk.__mount_operation_handler_proxy;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #_GtkMountOperationHandlerProxy structure contains only private data and should only be accessed using the provided API.
*/
class MountOperationHandlerProxy
{
  _GtkMountOperationHandlerProxy cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.MountOperationHandlerProxy");

    cInstance = *cast(_GtkMountOperationHandlerProxy*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
