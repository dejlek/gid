module gio.action_iface_proxy;

import gobject.object;
import gio.action;
import gio.action_mixin;

/// Proxy object for Gio.Action interface when a GObject has no applicable D binding
class ActionIfaceProxy : IfaceProxy, gio.action.Action
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.action.Action);
  }

  mixin ActionT!();
}
