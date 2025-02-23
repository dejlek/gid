module atk.implementor_iface_iface_proxy;

import gobject.object;
import atk.implementor_iface;
import atk.implementor_iface_mixin;

/// Proxy object for Atk.ImplementorIface interface when a GObject has no applicable D binding
class ImplementorIfaceIfaceProxy : IfaceProxy, ImplementorIface
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ImplementorIface);
  }

  mixin ImplementorIfaceT!();
}
