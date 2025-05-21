/// Module for [CellAccessible] class
module gtk.cell_accessible;

import atk.action;
import atk.action_mixin;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.table_cell;
import atk.table_cell_mixin;
import gid.gid;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class CellAccessible : gtk.accessible.Accessible, atk.action.Action, atk.component.Component, atk.table_cell.TableCell
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_accessible_get_type != &gidSymbolNotFound ? gtk_cell_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellAccessible self()
  {
    return this;
  }

  mixin ActionT!();
  mixin ComponentT!();
  mixin TableCellT!();
  alias getDescription = atk.object.ObjectWrap.getDescription;
  alias getName = atk.object.ObjectWrap.getName;
  alias setDescription = atk.object.ObjectWrap.setDescription;
}
