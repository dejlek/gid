module Gio.ProxyResolverIfaceProxy;

import GObject.ObjectG;
import Gio.ProxyResolver;
import Gio.ProxyResolverT;

/// Proxy object for Gio.ProxyResolver interface when a GObject has no applicable D binding
class ProxyResolverIfaceProxy : IfaceProxy, ProxyResolver
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
    return typeid(ProxyResolver);
  }

  mixin ProxyResolverT!();
}
