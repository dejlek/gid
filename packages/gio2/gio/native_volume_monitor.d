/// Module for [NativeVolumeMonitor] class
module gio.native_volume_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gio.volume_monitor;

/** */
class NativeVolumeMonitor : gio.volume_monitor.VolumeMonitor
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_native_volume_monitor_get_type != &gidSymbolNotFound ? g_native_volume_monitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NativeVolumeMonitor self()
  {
    return this;
  }
}
