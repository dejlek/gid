module Atk.TableIfaceProxy;

import GObject.ObjectG;
import Atk.Table;
import Atk.TableT;

/// Proxy object for Atk.Table interface when a GObject has no applicable D binding
class TableIfaceProxy : IfaceProxy, Table
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Table);
  }

  mixin TableT!();
}
