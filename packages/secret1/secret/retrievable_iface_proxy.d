module secret.retrievable_iface_proxy;

import gobject.object;
import secret.retrievable;
import secret.retrievable_mixin;

/// Proxy object for Secret.Retrievable interface when a GObject has no applicable D binding
class RetrievableIfaceProxy : IfaceProxy, Retrievable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Retrievable);
  }

  mixin RetrievableT!();
}
