module Atk.HyperlinkImplIfaceProxy;

import GObject.ObjectG;
import Atk.HyperlinkImpl;
import Atk.HyperlinkImplT;

/// Proxy object for Atk.HyperlinkImpl interface when a GObject has no applicable D binding
class HyperlinkImplIfaceProxy : IfaceProxy, HyperlinkImpl
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(HyperlinkImpl);
  }

  mixin HyperlinkImplT!();
}
