module gio.icon_iface_proxy;

import gobject.object;
import gio.icon;
import gio.icon_mixin;

/// Proxy object for Gio.Icon interface when a GObject has no applicable D binding
class IconIfaceProxy : IfaceProxy, Icon
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Icon);
  }

  mixin IconT!();
}
