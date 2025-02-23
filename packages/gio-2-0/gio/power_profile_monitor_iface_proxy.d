module gio.power_profile_monitor_iface_proxy;

import gobject.object;
import gio.power_profile_monitor;
import gio.power_profile_monitor_mixin;

/// Proxy object for Gio.PowerProfileMonitor interface when a GObject has no applicable D binding
class PowerProfileMonitorIfaceProxy : IfaceProxy, PowerProfileMonitor
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(PowerProfileMonitor);
  }

  mixin PowerProfileMonitorT!();
}
