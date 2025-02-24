module gtk.list_box;

import gid.gid;
import gio.list_model;
import gio.list_model_mixin;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.list_box_row;
import gtk.types;
import gtk.widget;

/**
 * `GtkListBox` is a vertical list.
 * A `GtkListBox` only contains `GtkListBoxRow` children. These rows can
 * by dynamically sorted and filtered, and headers can be added dynamically
 * depending on the row content. It also allows keyboard and mouse navigation
 * and selection like a typical list.
 * Using `GtkListBox` is often an alternative to `GtkTreeView`, especially
 * when the list contents has a more complicated layout than what is allowed
 * by a `GtkCellRenderer`, or when the contents is interactive $(LPAREN)i.e. has a
 * button in it$(RPAREN).
 * Although a `GtkListBox` must have only `GtkListBoxRow` children, you can
 * add any kind of widget to it via [Gtk.ListBox.prepend],
 * [Gtk.ListBox.append] and [Gtk.ListBox.insert] and a
 * `GtkListBoxRow` widget will automatically be inserted between the list
 * and the widget.
 * `GtkListBoxRows` can be marked as activatable or selectable. If a row is
 * activatable, signal@Gtk.ListBox::row-activated will be emitted for it when
 * the user tries to activate it. If it is selectable, the row will be marked
 * as selected when the user tries to select it.
 * # GtkListBox as GtkBuildable
 * The `GtkListBox` implementation of the `GtkBuildable` interface supports
 * setting a child as the placeholder by specifying “placeholder” as the “type”
 * attribute of a `<child>` element. See [Gtk.ListBox.setPlaceholder]
 * for info.
 * # CSS nodes
 * |[<!-- language\="plain" -->
 * list[.separators][.rich-list][.navigation-sidebar][.boxed-list]
 * ╰── row[.activatable]
 * ]|
 * `GtkListBox` uses a single CSS node named list. It may carry the .separators
 * style class, when the property@Gtk.ListBox:show-separators property is set.
 * Each `GtkListBoxRow` uses a single CSS node named row. The row nodes get the
 * .activatable style class added when appropriate.
 * It may also carry the .boxed-list style class. In this case, the list will be
 * automatically surrounded by a frame and have separators.
 * The main list node may also carry style classes to select
 * the style of [list presentation](section-list-widget.html#list-styles):
 * .rich-list, .navigation-sidebar or .data-table.
 * # Accessibility
 * `GtkListBox` uses the %GTK_ACCESSIBLE_ROLE_LIST role and `GtkListBoxRow` uses
 * the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
 */
