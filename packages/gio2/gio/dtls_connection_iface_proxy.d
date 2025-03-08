module gio.dtls_connection_iface_proxy;

import gobject.object;
import gio.dtls_connection;
import gio.dtls_connection_mixin;

/// Proxy object for Gio.DtlsConnection interface when a GObject has no applicable D binding
class DtlsConnectionIfaceProxy : IfaceProxy, gio.dtls_connection.DtlsConnection
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.dtls_connection.DtlsConnection);
  }

  mixin DtlsConnectionT!();
}
