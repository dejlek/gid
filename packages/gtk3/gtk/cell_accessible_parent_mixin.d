module gtk.cell_accessible_parent_mixin;

public import gtk.cell_accessible_parent_iface_proxy;
public import atk.object;
public import atk.relation_set;
public import atk.types;
public import gdk.rectangle;
public import gid.gid;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.cell_accessible;
public import gtk.types;

/** */
template CellAccessibleParentT()
{

  /** */
  override void activate(gtk.cell_accessible.CellAccessible cell)
  {
    gtk_cell_accessible_parent_activate(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
  }

  /** */
  override void edit(gtk.cell_accessible.CellAccessible cell)
  {
    gtk_cell_accessible_parent_edit(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
  }

  /** */
  override void expandCollapse(gtk.cell_accessible.CellAccessible cell)
  {
    gtk_cell_accessible_parent_expand_collapse(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
  }

  /** */
  override void getCellArea(gtk.cell_accessible.CellAccessible cell, out gdk.rectangle.Rectangle cellRect)
  {
    GdkRectangle _cellRect;
    gtk_cell_accessible_parent_get_cell_area(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null, &_cellRect);
    cellRect = new gdk.rectangle.Rectangle(cast(void*)&_cellRect, No.take);
  }

  /** */
  override void getCellExtents(gtk.cell_accessible.CellAccessible cell, out int x, out int y, out int width, out int height, atk.types.CoordType coordType)
  {
    gtk_cell_accessible_parent_get_cell_extents(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coordType);
  }

  /** */
  override void getCellPosition(gtk.cell_accessible.CellAccessible cell, out int row, out int column)
  {
    gtk_cell_accessible_parent_get_cell_position(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null, cast(int*)&row, cast(int*)&column);
  }

  /** */
  override int getChildIndex(gtk.cell_accessible.CellAccessible cell)
  {
    int _retval;
    _retval = gtk_cell_accessible_parent_get_child_index(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  override atk.object.ObjectAtk[] getColumnHeaderCells(gtk.cell_accessible.CellAccessible cell)
  {
    GPtrArray* _cretval;
    _cretval = gtk_cell_accessible_parent_get_column_header_cells(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
    auto _retval = gPtrArrayToD!(atk.object.ObjectAtk, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  override gtk.types.CellRendererState getRendererState(gtk.cell_accessible.CellAccessible cell)
  {
    GtkCellRendererState _cretval;
    _cretval = gtk_cell_accessible_parent_get_renderer_state(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
    gtk.types.CellRendererState _retval = cast(gtk.types.CellRendererState)_cretval;
    return _retval;
  }

  /** */
  override atk.object.ObjectAtk[] getRowHeaderCells(gtk.cell_accessible.CellAccessible cell)
  {
    GPtrArray* _cretval;
    _cretval = gtk_cell_accessible_parent_get_row_header_cells(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
    auto _retval = gPtrArrayToD!(atk.object.ObjectAtk, GidOwnership.Full)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /** */
  override bool grabFocus(gtk.cell_accessible.CellAccessible cell)
  {
    bool _retval;
    _retval = gtk_cell_accessible_parent_grab_focus(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  override void updateRelationset(gtk.cell_accessible.CellAccessible cell, atk.relation_set.RelationSet relationset)
  {
    gtk_cell_accessible_parent_update_relationset(cast(GtkCellAccessibleParent*)cPtr, cell ? cast(GtkCellAccessible*)cell.cPtr(No.dup) : null, relationset ? cast(AtkRelationSet*)relationset.cPtr(No.dup) : null);
  }
}
