module Atk.TableCellIfaceProxy;

import GObject.ObjectG;
import Atk.TableCell;
import Atk.TableCellT;

/// Proxy object for Atk.TableCell interface when a GObject has no applicable D binding
class TableCellIfaceProxy : IfaceProxy, TableCell
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TableCell);
  }

  mixin TableCellT!();
}
