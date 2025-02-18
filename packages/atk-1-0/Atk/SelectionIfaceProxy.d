module Atk.SelectionIfaceProxy;

import GObject.ObjectG;
import Atk.Selection;
import Atk.SelectionT;

/// Proxy object for Atk.Selection interface when a GObject has no applicable D binding
class SelectionIfaceProxy : IfaceProxy, Selection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Selection);
  }

  mixin SelectionT!();
}
