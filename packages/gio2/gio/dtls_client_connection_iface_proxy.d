module gio.dtls_client_connection_iface_proxy;

import gobject.object;
import gio.dtls_client_connection;
import gio.dtls_client_connection_mixin;

/// Proxy object for Gio.DtlsClientConnection interface when a GObject has no applicable D binding
class DtlsClientConnectionIfaceProxy : IfaceProxy, gio.dtls_client_connection.DtlsClientConnection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.dtls_client_connection.DtlsClientConnection);
  }

  mixin DtlsClientConnectionT!();
}
