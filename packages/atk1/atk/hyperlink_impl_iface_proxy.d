module atk.hyperlink_impl_iface_proxy;

import gobject.object;
import atk.hyperlink_impl;
import atk.hyperlink_impl_mixin;

/// Proxy object for Atk.HyperlinkImpl interface when a GObject has no applicable D binding
class HyperlinkImplIfaceProxy : IfaceProxy, HyperlinkImpl
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(HyperlinkImpl);
  }

  mixin HyperlinkImplT!();
}
