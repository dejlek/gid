module Gio.NativeVolumeMonitorClass;

import Gid.gid;
import Gio.Types;
import Gio.VolumeMonitorClass;
import Gio.c.functions;
import Gio.c.types;

class NativeVolumeMonitorClass
{
  GNativeVolumeMonitorClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.NativeVolumeMonitorClass");

    cInstance = *cast(GNativeVolumeMonitorClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property VolumeMonitorClass parentClass()
  {
    return new VolumeMonitorClass(cast(GVolumeMonitorClass*)&(cast(GNativeVolumeMonitorClass*)cPtr).parentClass);
  }
}
