module gio.action_group_iface_proxy;

import gobject.object;
import gio.action_group;
import gio.action_group_mixin;

/// Proxy object for Gio.ActionGroup interface when a GObject has no applicable D binding
class ActionGroupIfaceProxy : IfaceProxy, ActionGroup
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ActionGroup);
  }

  mixin ActionGroupT!();
}
