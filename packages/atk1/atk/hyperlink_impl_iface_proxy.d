module atk.hyperlink_impl_iface_proxy;

import gobject.object;
import atk.hyperlink_impl;
import atk.hyperlink_impl_mixin;

/// Proxy object for Atk.HyperlinkImpl interface when a GObject has no applicable D binding
class HyperlinkImplIfaceProxy : IfaceProxy, atk.hyperlink_impl.HyperlinkImpl
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.hyperlink_impl.HyperlinkImpl);
  }

  mixin HyperlinkImplT!();
}
