module gio.tls_backend_iface_proxy;

import gobject.object;
import gio.tls_backend;
import gio.tls_backend_mixin;

/// Proxy object for Gio.TlsBackend interface when a GObject has no applicable D binding
class TlsBackendIfaceProxy : IfaceProxy, TlsBackend
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TlsBackend);
  }

  mixin TlsBackendT!();
}
