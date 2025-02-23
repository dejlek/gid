module gio.drive_iface_proxy;

import gobject.object;
import gio.drive;
import gio.drive_mixin;

/// Proxy object for Gio.Drive interface when a GObject has no applicable D binding
class DriveIfaceProxy : IfaceProxy, Drive
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Drive);
  }

  mixin DriveT!();
}
