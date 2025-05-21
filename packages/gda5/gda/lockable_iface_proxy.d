/// Module for [LockableIfaceProxy] interface proxy object
module gda.lockable_iface_proxy;

import gobject.object;
import gda.lockable;
import gda.lockable_mixin;

/// Proxy object for [gda.lockable.Lockable] interface when a GObject has no applicable D binding
class LockableIfaceProxy : IfaceProxy, gda.lockable.Lockable
{
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gda.lockable.Lockable);
  }

  mixin LockableT!();
}
