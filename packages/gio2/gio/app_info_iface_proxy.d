module gio.app_info_iface_proxy;

import gobject.object;
import gio.app_info;
import gio.app_info_mixin;

/// Proxy object for Gio.AppInfo interface when a GObject has no applicable D binding
class AppInfoIfaceProxy : IfaceProxy, AppInfo
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(AppInfo);
  }

  mixin AppInfoT!();
}
