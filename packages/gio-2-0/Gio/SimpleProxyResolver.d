module Gio.SimpleProxyResolver;

import GObject.ObjectG;
import Gid.gid;
import Gio.ProxyResolver;
import Gio.ProxyResolverT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GSimpleProxyResolver` is a simple [Gio.ProxyResolver] implementation
 * that handles a single default proxy, multiple URI-scheme-specific
 * proxies, and a list of hosts that proxies should not be used for.
 * `GSimpleProxyResolver` is never the default proxy resolver, but it
 * can be used as the base class for another proxy resolver
 * implementation, or it can be created and used manually, such as
 * with [Gio.SocketClient.setProxyResolver].
 */
class SimpleProxyResolver : ObjectG, ProxyResolver
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_simple_proxy_resolver_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ProxyResolverT!();

  /**
   * Creates a new #GSimpleProxyResolver. See
   * #GSimpleProxyResolver:default-proxy and
   * #GSimpleProxyResolver:ignore-hosts for more details on how the
   * arguments are interpreted.
   * Params:
   *   defaultProxy = the default proxy to use, eg
   *     "socks://192.168.1.1"
   *   ignoreHosts = an optional list of hosts/IP addresses
   *     to not use a proxy for.
   * Returns: a new #GSimpleProxyResolver
   */
  static ProxyResolver new_(string defaultProxy, string[] ignoreHosts)
  {
    GProxyResolver* _cretval;
    const(char)* _defaultProxy = defaultProxy.toCString(No.Alloc);
    char*[] _tmpignoreHosts;
    foreach (s; ignoreHosts)
      _tmpignoreHosts ~= s.toCString(No.Alloc);
    _tmpignoreHosts ~= null;
    char** _ignoreHosts = _tmpignoreHosts.ptr;
    _cretval = g_simple_proxy_resolver_new(_defaultProxy, _ignoreHosts);
    auto _retval = ObjectG.getDObject!ProxyResolver(cast(GProxyResolver*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets the default proxy on resolver, to be used for any URIs that
   * don't match #GSimpleProxyResolver:ignore-hosts or a proxy set
   * via [Gio.SimpleProxyResolver.setUriProxy].
   * If default_proxy starts with "socks://",
   * #GSimpleProxyResolver will treat it as referring to all three of
   * the socks5, socks4a, and socks4 proxy types.
   * Params:
   *   defaultProxy = the default proxy to use
   */
  void setDefaultProxy(string defaultProxy)
  {
    const(char)* _defaultProxy = defaultProxy.toCString(No.Alloc);
    g_simple_proxy_resolver_set_default_proxy(cast(GSimpleProxyResolver*)cPtr, _defaultProxy);
  }

  /**
   * Sets the list of ignored hosts.
   * See #GSimpleProxyResolver:ignore-hosts for more details on how the
   * ignore_hosts argument is interpreted.
   * Params:
   *   ignoreHosts = %NULL-terminated list of hosts/IP addresses
   *     to not use a proxy for
   */
  void setIgnoreHosts(string[] ignoreHosts)
  {
    char*[] _tmpignoreHosts;
    foreach (s; ignoreHosts)
      _tmpignoreHosts ~= s.toCString(No.Alloc);
    _tmpignoreHosts ~= null;
    char** _ignoreHosts = _tmpignoreHosts.ptr;
    g_simple_proxy_resolver_set_ignore_hosts(cast(GSimpleProxyResolver*)cPtr, _ignoreHosts);
  }

  /**
   * Adds a URI-scheme-specific proxy to resolver; URIs whose scheme
   * matches uri_scheme $(LPAREN)and which don't match
   * #GSimpleProxyResolver:ignore-hosts$(RPAREN) will be proxied via proxy.
   * As with #GSimpleProxyResolver:default-proxy, if proxy starts with
   * "socks://", #GSimpleProxyResolver will treat it
   * as referring to all three of the socks5, socks4a, and socks4 proxy
   * types.
   * Params:
   *   uriScheme = the URI scheme to add a proxy for
   *   proxy = the proxy to use for uri_scheme
   */
  void setUriProxy(string uriScheme, string proxy)
  {
    const(char)* _uriScheme = uriScheme.toCString(No.Alloc);
    const(char)* _proxy = proxy.toCString(No.Alloc);
    g_simple_proxy_resolver_set_uri_proxy(cast(GSimpleProxyResolver*)cPtr, _uriScheme, _proxy);
  }
}
