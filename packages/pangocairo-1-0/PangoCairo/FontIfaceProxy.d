module PangoCairo.FontIfaceProxy;

import GObject.ObjectG;
import PangoCairo.Font;
import PangoCairo.FontT;

/// Proxy object for PangoCairo.Font interface when a GObject has no applicable D binding
class FontIfaceProxy : IfaceProxy, Font
{
  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Font);
  }

  mixin FontT!();
}
