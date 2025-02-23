module gio.debug_controller_interface;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
 * The virtual function table for #GDebugController.
 */
class DebugControllerInterface
{
  GDebugControllerInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DebugControllerInterface");

    cInstance = *cast(GDebugControllerInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