class ListBox : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_box_get_type != &gidSymbolNotFound ? gtk_list_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkListBox` container.
   * Returns: a new `GtkListBox`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_box_new();
    this(_cretval, No.Take);
  }

  /**
   * Append a widget to the list.
   * If a sort function is set, the widget will
   * actually be inserted at the calculated position.
   * Params:
   *   child = the `GtkWidget` to add
   */
  void append(Widget child)
  {
    gtk_list_box_append(cast(GtkListBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Binds model to box.
   * If box was already bound to a model, that previous binding is
   * destroyed.
   * The contents of box are cleared and then filled with widgets that
   * represent items from model. box is updated whenever model changes.
   * If model is %NULL, box is left empty.
   * It is undefined to add or remove widgets directly $(LPAREN)for example, with
   * [Gtk.ListBox.insert]$(RPAREN) while box is bound to a model.
   * Note that using a model is incompatible with the filtering and sorting
   * functionality in `GtkListBox`. When using a model, filtering and sorting
   * should be implemented by the model.
   * Params:
   *   model = the `GListModel` to be bound to box
   *   createWidgetFunc = a function that creates widgets for items
   *     or %NULL in case you also passed %NULL as model
   */
  void bindModel(ListModel model, ListBoxCreateWidgetFunc createWidgetFunc)
  {
    extern(C) GtkWidget* _createWidgetFuncCallback(ObjectC* item, void* userData)
    {
      Widget _dretval;
      auto _dlg = cast(ListBoxCreateWidgetFunc*)userData;

      _dretval = (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)item, No.Take));
      GtkWidget* _retval = cast(GtkWidget*)_dretval.cPtr(Yes.Dup);

      return _retval;
    }
    auto _createWidgetFuncCB = createWidgetFunc ? &_createWidgetFuncCallback : null;

    auto _createWidgetFunc = createWidgetFunc ? freezeDelegate(cast(void*)&createWidgetFunc) : null;
    GDestroyNotify _createWidgetFuncDestroyCB = createWidgetFunc ? &thawDelegate : null;
    gtk_list_box_bind_model(cast(GtkListBox*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null, _createWidgetFuncCB, _createWidgetFunc, _createWidgetFuncDestroyCB);
  }

  /**
   * Add a drag highlight to a row.
   * This is a helper function for implementing DnD onto a `GtkListBox`.
   * The passed in row will be highlighted by setting the
   * %GTK_STATE_FLAG_DROP_ACTIVE state and any previously highlighted
   * row will be unhighlighted.
   * The row will also be unhighlighted when the widget gets
   * a drag leave event.
   * Params:
   *   row = a `GtkListBoxRow`
   */
  void dragHighlightRow(ListBoxRow row)
  {
    gtk_list_box_drag_highlight_row(cast(GtkListBox*)cPtr, row ? cast(GtkListBoxRow*)row.cPtr(No.Dup) : null);
  }

  /**
   * If a row has previously been highlighted via [Gtk.ListBox.dragHighlightRow],
   * it will have the highlight removed.
   */
  void dragUnhighlightRow()
  {
    gtk_list_box_drag_unhighlight_row(cast(GtkListBox*)cPtr);
  }

  /**
   * Returns whether rows activate on single clicks.
   * Returns: %TRUE if rows are activated on single click, %FALSE otherwise
   */
  bool getActivateOnSingleClick()
  {
    bool _retval;
    _retval = gtk_list_box_get_activate_on_single_click(cast(GtkListBox*)cPtr);
    return _retval;
  }

  /**
   * Gets the adjustment $(LPAREN)if any$(RPAREN) that the widget uses to
   * for vertical scrolling.
   * Returns: the adjustment
   */
  Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_list_box_get_adjustment(cast(GtkListBox*)cPtr);
    auto _retval = ObjectG.getDObject!Adjustment(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the n-th child in the list $(LPAREN)not counting headers$(RPAREN).
   * If index_ is negative or larger than the number of items in the
   * list, %NULL is returned.
   * Params:
   *   index = the index of the row
   * Returns: the child `GtkWidget`
   */
  ListBoxRow getRowAtIndex(int index)
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_index(cast(GtkListBox*)cPtr, index);
    auto _retval = ObjectG.getDObject!ListBoxRow(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the row at the y position.
   * Params:
   *   y = position
   * Returns: the row
   */
  ListBoxRow getRowAtY(int y)
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_y(cast(GtkListBox*)cPtr, y);
    auto _retval = ObjectG.getDObject!ListBoxRow(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the selected row, or %NULL if no rows are selected.
   * Note that the box may allow multiple selection, in which
   * case you should use [Gtk.ListBox.selectedForeach] to
   * find all selected rows.
   * Returns: the selected row
   */
  ListBoxRow getSelectedRow()
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_selected_row(cast(GtkListBox*)cPtr);
    auto _retval = ObjectG.getDObject!ListBoxRow(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Creates a list of all selected children.
   * Returns: A `GList` containing the `GtkWidget` for each selected child.
   *   Free with [GLib.List.free] when done.
   */
  ListBoxRow[] getSelectedRows()
  {
    GList* _cretval;
    _cretval = gtk_list_box_get_selected_rows(cast(GtkListBox*)cPtr);
    auto _retval = gListToD!(ListBoxRow, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Gets the selection mode of the listbox.
   * Returns: a `GtkSelectionMode`
   */
  SelectionMode getSelectionMode()
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_list_box_get_selection_mode(cast(GtkListBox*)cPtr);
    SelectionMode _retval = cast(SelectionMode)_cretval;
    return _retval;
  }

  /**
   * Returns whether the list box should show separators
   * between rows.
   * Returns: %TRUE if the list box shows separators
   */
  bool getShowSeparators()
  {
    bool _retval;
    _retval = gtk_list_box_get_show_separators(cast(GtkListBox*)cPtr);
    return _retval;
  }

  /**
   * Insert the child into the box at position.
   * If a sort function is
   * set, the widget will actually be inserted at the calculated position.
   * If position is -1, or larger than the total number of items in the
   * box, then the child will be appended to the end.
   * Params:
   *   child = the `GtkWidget` to add
   *   position = the position to insert child in
   */
  void insert(Widget child, int position)
  {
    gtk_list_box_insert(cast(GtkListBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, position);
  }

  /**
   * Update the filtering for all rows.
   * Call this when result
   * of the filter function on the box is changed due
   * to an external factor. For instance, this would be used
   * if the filter function just looked for a specific search
   * string and the entry with the search string has changed.
   */
  void invalidateFilter()
  {
    gtk_list_box_invalidate_filter(cast(GtkListBox*)cPtr);
  }

  /**
   * Update the separators for all rows.
   * Call this when result
   * of the header function on the box is changed due
   * to an external factor.
   */
  void invalidateHeaders()
  {
    gtk_list_box_invalidate_headers(cast(GtkListBox*)cPtr);
  }

  /**
   * Update the sorting for all rows.
   * Call this when result
   * of the sort function on the box is changed due
   * to an external factor.
   */
  void invalidateSort()
  {
    gtk_list_box_invalidate_sort(cast(GtkListBox*)cPtr);
  }

  /**
   * Prepend a widget to the list.
   * If a sort function is set, the widget will
   * actually be inserted at the calculated position.
   * Params:
   *   child = the `GtkWidget` to add
   */
  void prepend(Widget child)
  {
    gtk_list_box_prepend(cast(GtkListBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Removes a child from box.
   * Params:
   *   child = the child to remove
   */
  void remove(Widget child)
  {
    gtk_list_box_remove(cast(GtkListBox*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
   * Removes all rows from box.
   * This function does nothing if box is backed by a model.
   */
  void removeAll()
  {
    gtk_list_box_remove_all(cast(GtkListBox*)cPtr);
  }

  /**
   * Select all children of box, if the selection mode allows it.
   */
  void selectAll()
  {
    gtk_list_box_select_all(cast(GtkListBox*)cPtr);
  }

  /**
   * Make row the currently selected row.
   * Params:
   *   row = The row to select
   */
  void selectRow(ListBoxRow row)
  {
    gtk_list_box_select_row(cast(GtkListBox*)cPtr, row ? cast(GtkListBoxRow*)row.cPtr(No.Dup) : null);
  }

  /**
   * Calls a function for each selected child.
   * Note that the selection cannot be modified from within this function.
   * Params:
   *   func = the function to call for each selected child
   */
  void selectedForeach(ListBoxForeachFunc func)
  {
    extern(C) void _funcCallback(GtkListBox* box, GtkListBoxRow* row, void* userData)
    {
      auto _dlg = cast(ListBoxForeachFunc*)userData;

      (*_dlg)(ObjectG.getDObject!ListBox(cast(void*)box, No.Take), ObjectG.getDObject!ListBoxRow(cast(void*)row, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gtk_list_box_selected_foreach(cast(GtkListBox*)cPtr, _funcCB, _func);
  }

  /**
   * If single is %TRUE, rows will be activated when you click on them,
   * otherwise you need to double-click.
   * Params:
   *   single = a boolean
   */
  void setActivateOnSingleClick(bool single)
  {
    gtk_list_box_set_activate_on_single_click(cast(GtkListBox*)cPtr, single);
  }

  /**
   * Sets the adjustment $(LPAREN)if any$(RPAREN) that the widget uses to
   * for vertical scrolling.
   * For instance, this is used to get the page size for
   * PageUp/Down key handling.
   * In the normal case when the box is packed inside
   * a `GtkScrolledWindow` the adjustment from that will
   * be picked up automatically, so there is no need
   * to manually do that.
   * Params:
   *   adjustment = the adjustment
   */
  void setAdjustment(Adjustment adjustment)
  {
    gtk_list_box_set_adjustment(cast(GtkListBox*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
  }

  /**
   * By setting a filter function on the box one can decide dynamically which
   * of the rows to show.
   * For instance, to implement a search function on a list that
   * filters the original list to only show the matching rows.
   * The filter_func will be called for each row after the call, and
   * it will continue to be called each time a row changes $(LPAREN)via
   * [Gtk.ListBoxRow.changed]$(RPAREN) or when [Gtk.ListBox.invalidateFilter]
   * is called.
   * Note that using a filter function is incompatible with using a model
   * $(LPAREN)see [Gtk.ListBox.bindModel]$(RPAREN).
   * Params:
   *   filterFunc = callback that lets you filter which rows to show
   */
  void setFilterFunc(ListBoxFilterFunc filterFunc)
  {
    extern(C) bool _filterFuncCallback(GtkListBoxRow* row, void* userData)
    {
      auto _dlg = cast(ListBoxFilterFunc*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!ListBoxRow(cast(void*)row, No.Take));
      return _retval;
    }
    auto _filterFuncCB = filterFunc ? &_filterFuncCallback : null;

    auto _filterFunc = filterFunc ? freezeDelegate(cast(void*)&filterFunc) : null;
    GDestroyNotify _filterFuncDestroyCB = filterFunc ? &thawDelegate : null;
    gtk_list_box_set_filter_func(cast(GtkListBox*)cPtr, _filterFuncCB, _filterFunc, _filterFuncDestroyCB);
  }

  /**
   * Sets a header function.
   * By setting a header function on the box one can dynamically add headers
   * in front of rows, depending on the contents of the row and its position
   * in the list.
   * For instance, one could use it to add headers in front of the first item
   * of a new kind, in a list sorted by the kind.
   * The update_header can look at the current header widget using
   * [Gtk.ListBoxRow.getHeader] and either update the state of the widget
   * as needed, or set a new one using [Gtk.ListBoxRow.setHeader]. If no
   * header is needed, set the header to %NULL.
   * Note that you may get many calls update_header to this for a particular
   * row when e.g. changing things that don’t affect the header. In this case
   * it is important for performance to not blindly replace an existing header
   * with an identical one.
   * The update_header function will be called for each row after the call,
   * and it will continue to be called each time a row changes $(LPAREN)via
   * [Gtk.ListBoxRow.changed]$(RPAREN) and when the row before changes $(LPAREN)either
   * by [Gtk.ListBoxRow.changed] on the previous row, or when the previous
   * row becomes a different row$(RPAREN). It is also called for all rows when
   * [Gtk.ListBox.invalidateHeaders] is called.
   * Params:
   *   updateHeader = callback that lets you add row headers
   */
  void setHeaderFunc(ListBoxUpdateHeaderFunc updateHeader)
  {
    extern(C) void _updateHeaderCallback(GtkListBoxRow* row, GtkListBoxRow* before, void* userData)
    {
      auto _dlg = cast(ListBoxUpdateHeaderFunc*)userData;

      (*_dlg)(ObjectG.getDObject!ListBoxRow(cast(void*)row, No.Take), ObjectG.getDObject!ListBoxRow(cast(void*)before, No.Take));
    }
    auto _updateHeaderCB = updateHeader ? &_updateHeaderCallback : null;

    auto _updateHeader = updateHeader ? freezeDelegate(cast(void*)&updateHeader) : null;
    GDestroyNotify _updateHeaderDestroyCB = updateHeader ? &thawDelegate : null;
    gtk_list_box_set_header_func(cast(GtkListBox*)cPtr, _updateHeaderCB, _updateHeader, _updateHeaderDestroyCB);
  }

  /**
   * Sets the placeholder widget that is shown in the list when
   * it doesn't display any visible children.
   * Params:
   *   placeholder = a `GtkWidget`
   */
  void setPlaceholder(Widget placeholder)
  {
    gtk_list_box_set_placeholder(cast(GtkListBox*)cPtr, placeholder ? cast(GtkWidget*)placeholder.cPtr(No.Dup) : null);
  }

  /**
   * Sets how selection works in the listbox.
   * Params:
   *   mode = The `GtkSelectionMode`
   */
  void setSelectionMode(SelectionMode mode)
  {
    gtk_list_box_set_selection_mode(cast(GtkListBox*)cPtr, mode);
  }

  /**
   * Sets whether the list box should show separators
   * between rows.
   * Params:
   *   showSeparators = %TRUE to show separators
   */
  void setShowSeparators(bool showSeparators)
  {
    gtk_list_box_set_show_separators(cast(GtkListBox*)cPtr, showSeparators);
  }

  /**
   * Sets a sort function.
   * By setting a sort function on the box one can dynamically reorder
   * the rows of the list, based on the contents of the rows.
   * The sort_func will be called for each row after the call, and will
   * continue to be called each time a row changes $(LPAREN)via
   * [Gtk.ListBoxRow.changed]$(RPAREN) and when [Gtk.ListBox.invalidateSort]
   * is called.
   * Note that using a sort function is incompatible with using a model
   * $(LPAREN)see [Gtk.ListBox.bindModel]$(RPAREN).
   * Params:
   *   sortFunc = the sort function
   */
  void setSortFunc(ListBoxSortFunc sortFunc)
  {
    extern(C) int _sortFuncCallback(GtkListBoxRow* row1, GtkListBoxRow* row2, void* userData)
    {
      auto _dlg = cast(ListBoxSortFunc*)userData;

      int _retval = (*_dlg)(ObjectG.getDObject!ListBoxRow(cast(void*)row1, No.Take), ObjectG.getDObject!ListBoxRow(cast(void*)row2, No.Take));
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;

    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_list_box_set_sort_func(cast(GtkListBox*)cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
   * Unselect all children of box, if the selection mode allows it.
   */
  void unselectAll()
  {
    gtk_list_box_unselect_all(cast(GtkListBox*)cPtr);
  }

  /**
   * Unselects a single row of box, if the selection mode allows it.
   * Params:
   *   row = the row to unselect
   */
  void unselectRow(ListBoxRow row)
  {
    gtk_list_box_unselect_row(cast(GtkListBox*)cPtr, row ? cast(GtkListBoxRow*)row.cPtr(No.Dup) : null);
  }

  alias ActivateCursorRowCallbackDlg = void delegate(ListBox listBox);
  alias ActivateCursorRowCallbackFunc = void function(ListBox listBox);

  /**
   * Connect to ActivateCursorRow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivateCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCursorRowCallbackDlg) || is(T : ActivateCursorRowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      _dClosure.dlg(listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-row", closure, after);
  }

  alias MoveCursorCallbackDlg = void delegate(MovementStep object, int p0, bool p1, bool p2, ListBox listBox);
  alias MoveCursorCallbackFunc = void function(MovementStep object, int p0, bool p1, bool p2, ListBox listBox);

  /**
   * Connect to MoveCursor signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveCursorCallbackDlg) || is(T : MoveCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      auto object = getVal!MovementStep(&_paramVals[1]);
      auto p0 = getVal!int(&_paramVals[2]);
      auto p1 = getVal!bool(&_paramVals[3]);
      auto p2 = getVal!bool(&_paramVals[4]);
      _dClosure.dlg(object, p0, p1, p2, listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
   * Emitted when a row has been activated by the user.
   * Params
   *   row = the activated row
   *   listBox = the instance the signal is connected to
   */
  alias RowActivatedCallbackDlg = void delegate(ListBoxRow row, ListBox listBox);
  alias RowActivatedCallbackFunc = void function(ListBoxRow row, ListBox listBox);

  /**
   * Connect to RowActivated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRowActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowActivatedCallbackDlg) || is(T : RowActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      auto row = getVal!ListBoxRow(&_paramVals[1]);
      _dClosure.dlg(row, listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-activated", closure, after);
  }

  /**
   * Emitted when a new row is selected, or $(LPAREN)with a %NULL row$(RPAREN)
   * when the selection is cleared.
   * When the box is using %GTK_SELECTION_MULTIPLE, this signal will not
   * give you the full picture of selection changes, and you should use
   * the signalGtk.ListBox::selected-rows-changed signal instead.
   * Params
   *   row = the selected row
   *   listBox = the instance the signal is connected to
   */
  alias RowSelectedCallbackDlg = void delegate(ListBoxRow row, ListBox listBox);
  alias RowSelectedCallbackFunc = void function(ListBoxRow row, ListBox listBox);

  /**
   * Connect to RowSelected signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRowSelected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RowSelectedCallbackDlg) || is(T : RowSelectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      auto row = getVal!ListBoxRow(&_paramVals[1]);
      _dClosure.dlg(row, listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-selected", closure, after);
  }

  /**
   * Emitted to select all children of the box, if the selection
   * mode permits it.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>.
   *   listBox = the instance the signal is connected to
   */
  alias SelectAllCallbackDlg = void delegate(ListBox listBox);
  alias SelectAllCallbackFunc = void function(ListBox listBox);

  /**
   * Connect to SelectAll signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectAllCallbackDlg) || is(T : SelectAllCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      _dClosure.dlg(listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
   * Emitted when the set of selected rows changes.
   *   listBox = the instance the signal is connected to
   */
  alias SelectedRowsChangedCallbackDlg = void delegate(ListBox listBox);
  alias SelectedRowsChangedCallbackFunc = void function(ListBox listBox);

  /**
   * Connect to SelectedRowsChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSelectedRowsChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectedRowsChangedCallbackDlg) || is(T : SelectedRowsChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      _dClosure.dlg(listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selected-rows-changed", closure, after);
  }

  alias ToggleCursorRowCallbackDlg = void delegate(ListBox listBox);
  alias ToggleCursorRowCallbackFunc = void function(ListBox listBox);

  /**
   * Connect to ToggleCursorRow signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectToggleCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggleCursorRowCallbackDlg) || is(T : ToggleCursorRowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      _dClosure.dlg(listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-row", closure, after);
  }

  /**
   * Emitted to unselect all children of the box, if the selection
   * mode permits it.
   * This is a [keybinding signal](class.SignalAction.html).
   * The default binding for this signal is
   * <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>.
   *   listBox = the instance the signal is connected to
   */
  alias UnselectAllCallbackDlg = void delegate(ListBox listBox);
  alias UnselectAllCallbackFunc = void function(ListBox listBox);

  /**
   * Connect to UnselectAll signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UnselectAllCallbackDlg) || is(T : UnselectAllCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listBox = getVal!ListBox(_paramVals);
      _dClosure.dlg(listBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}
