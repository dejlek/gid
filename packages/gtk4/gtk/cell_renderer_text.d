module gtk.cell_renderer_text;

import gid.global;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
 * Renders text in a cell
 * A `GtkCellRendererText` renders a given text in its cell, using the font, color and
 * style information provided by its properties. The text will be ellipsized if it is
 * too long and the `GtkCellRendererText:ellipsize` property allows it.
 * If the `GtkCellRenderer:mode` is %GTK_CELL_RENDERER_MODE_EDITABLE,
 * the `GtkCellRendererText` allows to edit its text using an entry.

 * Deprecated: List views use widgets to display their contents.
 *   You should use [gtk.inscription.Inscription] or [gtk.label.Label] instead
 */
class CellRendererText : CellRenderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_text_get_type != &gidSymbolNotFound ? gtk_cell_renderer_text_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkCellRendererText`. Adjust how text is drawn using
   * object properties. Object properties can be
   * set globally $(LPAREN)with [gobject.object.ObjectG.set]$(RPAREN). Also, with `GtkTreeViewColumn`,
   * you can bind a property to a value in a `GtkTreeModel`. For example,
   * you can bind the “text” property on the cell renderer to a string
   * value in the model, thus rendering a different string in each row
   * of the `GtkTreeView`.
   * Returns: the new cell renderer
   */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_text_new();
    this(_cretval, No.Take);
  }

  /**
   * Sets the height of a renderer to explicitly be determined by the “font” and
   * “y_pad” property set on it.  Further changes in these properties do not
   * affect the height, so they must be accompanied by a subsequent call to this
   * function.  Using this function is inflexible, and should really only be used
   * if calculating the size of a cell is too slow $(LPAREN)ie, a massive number of cells
   * displayed$(RPAREN).  If number_of_rows is -1, then the fixed height is unset, and
   * the height is determined by the properties again.
   * Params:
   *   numberOfRows = Number of rows of text each cell renderer is allocated, or -1
   */
  void setFixedHeightFromFont(int numberOfRows)
  {
    gtk_cell_renderer_text_set_fixed_height_from_font(cast(GtkCellRendererText*)cPtr, numberOfRows);
  }

  /**
   * This signal is emitted after renderer has been edited.
   * It is the responsibility of the application to update the model
   * and store new_text at the position indicated by path.
   * Params
   *   path = the path identifying the edited cell
   *   newText = the new text
   *   cellRendererText = the instance the signal is connected to
   */
  alias EditedCallbackDlg = void delegate(string path, string newText, CellRendererText cellRendererText);
  alias EditedCallbackFunc = void function(string path, string newText, CellRendererText cellRendererText);

  /**
   * Connect to Edited signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEdited(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EditedCallbackDlg) || is(T : EditedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellRendererText = getVal!CellRendererText(_paramVals);
      auto path = getVal!string(&_paramVals[1]);
      auto newText = getVal!string(&_paramVals[2]);
      _dClosure.dlg(path, newText, cellRendererText);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edited", closure, after);
  }
}
