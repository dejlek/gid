module Atk.ImplementorIfaceIfaceProxy;

import GObject.ObjectG;
import Atk.ImplementorIface;
import Atk.ImplementorIfaceT;

/// Proxy object for Atk.ImplementorIface interface when a GObject has no applicable D binding
class ImplementorIfaceIfaceProxy : IfaceProxy, ImplementorIface
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ImplementorIface);
  }

  mixin ImplementorIfaceT!();
}
