module gtk.grid_layout_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_child;
import gtk.types;

/**
 * `GtkLayoutChild` subclass for children in a `GtkGridLayout`.
 */
class GridLayoutChild : gtk.layout_child.LayoutChild
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_grid_layout_child_get_type != &gidSymbolNotFound ? gtk_grid_layout_child_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Retrieves the column number to which child attaches its left side.
   * Returns: the column number
   */
  int getColumn()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_column(cast(GtkGridLayoutChild*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the number of columns that child spans to.
   * Returns: the number of columns
   */
  int getColumnSpan()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_column_span(cast(GtkGridLayoutChild*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the row number to which child attaches its top side.
   * Returns: the row number
   */
  int getRow()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_row(cast(GtkGridLayoutChild*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the number of rows that child spans to.
   * Returns: the number of row
   */
  int getRowSpan()
  {
    int _retval;
    _retval = gtk_grid_layout_child_get_row_span(cast(GtkGridLayoutChild*)cPtr);
    return _retval;
  }

  /**
   * Sets the column number to attach the left side of child.
   * Params:
   *   column = the attach point for child
   */
  void setColumn(int column)
  {
    gtk_grid_layout_child_set_column(cast(GtkGridLayoutChild*)cPtr, column);
  }

  /**
   * Sets the number of columns child spans to.
   * Params:
   *   span = the span of child
   */
  void setColumnSpan(int span)
  {
    gtk_grid_layout_child_set_column_span(cast(GtkGridLayoutChild*)cPtr, span);
  }

  /**
   * Sets the row to place child in.
   * Params:
   *   row = the row for child
   */
  void setRow(int row)
  {
    gtk_grid_layout_child_set_row(cast(GtkGridLayoutChild*)cPtr, row);
  }

  /**
   * Sets the number of rows child spans to.
   * Params:
   *   span = the span of child
   */
  void setRowSpan(int span)
  {
    gtk_grid_layout_child_set_row_span(cast(GtkGridLayoutChild*)cPtr, span);
  }
}
