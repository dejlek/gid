module gio.dtls_connection_iface_proxy;

import gobject.object;
import gio.dtls_connection;
import gio.dtls_connection_mixin;

/// Proxy object for Gio.DtlsConnection interface when a GObject has no applicable D binding
class DtlsConnectionIfaceProxy : IfaceProxy, DtlsConnection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DtlsConnection);
  }

  mixin DtlsConnectionT!();
}
