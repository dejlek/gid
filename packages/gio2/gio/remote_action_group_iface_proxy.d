module gio.remote_action_group_iface_proxy;

import gobject.object;
import gio.remote_action_group;
import gio.remote_action_group_mixin;

/// Proxy object for Gio.RemoteActionGroup interface when a GObject has no applicable D binding
class RemoteActionGroupIfaceProxy : IfaceProxy, gio.remote_action_group.RemoteActionGroup
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.remote_action_group.RemoteActionGroup);
  }

  mixin RemoteActionGroupT!();
}
