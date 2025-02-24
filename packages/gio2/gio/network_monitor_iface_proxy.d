module gio.network_monitor_iface_proxy;

import gobject.object;
import gio.network_monitor;
import gio.network_monitor_mixin;

/// Proxy object for Gio.NetworkMonitor interface when a GObject has no applicable D binding
class NetworkMonitorIfaceProxy : IfaceProxy, NetworkMonitor
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(NetworkMonitor);
  }

  mixin NetworkMonitorT!();
}
