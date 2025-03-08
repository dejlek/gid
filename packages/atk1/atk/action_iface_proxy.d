module atk.action_iface_proxy;

import gobject.object;
import atk.action;
import atk.action_mixin;

/// Proxy object for Atk.Action interface when a GObject has no applicable D binding
class ActionIfaceProxy : IfaceProxy, atk.action.Action
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.action.Action);
  }

  mixin ActionT!();
}
