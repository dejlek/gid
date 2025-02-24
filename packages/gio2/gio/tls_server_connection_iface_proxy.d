module gio.tls_server_connection_iface_proxy;

import gobject.object;
import gio.tls_server_connection;
import gio.tls_server_connection_mixin;

/// Proxy object for Gio.TlsServerConnection interface when a GObject has no applicable D binding
class TlsServerConnectionIfaceProxy : IfaceProxy, TlsServerConnection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TlsServerConnection);
  }

  mixin TlsServerConnectionT!();
}
