/// Module for [CellRendererText] class
module gtk.cell_renderer_text;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    Renders text in a cell
    
    A [gtk.cell_renderer_text.CellRendererText] renders a given text in its cell, using the font, color and
    style information provided by its properties. The text will be ellipsized if it is
    too long and the `GtkCellRendererText:ellipsize` property allows it.
    
    If the `GtkCellRenderer:mode` is [gtk.types.CellRendererMode.Editable],
    the [gtk.cell_renderer_text.CellRendererText] allows to edit its text using an entry.

    Deprecated: List views use widgets to display their contents.
        You should use [gtk.inscription.Inscription] or [gtk.label.Label] instead
*/
class CellRendererText : gtk.cell_renderer.CellRenderer
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_text_get_type != &gidSymbolNotFound ? gtk_cell_renderer_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override CellRendererText self()
  {
    return this;
  }

  /**
      Creates a new [gtk.cell_renderer_text.CellRendererText]. Adjust how text is drawn using
      object properties. Object properties can be
      set globally (with [gobject.object.ObjectG.set]). Also, with [gtk.tree_view_column.TreeViewColumn],
      you can bind a property to a value in a [gtk.tree_model.TreeModel]. For example,
      you can bind the “text” property on the cell renderer to a string
      value in the model, thus rendering a different string in each row
      of the [gtk.tree_view.TreeView].
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_text_new();
    this(_cretval, No.Take);
  }

  /**
      Sets the height of a renderer to explicitly be determined by the “font” and
      “y_pad” property set on it.  Further changes in these properties do not
      affect the height, so they must be accompanied by a subsequent call to this
      function.  Using this function is inflexible, and should really only be used
      if calculating the size of a cell is too slow (ie, a massive number of cells
      displayed).  If number_of_rows is -1, then the fixed height is unset, and
      the height is determined by the properties again.
  
      Params:
        numberOfRows = Number of rows of text each cell renderer is allocated, or -1
  */
  void setFixedHeightFromFont(int numberOfRows)
  {
    gtk_cell_renderer_text_set_fixed_height_from_font(cast(GtkCellRendererText*)cPtr, numberOfRows);
  }

  /**
      Connect to `Edited` signal.
  
      This signal is emitted after renderer has been edited.
      
      It is the responsibility of the application to update the model
      and store new_text at the position indicated by path.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string path, string newText, gtk.cell_renderer_text.CellRendererText cellRendererText))
  
          `path` the path identifying the edited cell (optional)
  
          `newText` the new text (optional)
  
          `cellRendererText` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEdited(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.cell_renderer_text.CellRendererText)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edited", closure, after);
  }
}
