module atk.table_mixin;

public import atk.table_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.object;
public import atk.types;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;

/**
    The ATK interface implemented for UI components which contain tabular or row/column information.
  
  #AtkTable should be implemented by components which present
  elements ordered via rows and columns.  It may also be used to
  present tree-structured information if the nodes of the trees can
  be said to contain multiple "columns".  Individual elements of an
  #AtkTable are typically referred to as "cells". Those cells should
  implement the interface #AtkTableCell, but #Atk doesn't require
  them to be direct children of the current #AtkTable. They can be
  grand-children, grand-grand-children etc. #AtkTable provides the
  API needed to get a individual cell based on the row and column
  numbers.
  
  Children of #AtkTable are frequently "lightweight" objects, that
  is, they may not have backing widgets in the host UI toolkit.  They
  are therefore often transient.
  
  Since tables are often very complex, #AtkTable includes provision
  for offering simplified summary information, as well as row and
  column headers and captions.  Headers and captions are #AtkObjects
  which may implement other interfaces (#AtkText, #AtkImage, etc.) as
  appropriate.  #AtkTable summaries may themselves be (simplified)
  #AtkTables, etc.
  
  Note for implementors: in the past, #AtkTable required that all the
  cells should be direct children of #AtkTable, and provided some
  index based methods to request the cells. The practice showed that
  that forcing made #AtkTable implementation complex, and hard to
  expose other kind of children, like rows or captions. Right now,
  index-based methods are deprecated.
*/
template TableT()
{

  /**
      Adds the specified column to the selection.
    Params:
      column =       a #gint representing a column in table
    Returns:     a gboolean representing if the column was successfully added to
      the selection, or 0 if value does not implement this interface.
  */
  override bool addColumnSelection(int column)
  {
    bool _retval;
    _retval = atk_table_add_column_selection(cast(AtkTable*)cPtr, column);
    return _retval;
  }

  /**
      Adds the specified row to the selection.
    Params:
      row =       a #gint representing a row in table
    Returns:     a gboolean representing if row was successfully added to selection,
      or 0 if value does not implement this interface.
  */
  override bool addRowSelection(int row)
  {
    bool _retval;
    _retval = atk_table_add_row_selection(cast(AtkTable*)cPtr, row);
    return _retval;
  }

  /**
      Gets the caption for the table.
    Returns:     a AtkObject* representing the
      table caption, or null if value does not implement this interface.
  */
  override atk.object.ObjectAtk getCaption()
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_caption(cast(AtkTable*)cPtr);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #gint representing the column at the specified index_.
    Params:
      index =       a #gint representing an index in table
    Returns:     a gint representing the column at the specified index,
      or -1 if the table does not implement this method.
  
    Deprecated:     Since 2.12.
  */
  override int getColumnAtIndex(int index)
  {
    int _retval;
    _retval = atk_table_get_column_at_index(cast(AtkTable*)cPtr, index);
    return _retval;
  }

  /**
      Gets the description text of the specified column in the table
    Params:
      column =       a #gint representing a column in table
    Returns:     a gchar* representing the column description, or null
      if value does not implement this interface.
  */
  override string getColumnDescription(int column)
  {
    const(char)* _cretval;
    _cretval = atk_table_get_column_description(cast(AtkTable*)cPtr, column);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of columns occupied by the accessible object
    at the specified row and column in the table.
    Params:
      row =       a #gint representing a row in table
      column =       a #gint representing a column in table
    Returns:     a gint representing the column extent at specified position, or 0
      if value does not implement this interface.
  */
  override int getColumnExtentAt(int row, int column)
  {
    int _retval;
    _retval = atk_table_get_column_extent_at(cast(AtkTable*)cPtr, row, column);
    return _retval;
  }

  /**
      Gets the column header of a specified column in an accessible table.
    Params:
      column =       a #gint representing a column in the table
    Returns:     a AtkObject* representing the
      specified column header, or null if value does not implement this
      interface.
  */
  override atk.object.ObjectAtk getColumnHeader(int column)
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_column_header(cast(AtkTable*)cPtr, column);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a #gint representing the index at the specified row and
    column.
    Params:
      row =       a #gint representing a row in table
      column =       a #gint representing a column in table
    Returns:     a #gint representing the index at specified position.
      The value -1 is returned if the object at row,column is not a child
      of table or table does not implement this interface.
  
    Deprecated:     Since 2.12. Use [atk.table.Table.refAt] in order to get the
      accessible that represents the cell at (row, column)
  */
  override int getIndexAt(int row, int column)
  {
    int _retval;
    _retval = atk_table_get_index_at(cast(AtkTable*)cPtr, row, column);
    return _retval;
  }

  /**
      Gets the number of columns in the table.
    Returns:     a gint representing the number of columns, or 0
      if value does not implement this interface.
  */
  override int getNColumns()
  {
    int _retval;
    _retval = atk_table_get_n_columns(cast(AtkTable*)cPtr);
    return _retval;
  }

  /**
      Gets the number of rows in the table.
    Returns:     a gint representing the number of rows, or 0
      if value does not implement this interface.
  */
  override int getNRows()
  {
    int _retval;
    _retval = atk_table_get_n_rows(cast(AtkTable*)cPtr);
    return _retval;
  }

  /**
      Gets a #gint representing the row at the specified index_.
    Params:
      index =       a #gint representing an index in table
    Returns:     a gint representing the row at the specified index,
      or -1 if the table does not implement this method.
  
    Deprecated:     since 2.12.
  */
  override int getRowAtIndex(int index)
  {
    int _retval;
    _retval = atk_table_get_row_at_index(cast(AtkTable*)cPtr, index);
    return _retval;
  }

  /**
      Gets the description text of the specified row in the table
    Params:
      row =       a #gint representing a row in table
    Returns:     a gchar* representing the row description, or
      null if value does not implement this interface.
  */
  override string getRowDescription(int row)
  {
    const(char)* _cretval;
    _cretval = atk_table_get_row_description(cast(AtkTable*)cPtr, row);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the number of rows occupied by the accessible object
    at a specified row and column in the table.
    Params:
      row =       a #gint representing a row in table
      column =       a #gint representing a column in table
    Returns:     a gint representing the row extent at specified position, or 0
      if value does not implement this interface.
  */
  override int getRowExtentAt(int row, int column)
  {
    int _retval;
    _retval = atk_table_get_row_extent_at(cast(AtkTable*)cPtr, row, column);
    return _retval;
  }

  /**
      Gets the row header of a specified row in an accessible table.
    Params:
      row =       a #gint representing a row in the table
    Returns:     a AtkObject* representing the
      specified row header, or null if value does not implement this
      interface.
  */
  override atk.object.ObjectAtk getRowHeader(int row)
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_row_header(cast(AtkTable*)cPtr, row);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the selected columns of the table by initializing **selected with
    the selected column numbers. This array should be freed by the caller.
    Params:
      selected =       a #gint** that is to contain the selected columns numbers
  */
  override void getSelectedColumns(out int[] selected)
  {
    int* _selected;
    auto _ret_length = atk_table_get_selected_columns(cast(AtkTable*)cPtr, &_selected);
    selected.length = _ret_length;
    selected[0 .. $] = _selected[0 .. _ret_length];
    safeFree(cast(void*)_selected);
  }

  /**
      Gets the selected rows of the table by initializing **selected with
    the selected row numbers. This array should be freed by the caller.
    Params:
      selected =       a #gint** that is to contain the selected row numbers
  */
  override void getSelectedRows(out int[] selected)
  {
    int* _selected;
    auto _ret_length = atk_table_get_selected_rows(cast(AtkTable*)cPtr, &_selected);
    selected.length = _ret_length;
    selected[0 .. $] = _selected[0 .. _ret_length];
    safeFree(cast(void*)_selected);
  }

  /**
      Gets the summary description of the table.
    Returns:     a AtkObject* representing a summary description
      of the table, or zero if value does not implement this interface.
  */
  override atk.object.ObjectAtk getSummary()
  {
    AtkObject* _cretval;
    _cretval = atk_table_get_summary(cast(AtkTable*)cPtr);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the specified column
    is selected
    Params:
      column =       a #gint representing a column in table
    Returns:     a gboolean representing if the column is selected, or 0
      if value does not implement this interface.
  */
  override bool isColumnSelected(int column)
  {
    bool _retval;
    _retval = atk_table_is_column_selected(cast(AtkTable*)cPtr, column);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the specified row
    is selected
    Params:
      row =       a #gint representing a row in table
    Returns:     a gboolean representing if the row is selected, or 0
      if value does not implement this interface.
  */
  override bool isRowSelected(int row)
  {
    bool _retval;
    _retval = atk_table_is_row_selected(cast(AtkTable*)cPtr, row);
    return _retval;
  }

  /**
      Gets a boolean value indicating whether the accessible object
    at the specified row and column is selected
    Params:
      row =       a #gint representing a row in table
      column =       a #gint representing a column in table
    Returns:     a gboolean representing if the cell is selected, or 0
      if value does not implement this interface.
  */
  override bool isSelected(int row, int column)
  {
    bool _retval;
    _retval = atk_table_is_selected(cast(AtkTable*)cPtr, row, column);
    return _retval;
  }

  /**
      Get a reference to the table cell at row, column. This cell
    should implement the interface #AtkTableCell
    Params:
      row =       a #gint representing a row in table
      column =       a #gint representing a column in table
    Returns:     an #AtkObject representing the referred
      to accessible
  */
  override atk.object.ObjectAtk refAt(int row, int column)
  {
    AtkObject* _cretval;
    _cretval = atk_table_ref_at(cast(AtkTable*)cPtr, row, column);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds the specified column to the selection.
    Params:
      column =       a #gint representing a column in table
    Returns:     a gboolean representing if the column was successfully removed from
      the selection, or 0 if value does not implement this interface.
  */
  override bool removeColumnSelection(int column)
  {
    bool _retval;
    _retval = atk_table_remove_column_selection(cast(AtkTable*)cPtr, column);
    return _retval;
  }

  /**
      Removes the specified row from the selection.
    Params:
      row =       a #gint representing a row in table
    Returns:     a gboolean representing if the row was successfully removed from
      the selection, or 0 if value does not implement this interface.
  */
  override bool removeRowSelection(int row)
  {
    bool _retval;
    _retval = atk_table_remove_row_selection(cast(AtkTable*)cPtr, row);
    return _retval;
  }

  /**
      Sets the caption for the table.
    Params:
      caption =       a #AtkObject representing the caption to set for table
  */
  override void setCaption(atk.object.ObjectAtk caption)
  {
    atk_table_set_caption(cast(AtkTable*)cPtr, caption ? cast(AtkObject*)caption.cPtr(No.Dup) : null);
  }

  /**
      Sets the description text for the specified column of the table.
    Params:
      column =       a #gint representing a column in table
      description =       a #gchar representing the description text
        to set for the specified column of the table
  */
  override void setColumnDescription(int column, string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    atk_table_set_column_description(cast(AtkTable*)cPtr, column, _description);
  }

  /**
      Sets the specified column header to header.
    Params:
      column =       a #gint representing a column in table
      header =       an #AtkTable
  */
  override void setColumnHeader(int column, atk.object.ObjectAtk header)
  {
    atk_table_set_column_header(cast(AtkTable*)cPtr, column, header ? cast(AtkObject*)header.cPtr(No.Dup) : null);
  }

  /**
      Sets the description text for the specified row of table.
    Params:
      row =       a #gint representing a row in table
      description =       a #gchar representing the description text
        to set for the specified row of table
  */
  override void setRowDescription(int row, string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    atk_table_set_row_description(cast(AtkTable*)cPtr, row, _description);
  }

  /**
      Sets the specified row header to header.
    Params:
      row =       a #gint representing a row in table
      header =       an #AtkTable
  */
  override void setRowHeader(int row, atk.object.ObjectAtk header)
  {
    atk_table_set_row_header(cast(AtkTable*)cPtr, row, header ? cast(AtkObject*)header.cPtr(No.Dup) : null);
  }

  /**
      Sets the summary description of the table.
    Params:
      accessible =       an #AtkObject representing the summary description
        to set for table
  */
  override void setSummary(atk.object.ObjectAtk accessible)
  {
    atk_table_set_summary(cast(AtkTable*)cPtr, accessible ? cast(AtkObject*)accessible.cPtr(No.Dup) : null);
  }

  /**
      The "column-deleted" signal is emitted by an object which
    implements the AtkTable interface when a column is deleted.
  
    ## Parameters
    $(LIST
      * $(B arg1)       The index of the first column deleted.
      * $(B arg2)       The number of columns deleted.
      * $(B table) the instance the signal is connected to
    )
  */
  alias ColumnDeletedCallbackDlg = void delegate(int arg1, int arg2, atk.table.Table table);

  /** ditto */
  alias ColumnDeletedCallbackFunc = void function(int arg1, int arg2, atk.table.Table table);

  /**
    Connect to ColumnDeleted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectColumnDeleted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ColumnDeletedCallbackDlg) || is(T : ColumnDeletedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("column-deleted", closure, after);
  }

  /**
      The "column-inserted" signal is emitted by an object which
    implements the AtkTable interface when a column is inserted.
  
    ## Parameters
    $(LIST
      * $(B arg1)       The index of the column inserted.
      * $(B arg2)       The number of colums inserted.
      * $(B table) the instance the signal is connected to
    )
  */
  alias ColumnInsertedCallbackDlg = void delegate(int arg1, int arg2, atk.table.Table table);

  /** ditto */
  alias ColumnInsertedCallbackFunc = void function(int arg1, int arg2, atk.table.Table table);

  /**
    Connect to ColumnInserted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectColumnInserted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ColumnInsertedCallbackDlg) || is(T : ColumnInsertedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("column-inserted", closure, after);
  }

  /**
      The "column-reordered" signal is emitted by an object which
    implements the AtkTable interface when the columns are
    reordered.
  
    ## Parameters
    $(LIST
      * $(B table) the instance the signal is connected to
    )
  */
  alias ColumnReorderedCallbackDlg = void delegate(atk.table.Table table);

  /** ditto */
  alias ColumnReorderedCallbackFunc = void function(atk.table.Table table);

  /**
    Connect to ColumnReordered signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectColumnReordered(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ColumnReorderedCallbackDlg) || is(T : ColumnReorderedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      _dClosure.dlg(table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("column-reordered", closure, after);
  }

  /**
      The "model-changed" signal is emitted by an object which
    implements the AtkTable interface when the model displayed by
    the table changes.
  
    ## Parameters
    $(LIST
      * $(B table) the instance the signal is connected to
    )
  */
  alias ModelChangedCallbackDlg = void delegate(atk.table.Table table);

  /** ditto */
  alias ModelChangedCallbackFunc = void function(atk.table.Table table);

  /**
    Connect to ModelChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectModelChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ModelChangedCallbackDlg) || is(T : ModelChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      _dClosure.dlg(table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("model-changed", closure, after);
  }

  /**
      The "row-deleted" signal is emitted by an object which
    implements the AtkTable interface when a row is deleted.
  
    ## Parameters
    $(LIST
      * $(B arg1)       The index of the first row deleted.
      * $(B arg2)       The number of rows deleted.
      * $(B table) the instance the signal is connected to
    )
  */
  alias RowDeletedCallbackDlg = void delegate(int arg1, int arg2, atk.table.Table table);

  /** ditto */
  alias RowDeletedCallbackFunc = void function(int arg1, int arg2, atk.table.Table table);

  /**
    Connect to RowDeleted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRowDeleted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowDeletedCallbackDlg) || is(T : RowDeletedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-deleted", closure, after);
  }

  /**
      The "row-inserted" signal is emitted by an object which
    implements the AtkTable interface when a row is inserted.
  
    ## Parameters
    $(LIST
      * $(B arg1)       The index of the first row inserted.
      * $(B arg2)       The number of rows inserted.
      * $(B table) the instance the signal is connected to
    )
  */
  alias RowInsertedCallbackDlg = void delegate(int arg1, int arg2, atk.table.Table table);

  /** ditto */
  alias RowInsertedCallbackFunc = void function(int arg1, int arg2, atk.table.Table table);

  /**
    Connect to RowInserted signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRowInserted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowInsertedCallbackDlg) || is(T : RowInsertedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-inserted", closure, after);
  }

  /**
      The "row-reordered" signal is emitted by an object which
    implements the AtkTable interface when the rows are
    reordered.
  
    ## Parameters
    $(LIST
      * $(B table) the instance the signal is connected to
    )
  */
  alias RowReorderedCallbackDlg = void delegate(atk.table.Table table);

  /** ditto */
  alias RowReorderedCallbackFunc = void function(atk.table.Table table);

  /**
    Connect to RowReordered signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRowReordered(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowReorderedCallbackDlg) || is(T : RowReorderedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto table = getVal!(atk.table.Table)(_paramVals);
      _dClosure.dlg(table);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-reordered", closure, after);
  }
}
