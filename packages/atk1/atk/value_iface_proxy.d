module atk.value_iface_proxy;

import gobject.object;
import atk.value;
import atk.value_mixin;

/// Proxy object for Atk.ValueAtk interface when a GObject has no applicable D binding
class ValueAtkIfaceProxy : IfaceProxy, ValueAtk
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ValueAtk);
  }

  mixin ValueAtkT!();
}
