module adw.swipeable_iface_proxy;

import gobject.object;
import adw.swipeable;
import adw.swipeable_mixin;

/// Proxy object for Adw.Swipeable interface when a GObject has no applicable D binding
class SwipeableIfaceProxy : IfaceProxy, adw.swipeable.Swipeable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(adw.swipeable.Swipeable);
  }

  mixin SwipeableT!();
}
