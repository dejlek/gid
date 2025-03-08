module gtk.__mount_operation_handler_skeleton;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #_GtkMountOperationHandlerSkeleton structure contains only private data and should only be accessed using the provided API.
*/
class MountOperationHandlerSkeleton
{
  _GtkMountOperationHandlerSkeleton cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.MountOperationHandlerSkeleton");

    cInstance = *cast(_GtkMountOperationHandlerSkeleton*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
