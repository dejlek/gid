module PangoCairo.FontMapIfaceProxy;

import GObject.ObjectG;
import PangoCairo.FontMap;
import PangoCairo.FontMapT;

/// Proxy object for PangoCairo.FontMap interface when a GObject has no applicable D binding
class FontMapIfaceProxy : IfaceProxy, FontMap
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(FontMap);
  }

  mixin FontMapT!();
}
