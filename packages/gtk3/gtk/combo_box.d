module gtk.combo_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import atk.object;
import gdk.device;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;

/**
    A GtkComboBox is a widget that allows the user to choose from a list of
  valid choices. The GtkComboBox displays the selected choice. When
  activated, the GtkComboBox displays a popup which allows the user to
  make a new choice. The style in which the selected value is displayed,
  and the style of the popup is determined by the current theme. It may
  be similar to a Windows-style combo box.
  
  The GtkComboBox uses the model-view pattern; the list of valid choices
  is specified in the form of a tree model, and the display of the choices
  can be adapted to the data in the model by using cell renderers, as you
  would in a tree view. This is possible since GtkComboBox implements the
  #GtkCellLayout interface. The tree model holding the valid choices is
  not restricted to a flat list, it can be a real tree, and the popup will
  reflect the tree structure.
  
  To allow the user to enter values not in the model, the “has-entry”
  property allows the GtkComboBox to contain a #GtkEntry. This entry
  can be accessed by calling [gtk.bin.Bin.getChild] on the combo box.
  
  For a simple list of textual choices, the model-view API of GtkComboBox
  can be a bit overwhelming. In this case, #GtkComboBoxText offers a
  simple alternative. Both GtkComboBox and #GtkComboBoxText can contain
  an entry.
  
  # CSS nodes
  
  ```plain
  combobox
  ├── box.linked
  │   ╰── button.combo
  │       ╰── box
  │           ├── cellview
  │           ╰── arrow
  ╰── window.popup
  ```
  
  A normal combobox contains a box with the .linked class, a button
  with the .combo class and inside those buttons, there are a cellview and
  an arrow.
  
  ```plain
  combobox
  ├── box.linked
  │   ├── entry.combo
  │   ╰── button.combo
  │       ╰── box
  │           ╰── arrow
  ╰── window.popup
  ```
  
  A GtkComboBox with an entry has a single CSS node with name combobox. It
  contains a box with the .linked class. That box contains an entry and a
  button, both with the .combo class added.
  The button also contains another node with name arrow.
*/
class ComboBox : gtk.bin.Bin, gtk.cell_editable.CellEditable, gtk.cell_layout.CellLayout
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_combo_box_get_type != &gidSymbolNotFound ? gtk_combo_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ComboBox self()
  {
    return this;
  }

  mixin CellEditableT!();
  mixin CellLayoutT!();

  /**
      Creates a new empty #GtkComboBox.
    Returns:     A new #GtkComboBox.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new empty #GtkComboBox using area to layout cells.
    Params:
      area =       the #GtkCellArea to use to layout cell renderers
    Returns:     A new #GtkComboBox.
  */
  static gtk.combo_box.ComboBox newWithArea(gtk.cell_area.CellArea area)
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_area(area ? cast(GtkCellArea*)area.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new empty #GtkComboBox with an entry.
    
    The new combo box will use area to layout cells.
    Params:
      area =       the #GtkCellArea to use to layout cell renderers
    Returns:     A new #GtkComboBox.
  */
  static gtk.combo_box.ComboBox newWithAreaAndEntry(gtk.cell_area.CellArea area)
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_area_and_entry(area ? cast(GtkCellArea*)area.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new empty #GtkComboBox with an entry.
    Returns:     A new #GtkComboBox.
  */
  static gtk.combo_box.ComboBox newWithEntry()
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_entry();
    auto _retval = ObjectG.getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkComboBox with the model initialized to model.
    Params:
      model =       A #GtkTreeModel.
    Returns:     A new #GtkComboBox.
  */
  static gtk.combo_box.ComboBox newWithModel(gtk.tree_model.TreeModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_model(model ? cast(GtkTreeModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new empty #GtkComboBox with an entry
    and with the model initialized to model.
    Params:
      model =       A #GtkTreeModel
    Returns:     A new #GtkComboBox
  */
  static gtk.combo_box.ComboBox newWithModelAndEntry(gtk.tree_model.TreeModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_combo_box_new_with_model_and_entry(model ? cast(GtkTreeModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.combo_box.ComboBox)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the index of the currently active item, or -1 if there’s no
    active item. If the model is a non-flat treemodel, and the active item
    is not an immediate child of the root of the tree, this function returns
    `gtk_tree_path_get_indices (path)[0]`, where
    `path` is the #GtkTreePath of the active item.
    Returns:     An integer which is the index of the currently active item,
          or -1 if there’s no active item.
  */
  int getActive()
  {
    int _retval;
    _retval = gtk_combo_box_get_active(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns the ID of the active row of combo_box.  This value is taken
    from the active row and the column specified by the #GtkComboBox:id-column
    property of combo_box (see [gtk.combo_box.ComboBox.setIdColumn]).
    
    The returned value is an interned string which means that you can
    compare the pointer by value to other interned strings and that you
    must not free it.
    
    If the #GtkComboBox:id-column property of combo_box is not set, or if
    no row is active, or if the active row has a null ID value, then null
    is returned.
    Returns:     the ID of the active row, or null
  */
  string getActiveId()
  {
    const(char)* _cretval;
    _cretval = gtk_combo_box_get_active_id(cast(GtkComboBox*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets iter to point to the currently active item, if any item is active.
    Otherwise, iter is left unchanged.
    Params:
      iter =       A #GtkTreeIter
    Returns:     true if iter was set, false otherwise
  */
  bool getActiveIter(out gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    GtkTreeIter _iter;
    _retval = gtk_combo_box_get_active_iter(cast(GtkComboBox*)cPtr, &_iter);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Gets the current value of the :add-tearoffs property.
    Returns:     the current value of the :add-tearoffs property.
  */
  bool getAddTearoffs()
  {
    bool _retval;
    _retval = gtk_combo_box_get_add_tearoffs(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns whether the combo box sets the dropdown button
    sensitive or not when there are no items in the model.
    Returns:     [gtk.types.SensitivityType.On] if the dropdown button
         is sensitive when the model is empty, [gtk.types.SensitivityType.Off]
         if the button is always insensitive or
         [gtk.types.SensitivityType.Auto] if it is only sensitive as long as
         the model has one item to be selected.
  */
  gtk.types.SensitivityType getButtonSensitivity()
  {
    GtkSensitivityType _cretval;
    _cretval = gtk_combo_box_get_button_sensitivity(cast(GtkComboBox*)cPtr);
    gtk.types.SensitivityType _retval = cast(gtk.types.SensitivityType)_cretval;
    return _retval;
  }

  /**
      Returns the column with column span information for combo_box.
    Returns:     the column span column.
  */
  int getColumnSpanColumn()
  {
    int _retval;
    _retval = gtk_combo_box_get_column_span_column(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns the column which combo_box is using to get the strings
    from to display in the internal entry.
    Returns:     A column in the data source model of combo_box.
  */
  int getEntryTextColumn()
  {
    int _retval;
    _retval = gtk_combo_box_get_entry_text_column(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns whether the combo box grabs focus when it is clicked
    with the mouse. See [gtk.combo_box.ComboBox.setFocusOnClick].
    Returns:     true if the combo box grabs focus when it is
          clicked with the mouse.
  
    Deprecated:     Use [gtk.widget.Widget.getFocusOnClick] instead
  */
  override bool getFocusOnClick()
  {
    bool _retval;
    _retval = gtk_combo_box_get_focus_on_click(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns whether the combo box has an entry.
    Returns:     whether there is an entry in combo_box.
  */
  bool getHasEntry()
  {
    bool _retval;
    _retval = gtk_combo_box_get_has_entry(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns the column which combo_box is using to get string IDs
    for values from.
    Returns:     A column in the data source model of combo_box.
  */
  int getIdColumn()
  {
    int _retval;
    _retval = gtk_combo_box_get_id_column(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns the #GtkTreeModel which is acting as data source for combo_box.
    Returns:     A #GtkTreeModel which was passed
          during construction.
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_combo_box_get_model(cast(GtkComboBox*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the accessible object corresponding to the combo box’s popup.
    
    This function is mostly intended for use by accessibility technologies;
    applications should have little use for it.
    Returns:     the accessible object corresponding
          to the combo box’s popup.
  */
  atk.object.ObjectAtk getPopupAccessible()
  {
    AtkObject* _cretval;
    _cretval = gtk_combo_box_get_popup_accessible(cast(GtkComboBox*)cPtr);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the popup uses a fixed width matching
    the allocated width of the combo box.
    Returns:     true if the popup uses a fixed width
  */
  bool getPopupFixedWidth()
  {
    bool _retval;
    _retval = gtk_combo_box_get_popup_fixed_width(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Returns the column with row span information for combo_box.
    Returns:     the row span column.
  */
  int getRowSpanColumn()
  {
    int _retval;
    _retval = gtk_combo_box_get_row_span_column(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Gets the current title of the menu in tearoff mode. See
    [gtk.combo_box.ComboBox.setAddTearoffs].
    Returns:     the menu’s title in tearoff mode. This is an internal copy of the
      string which must not be freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_combo_box_get_title(cast(GtkComboBox*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the wrap width which is used to determine the number of columns
    for the popup menu. If the wrap width is larger than 1, the combo box
    is in table mode.
    Returns:     the wrap width.
  */
  int getWrapWidth()
  {
    int _retval;
    _retval = gtk_combo_box_get_wrap_width(cast(GtkComboBox*)cPtr);
    return _retval;
  }

  /**
      Hides the menu or dropdown list of combo_box.
    
    This function is mostly intended for use by accessibility technologies;
    applications should have little use for it.
  */
  void popdown()
  {
    gtk_combo_box_popdown(cast(GtkComboBox*)cPtr);
  }

  /**
      Pops up the menu or dropdown list of combo_box.
    
    This function is mostly intended for use by accessibility technologies;
    applications should have little use for it.
    
    Before calling this, combo_box must be mapped, or nothing will happen.
  */
  void popup()
  {
    gtk_combo_box_popup(cast(GtkComboBox*)cPtr);
  }

  /**
      Pops up the menu or dropdown list of combo_box, the popup window
    will be grabbed so only device and its associated pointer/keyboard
    are the only #GdkDevices able to send events to it.
    Params:
      device =       a #GdkDevice
  */
  void popupForDevice(gdk.device.Device device)
  {
    gtk_combo_box_popup_for_device(cast(GtkComboBox*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null);
  }

  /**
      Sets the active item of combo_box to be the item at index.
    Params:
      index =       An index in the model passed during construction, or -1 to have
        no active item
  */
  void setActive(int index)
  {
    gtk_combo_box_set_active(cast(GtkComboBox*)cPtr, index);
  }

  /**
      Changes the active row of combo_box to the one that has an ID equal to
    active_id, or unsets the active row if active_id is null.  Rows having
    a null ID string cannot be made active by this function.
    
    If the #GtkComboBox:id-column property of combo_box is unset or if no
    row has the given ID then the function does nothing and returns false.
    Params:
      activeId =       the ID of the row to select, or null
    Returns:     true if a row with a matching ID was found.  If a null
               active_id was given to unset the active row, the function
               always returns true.
  */
  bool setActiveId(string activeId = null)
  {
    bool _retval;
    const(char)* _activeId = activeId.toCString(No.Alloc);
    _retval = gtk_combo_box_set_active_id(cast(GtkComboBox*)cPtr, _activeId);
    return _retval;
  }

  /**
      Sets the current active item to be the one referenced by iter, or
    unsets the active item if iter is null.
    Params:
      iter =       The #GtkTreeIter, or null
  */
  void setActiveIter(gtk.tree_iter.TreeIter iter = null)
  {
    gtk_combo_box_set_active_iter(cast(GtkComboBox*)cPtr, iter ? cast(GtkTreeIter*)iter.cPtr(No.Dup) : null);
  }

  /**
      Sets whether the popup menu should have a tearoff
    menu item.
    Params:
      addTearoffs =       true to add tearoff menu items
  */
  void setAddTearoffs(bool addTearoffs)
  {
    gtk_combo_box_set_add_tearoffs(cast(GtkComboBox*)cPtr, addTearoffs);
  }

  /**
      Sets whether the dropdown button of the combo box should be
    always sensitive ([gtk.types.SensitivityType.On]), never sensitive ([gtk.types.SensitivityType.Off])
    or only if there is at least one item to display ([gtk.types.SensitivityType.Auto]).
    Params:
      sensitivity =       specify the sensitivity of the dropdown button
  */
  void setButtonSensitivity(gtk.types.SensitivityType sensitivity)
  {
    gtk_combo_box_set_button_sensitivity(cast(GtkComboBox*)cPtr, sensitivity);
  }

  /**
      Sets the column with column span information for combo_box to be
    column_span. The column span column contains integers which indicate
    how many columns an item should span.
    Params:
      columnSpan =       A column in the model passed during construction
  */
  void setColumnSpanColumn(int columnSpan)
  {
    gtk_combo_box_set_column_span_column(cast(GtkComboBox*)cPtr, columnSpan);
  }

  /**
      Sets the model column which combo_box should use to get strings from
    to be text_column. The column text_column in the model of combo_box
    must be of type `G_TYPE_STRING`.
    
    This is only relevant if combo_box has been created with
    #GtkComboBox:has-entry as true.
    Params:
      textColumn =       A column in model to get the strings from for
            the internal entry
  */
  void setEntryTextColumn(int textColumn)
  {
    gtk_combo_box_set_entry_text_column(cast(GtkComboBox*)cPtr, textColumn);
  }

  /**
      Sets whether the combo box will grab focus when it is clicked with
    the mouse. Making mouse clicks not grab focus is useful in places
    like toolbars where you don’t want the keyboard focus removed from
    the main area of the application.
    Params:
      focusOnClick =       whether the combo box grabs focus when clicked
           with the mouse
  
    Deprecated:     Use [gtk.widget.Widget.setFocusOnClick] instead
  */
  override void setFocusOnClick(bool focusOnClick)
  {
    gtk_combo_box_set_focus_on_click(cast(GtkComboBox*)cPtr, focusOnClick);
  }

  /**
      Sets the model column which combo_box should use to get string IDs
    for values from. The column id_column in the model of combo_box
    must be of type `G_TYPE_STRING`.
    Params:
      idColumn =       A column in model to get string IDs for values from
  */
  void setIdColumn(int idColumn)
  {
    gtk_combo_box_set_id_column(cast(GtkComboBox*)cPtr, idColumn);
  }

  /**
      Sets the model used by combo_box to be model. Will unset a previously set
    model (if applicable). If model is null, then it will unset the model.
    
    Note that this function does not clear the cell renderers, you have to
    call [gtk.cell_layout.CellLayout.clear] yourself if you need to set up different
    cell renderers for the new model.
    Params:
      model =       A #GtkTreeModel
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_combo_box_set_model(cast(GtkComboBox*)cPtr, model ? cast(GtkTreeModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }

  /**
      Specifies whether the popup’s width should be a fixed width
    matching the allocated width of the combo box.
    Params:
      fixed =       whether to use a fixed popup width
  */
  void setPopupFixedWidth(bool fixed)
  {
    gtk_combo_box_set_popup_fixed_width(cast(GtkComboBox*)cPtr, fixed);
  }

  /**
      Sets the row separator function, which is used to determine
    whether a row should be drawn as a separator. If the row separator
    function is null, no separators are drawn. This is the default value.
    Params:
      func =       a #GtkTreeViewRowSeparatorFunc
  */
  void setRowSeparatorFunc(gtk.types.TreeViewRowSeparatorFunc func)
  {
    extern(C) bool _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, void* data)
    {
      auto _dlg = cast(gtk.types.TreeViewRowSeparatorFunc*)data;

      bool _retval = (*_dlg)(ObjectG.getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_combo_box_set_row_separator_func(cast(GtkComboBox*)cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets the column with row span information for combo_box to be row_span.
    The row span column contains integers which indicate how many rows
    an item should span.
    Params:
      rowSpan =       A column in the model passed during construction.
  */
  void setRowSpanColumn(int rowSpan)
  {
    gtk_combo_box_set_row_span_column(cast(GtkComboBox*)cPtr, rowSpan);
  }

  /**
      Sets the menu’s title in tearoff mode.
    Params:
      title =       a title for the menu in tearoff mode
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_combo_box_set_title(cast(GtkComboBox*)cPtr, _title);
  }

  /**
      Sets the wrap width of combo_box to be width. The wrap width is basically
    the preferred number of columns when you want the popup to be layed out
    in a table.
    Params:
      width =       Preferred number of columns
  */
  void setWrapWidth(int width)
  {
    gtk_combo_box_set_wrap_width(cast(GtkComboBox*)cPtr, width);
  }

  /**
      The changed signal is emitted when the active
    item is changed. The can be due to the user selecting
    a different item from the list, or due to a
    call to [gtk.combo_box.ComboBox.setActiveIter].
    It will also be emitted while typing into the entry of a combo box
    with an entry.
  
    ## Parameters
    $(LIST
      * $(B comboBox) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gtk.combo_box.ComboBox comboBox);

  /** ditto */
  alias ChangedCallbackFunc = void function(gtk.combo_box.ComboBox comboBox);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto comboBox = getVal!(gtk.combo_box.ComboBox)(_paramVals);
      _dClosure.dlg(comboBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      For combo boxes that are created with an entry (See GtkComboBox:has-entry).
    
    A signal which allows you to change how the text displayed in a combo box's
    entry is displayed.
    
    Connect a signal handler which returns an allocated string representing
    path. That string will then be used to set the text in the combo box's entry.
    The default signal handler uses the text from the GtkComboBox::entry-text-column
    model column.
    
    Here's an example signal handler which fetches data from the model and
    displays it in the entry.
    ```c
    static gchar*
    format_entry_text_callback (GtkComboBox *combo,
                                const gchar *path,
                                gpointer     user_data)
    {
      GtkTreeIter iter;
      GtkTreeModel model;
      gdouble      value;
    
      model = gtk_combo_box_get_model (combo);
    
      gtk_tree_model_get_iter_from_string (model, &iter, path);
      gtk_tree_model_get (model, &iter,
                          THE_DOUBLE_VALUE_COLUMN, &value,
                          -1);
    
      return g_strdup_printf ("%g", value);
    }
    ```
  
    ## Parameters
    $(LIST
      * $(B path)       the GtkTreePath string from the combo box's current model to format text for
      * $(B comboBox) the instance the signal is connected to
    )
    Returns:     a newly allocated string representing path
      for the current GtkComboBox model.
  */
  alias FormatEntryTextCallbackDlg = string delegate(string path, gtk.combo_box.ComboBox comboBox);

  /** ditto */
  alias FormatEntryTextCallbackFunc = string function(string path, gtk.combo_box.ComboBox comboBox);

  /**
    Connect to FormatEntryText signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectFormatEntryText(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FormatEntryTextCallbackDlg) || is(T : FormatEntryTextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto comboBox = getVal!(gtk.combo_box.ComboBox)(_paramVals);
      auto path = getVal!(string)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(path, comboBox);
      setVal!string(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("format-entry-text", closure, after);
  }

  /**
      The ::move-active signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to move the active selection.
  
    ## Parameters
    $(LIST
      * $(B scrollType)       a #GtkScrollType
      * $(B comboBox) the instance the signal is connected to
    )
  */
  alias MoveActiveCallbackDlg = void delegate(gtk.types.ScrollType scrollType, gtk.combo_box.ComboBox comboBox);

  /** ditto */
  alias MoveActiveCallbackFunc = void function(gtk.types.ScrollType scrollType, gtk.combo_box.ComboBox comboBox);

  /**
    Connect to MoveActive signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveActive(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveActiveCallbackDlg) || is(T : MoveActiveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto comboBox = getVal!(gtk.combo_box.ComboBox)(_paramVals);
      auto scrollType = getVal!(gtk.types.ScrollType)(&_paramVals[1]);
      _dClosure.dlg(scrollType, comboBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-active", closure, after);
  }

  /**
      The ::popdown signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to popdown the combo box list.
    
    The default bindings for this signal are Alt+Up and Escape.
  
    ## Parameters
    $(LIST
      * $(B comboBox) the instance the signal is connected to
    )
    Returns: 
  */
  alias PopdownCallbackDlg = bool delegate(gtk.combo_box.ComboBox comboBox);

  /** ditto */
  alias PopdownCallbackFunc = bool function(gtk.combo_box.ComboBox comboBox);

  /**
    Connect to Popdown signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopdown(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PopdownCallbackDlg) || is(T : PopdownCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto comboBox = getVal!(gtk.combo_box.ComboBox)(_paramVals);
      _retval = _dClosure.dlg(comboBox);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popdown", closure, after);
  }

  /**
      The ::popup signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to popup the combo box list.
    
    The default binding for this signal is Alt+Down.
  
    ## Parameters
    $(LIST
      * $(B comboBox) the instance the signal is connected to
    )
  */
  alias PopupCallbackDlg = void delegate(gtk.combo_box.ComboBox comboBox);

  /** ditto */
  alias PopupCallbackFunc = void function(gtk.combo_box.ComboBox comboBox);

  /**
    Connect to Popup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PopupCallbackDlg) || is(T : PopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto comboBox = getVal!(gtk.combo_box.ComboBox)(_paramVals);
      _dClosure.dlg(comboBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup", closure, after);
  }
}
