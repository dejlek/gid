module Gio.NativeVolumeMonitor;

import Gid.gid;
import Gio.Types;
import Gio.VolumeMonitor;
import Gio.c.functions;
import Gio.c.types;

class NativeVolumeMonitor : VolumeMonitor
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_native_volume_monitor_get_type != &gidSymbolNotFound ? g_native_volume_monitor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
