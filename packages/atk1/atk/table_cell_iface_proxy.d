module atk.table_cell_iface_proxy;

import gobject.object;
import atk.table_cell;
import atk.table_cell_mixin;

/// Proxy object for Atk.TableCell interface when a GObject has no applicable D binding
class TableCellIfaceProxy : IfaceProxy, atk.table_cell.TableCell
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(atk.table_cell.TableCell);
  }

  mixin TableCellT!();
}
