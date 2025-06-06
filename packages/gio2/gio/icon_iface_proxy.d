/// Module for [IconIfaceProxy] interface proxy object
module gio.icon_iface_proxy;

import gobject.object;
import gio.icon;
import gio.icon_mixin;

/// Proxy object for [gio.icon.Icon] interface when a GObject has no applicable D binding
class IconIfaceProxy : IfaceProxy, gio.icon.Icon
{
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.icon.Icon);
  }

  mixin IconT!();
}
