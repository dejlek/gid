module Atk.ComponentIfaceProxy;

import GObject.ObjectG;
import Atk.Component;
import Atk.ComponentT;

/// Proxy object for Atk.Component interface when a GObject has no applicable D binding
class ComponentIfaceProxy : IfaceProxy, Component
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Component);
  }

  mixin ComponentT!();
}
