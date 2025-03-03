module gdk.popup_iface_proxy;

import gobject.object;
import gdk.popup;
import gdk.popup_mixin;

/// Proxy object for Gdk.Popup interface when a GObject has no applicable D binding
class PopupIfaceProxy : IfaceProxy, gdk.popup.Popup
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gdk.popup.Popup);
  }

  mixin PopupT!();
}
