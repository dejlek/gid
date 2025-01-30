module Gio.AppInfoIfaceProxy;

import GObject.ObjectG;
import Gio.AppInfo;
import Gio.AppInfoT;

/// Proxy object for Gio.AppInfo interface when a GObject has no applicable D binding
class AppInfoIfaceProxy : IfaceProxy, AppInfo
{
  this()
  {
  }

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
