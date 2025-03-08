module gio.mount_iface_proxy;

import gobject.object;
import gio.mount;
import gio.mount_mixin;

/// Proxy object for Gio.Mount interface when a GObject has no applicable D binding
class MountIfaceProxy : IfaceProxy, gio.mount.Mount
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.mount.Mount);
  }

  mixin MountT!();
}
