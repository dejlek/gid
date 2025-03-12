module gtk.cell_renderer_spin;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer_text;
import gtk.types;

/**
    Renders a spin button in a cell
  
  [gtk.cell_renderer_spin.CellRendererSpin] renders text in a cell like [gtk.cell_renderer_text.CellRendererText] from
  which it is derived. But while [gtk.cell_renderer_text.CellRendererText] offers a simple entry to
  edit the text, [gtk.cell_renderer_spin.CellRendererSpin] offers a [gtk.spin_button.SpinButton] widget. Of course,
  that means that the text has to be parseable as a floating point number.
  
  The range of the spinbutton is taken from the adjustment property of the
  cell renderer, which can be set explicitly or mapped to a column in the
  tree model, like all properties of cell renders. [gtk.cell_renderer_spin.CellRendererSpin]
  also has properties for the `GtkCellRendererSpin:climb-rate` and the number
  of `GtkCellRendererSpin:digits` to display. Other [gtk.spin_button.SpinButton] properties
  can be set in a handler for the `GtkCellRenderer::editing-started` signal.

  Deprecated:     List views use widgets to display their contents.
      You should use [gtk.spin_button.SpinButton] instead
*/
class CellRendererSpin : gtk.cell_renderer_text.CellRendererText
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_spin_get_type != &gidSymbolNotFound ? gtk_cell_renderer_spin_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override CellRendererSpin self()
  {
    return this;
  }

  /**
      Creates a new [gtk.cell_renderer_spin.CellRendererSpin].
    Returns:     a new [gtk.cell_renderer_spin.CellRendererSpin]
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_spin_new();
    this(_cretval, No.Take);
  }
}
