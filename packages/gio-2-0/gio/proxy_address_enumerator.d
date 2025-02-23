module gio.proxy_address_enumerator;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address_enumerator;
import gio.types;

/**
 * `GProxyAddressEnumerator` is a wrapper around
 * [Gio.SocketAddressEnumerator] which takes the [Gio.SocketAddress]
 * instances returned by the [Gio.SocketAddressEnumerator]
 * and wraps them in [Gio.ProxyAddress] instances, using the given
 * property@Gio.ProxyAddressEnumerator:proxy-resolver.
 * This enumerator will be returned $(LPAREN)for example, by
 * [Gio.SocketConnectable.enumerate]$(RPAREN) as appropriate when a proxy is
 * configured; there should be no need to manually wrap a
 * [Gio.SocketAddressEnumerator] instance with one.
 */
class ProxyAddressEnumerator : SocketAddressEnumerator
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_address_enumerator_get_type != &gidSymbolNotFound ? g_proxy_address_enumerator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
