module atk.table_cell_iface_proxy;

import gobject.object;
import atk.table_cell;
import atk.table_cell_mixin;

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
