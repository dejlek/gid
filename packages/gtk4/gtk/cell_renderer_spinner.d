module gtk.cell_renderer_spinner;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    Renders a spinning animation in a cell
  
  [gtk.cell_renderer_spinner.CellRendererSpinner] renders a spinning animation in a cell, very
  similar to [gtk.spinner.Spinner]. It can often be used as an alternative
  to a [gtk.cell_renderer_progress.CellRendererProgress] for displaying indefinite activity,
  instead of actual progress.
  
  To start the animation in a cell, set the `GtkCellRendererSpinner:active`
  property to true and increment the `GtkCellRendererSpinner:pulse` property
  at regular intervals. The usual way to set the cell renderer properties
  for each cell is to bind them to columns in your tree model using e.g.
  [gtk.tree_view_column.TreeViewColumn.addAttribute].

  Deprecated:     List views use widgets to display their contents.
      You should use [gtk.spinner.Spinner] instead
*/
class CellRendererSpinner : gtk.cell_renderer.CellRenderer
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_spinner_get_type != &gidSymbolNotFound ? gtk_cell_renderer_spinner_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns a new cell renderer which will show a spinner to indicate
    activity.
    Returns:     a new [gtk.cell_renderer.CellRenderer]
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_spinner_new();
    this(_cretval, No.take);
  }
}
