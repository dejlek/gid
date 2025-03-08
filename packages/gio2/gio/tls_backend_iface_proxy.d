module gio.tls_backend_iface_proxy;

import gobject.object;
import gio.tls_backend;
import gio.tls_backend_mixin;

/// Proxy object for Gio.TlsBackend interface when a GObject has no applicable D binding
class TlsBackendIfaceProxy : IfaceProxy, gio.tls_backend.TlsBackend
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.tls_backend.TlsBackend);
  }

  mixin TlsBackendT!();
}
