module atk.window_iface_proxy;

import gobject.object;
import atk.window;
import atk.window_mixin;

/// Proxy object for Atk.Window interface when a GObject has no applicable D binding
class WindowIfaceProxy : IfaceProxy, Window
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Window);
  }

  mixin WindowT!();
}
