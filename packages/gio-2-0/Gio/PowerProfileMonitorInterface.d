module Gio.PowerProfileMonitorInterface;

import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * The virtual function table for #GPowerProfileMonitor.
 */
class PowerProfileMonitorInterface
{
  GPowerProfileMonitorInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.PowerProfileMonitorInterface");

    cInstance = *cast(GPowerProfileMonitorInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
