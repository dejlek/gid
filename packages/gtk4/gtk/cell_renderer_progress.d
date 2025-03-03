module gtk.cell_renderer_progress;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
 * Renders numbers as progress bars
 * `GtkCellRendererProgress` renders a numeric value as a progress par in a cell.
 * Additionally, it can display a text on top of the progress bar.

 * Deprecated: List views use widgets to display their contents.
 *   You should use [gtk.progress_bar.ProgressBar] instead
 */
class CellRendererProgress : gtk.cell_renderer.CellRenderer, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_progress_get_type != &gidSymbolNotFound ? gtk_cell_renderer_progress_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();

  /**
   * Creates a new `GtkCellRendererProgress`.
   * Returns: the new cell renderer
   */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_progress_new();
    this(_cretval, No.Take);
  }
}
