/// Module for [TreeViewAccessible] class
module gtk.tree_view_accessible;

import atk.component;
import atk.component_mixin;
import atk.selection;
import atk.selection_mixin;
import atk.table;
import atk.table_mixin;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_accessible_parent;
import gtk.cell_accessible_parent_mixin;
import gtk.container_accessible;
import gtk.types;

/** */
class TreeViewAccessible : gtk.container_accessible.ContainerAccessible, atk.selection.Selection, atk.table.Table, gtk.cell_accessible_parent.CellAccessibleParent
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
    return cast(void function())gtk_tree_view_accessible_get_type != &gidSymbolNotFound ? gtk_tree_view_accessible_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeViewAccessible self()
  {
    return this;
  }

  mixin SelectionT!();
  mixin TableT!();
  mixin CellAccessibleParentT!();
}
