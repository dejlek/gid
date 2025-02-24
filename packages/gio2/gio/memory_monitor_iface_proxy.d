module gio.memory_monitor_iface_proxy;

import gobject.object;
import gio.memory_monitor;
import gio.memory_monitor_mixin;

/// Proxy object for Gio.MemoryMonitor interface when a GObject has no applicable D binding
class MemoryMonitorIfaceProxy : IfaceProxy, MemoryMonitor
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(MemoryMonitor);
  }

  mixin MemoryMonitorT!();
}
