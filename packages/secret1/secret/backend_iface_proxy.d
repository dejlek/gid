module secret.backend_iface_proxy;

import gobject.object;
import secret.backend;
import secret.backend_mixin;

/// Proxy object for Secret.Backend interface when a GObject has no applicable D binding
class BackendIfaceProxy : IfaceProxy, secret.backend.Backend
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(secret.backend.Backend);
  }

  mixin BackendT!();
}
