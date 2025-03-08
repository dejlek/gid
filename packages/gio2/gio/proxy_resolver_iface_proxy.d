module gio.proxy_resolver_iface_proxy;

import gobject.object;
import gio.proxy_resolver;
import gio.proxy_resolver_mixin;

/// Proxy object for Gio.ProxyResolver interface when a GObject has no applicable D binding
class ProxyResolverIfaceProxy : IfaceProxy, gio.proxy_resolver.ProxyResolver
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.proxy_resolver.ProxyResolver);
  }

  mixin ProxyResolverT!();
}
