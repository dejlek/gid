module Gio.PowerProfileMonitorIfaceProxy;

import GObject.ObjectG;
import Gio.PowerProfileMonitor;
import Gio.PowerProfileMonitorT;

/// Proxy object for Gio.PowerProfileMonitor interface when a GObject has no applicable D binding
class PowerProfileMonitorIfaceProxy : IfaceProxy, PowerProfileMonitor
{
  this()
  {
  }

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
