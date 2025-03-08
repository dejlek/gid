module gtk.cell_renderer_combo;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer_text;
import gtk.tree_iter;
import gtk.types;

/**
    Renders a combobox in a cell
  
  [gtk.cell_renderer_combo.CellRendererCombo] renders text in a cell like [gtk.cell_renderer_text.CellRendererText] from
  which it is derived. But while [gtk.cell_renderer_text.CellRendererText] offers a simple entry to
  edit the text, [gtk.cell_renderer_combo.CellRendererCombo] offers a [gtk.combo_box.ComboBox]
  widget to edit the text. The values to display in the combo box are taken from
  the tree model specified in the [gtk.cell_renderer_combo.CellRendererCombo]:model property.
  
  The combo cell renderer takes care of adding a text cell renderer to the combo
  box and sets it to display the column specified by its
  [gtk.cell_renderer_combo.CellRendererCombo]:text-column property. Further properties of the combo box
  can be set in a handler for the `GtkCellRenderer::editing-started` signal.

  Deprecated:     List views use widgets to display their contents. You
      should use [gtk.drop_down.DropDown] instead
*/
class CellRendererCombo : gtk.cell_renderer_text.CellRendererText
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_combo_get_type != &gidSymbolNotFound ? gtk_cell_renderer_combo_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.cell_renderer_combo.CellRendererCombo].
    Adjust how text is drawn using object properties.
    Object properties can be set globally (with [gobject.object.ObjectG.set]).
    Also, with [gtk.tree_view_column.TreeViewColumn], you can bind a property to a value
    in a [gtk.tree_model.TreeModel]. For example, you can bind the “text” property
    on the cell renderer to a string value in the model, thus rendering
    a different string in each row of the [gtk.tree_view.TreeView].
    Returns:     the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_combo_new();
    this(_cretval, No.take);
  }

  /**
      This signal is emitted each time after the user selected an item in
    the combo box, either by using the mouse or the arrow keys.  Contrary
    to GtkComboBox, GtkCellRendererCombo::changed is not emitted for
    changes made to a selected item in the entry.  The argument new_iter
    corresponds to the newly selected item in the combo box and it is relative
    to the GtkTreeModel set via the model property on GtkCellRendererCombo.
    
    Note that as soon as you change the model displayed in the tree view,
    the tree view will immediately cease the editing operating.  This
    means that you most probably want to refrain from changing the model
    until the combo cell renderer emits the edited or editing_canceled signal.
  
    ## Parameters
    $(LIST
      * $(B pathString)       a string of the path identifying the edited cell
                      (relative to the tree view model)
      * $(B newIter)       the new iter selected in the combo box
                   (relative to the combo box model)
      * $(B cellRendererCombo) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(string pathString, gtk.tree_iter.TreeIter newIter, gtk.cell_renderer_combo.CellRendererCombo cellRendererCombo);

  /** ditto */
  alias ChangedCallbackFunc = void function(string pathString, gtk.tree_iter.TreeIter newIter, gtk.cell_renderer_combo.CellRendererCombo cellRendererCombo);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto cellRendererCombo = getVal!(gtk.cell_renderer_combo.CellRendererCombo)(_paramVals);
      auto pathString = getVal!(string)(&_paramVals[1]);
      auto newIter = getVal!(gtk.tree_iter.TreeIter)(&_paramVals[2]);
      _dClosure.dlg(pathString, newIter, cellRendererCombo);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}
