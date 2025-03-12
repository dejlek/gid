module gio.proxy_address_enumerator;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address_enumerator;
import gio.types;

/**
    [gio.proxy_address_enumerator.ProxyAddressEnumerator] is a wrapper around
  [gio.socket_address_enumerator.SocketAddressEnumerator] which takes the [gio.socket_address.SocketAddress]
  instances returned by the [gio.socket_address_enumerator.SocketAddressEnumerator]
  and wraps them in [gio.proxy_address.ProxyAddress] instances, using the given
  `property@Gio.ProxyAddressEnumerator:proxy-resolver`.
  
  This enumerator will be returned (for example, by
  [gio.socket_connectable.SocketConnectable.enumerate]) as appropriate when a proxy is
  configured; there should be no need to manually wrap a
  [gio.socket_address_enumerator.SocketAddressEnumerator] instance with one.
*/
class ProxyAddressEnumerator : gio.socket_address_enumerator.SocketAddressEnumerator
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_address_enumerator_get_type != &gidSymbolNotFound ? g_proxy_address_enumerator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ProxyAddressEnumerator self()
  {
    return this;
  }
}
