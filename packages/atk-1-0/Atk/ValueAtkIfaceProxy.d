module Atk.ValueAtkIfaceProxy;

import GObject.ObjectG;
import Atk.ValueAtk;
import Atk.ValueAtkT;

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
