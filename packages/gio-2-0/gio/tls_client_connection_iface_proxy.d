module gio.tls_client_connection_iface_proxy;

import gobject.object;
import gio.tls_client_connection;
import gio.tls_client_connection_mixin;

/// Proxy object for Gio.TlsClientConnection interface when a GObject has no applicable D binding
class TlsClientConnectionIfaceProxy : IfaceProxy, TlsClientConnection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TlsClientConnection);
  }

  mixin TlsClientConnectionT!();
}
