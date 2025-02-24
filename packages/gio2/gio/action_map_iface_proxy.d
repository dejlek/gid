module gio.action_map_iface_proxy;

import gobject.object;
import gio.action_map;
import gio.action_map_mixin;

/// Proxy object for Gio.ActionMap interface when a GObject has no applicable D binding
class ActionMapIfaceProxy : IfaceProxy, ActionMap
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ActionMap);
  }

  mixin ActionMapT!();
}
