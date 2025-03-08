module atk.value_iface_proxy;

import gobject.object;
import atk.value;
import atk.value_mixin;

/// Proxy object for Atk.Value interface when a GObject has no applicable D binding
class ValueIfaceProxy : IfaceProxy, atk.value.Value
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.value.Value);
  }

  mixin ValueT!();
}
