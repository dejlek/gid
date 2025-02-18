module Atk.TextIfaceProxy;

import GObject.ObjectG;
import Atk.Text;
import Atk.TextT;

/// Proxy object for Atk.Text interface when a GObject has no applicable D binding
class TextIfaceProxy : IfaceProxy, Text
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Text);
  }

  mixin TextT!();
}
