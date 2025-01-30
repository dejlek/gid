module Gio.NativeVolumeMonitor;

import Gid.gid;
import Gio.Types;
import Gio.VolumeMonitor;
import Gio.c.functions;
import Gio.c.types;

class NativeVolumeMonitor : VolumeMonitor
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_native_volume_monitor_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
