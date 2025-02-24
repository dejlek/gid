module gio.proxy_iface_proxy;

import gobject.object;
import gio.proxy;
import gio.proxy_mixin;

/// Proxy object for Gio.Proxy interface when a GObject has no applicable D binding
class ProxyIfaceProxy : IfaceProxy, Proxy
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Proxy);
  }

  mixin ProxyT!();
}
