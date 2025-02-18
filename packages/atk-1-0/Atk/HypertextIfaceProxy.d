module Atk.HypertextIfaceProxy;

import GObject.ObjectG;
import Atk.Hypertext;
import Atk.HypertextT;

/// Proxy object for Atk.Hypertext interface when a GObject has no applicable D binding
class HypertextIfaceProxy : IfaceProxy, Hypertext
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Hypertext);
  }

  mixin HypertextT!();
}
