module gstvideo.navigation_iface_proxy;

import gobject.object;
import gstvideo.navigation;
import gstvideo.navigation_mixin;

/// Proxy object for GstVideo.Navigation interface when a GObject has no applicable D binding
class NavigationIfaceProxy : IfaceProxy, gstvideo.navigation.Navigation
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gstvideo.navigation.Navigation);
  }

  mixin NavigationT!();
}
