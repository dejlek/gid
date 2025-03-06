module gtk.flow_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.flow_box_child;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    A GtkFlowBox positions child widgets in sequence according to its
  orientation.
  
  For instance, with the horizontal orientation, the widgets will be
  arranged from left to right, starting a new row under the previous
  row when necessary. Reducing the width in this case will require more
  rows, so a larger height will be requested.
  
  Likewise, with the vertical orientation, the widgets will be arranged
  from top to bottom, starting a new column to the right when necessary.
  Reducing the height will require more columns, so a larger width will
  be requested.
  
  The size request of a GtkFlowBox alone may not be what you expect; if you
  need to be able to shrink it along both axes and dynamically reflow its
  children, you may have to wrap it in a #GtkScrolledWindow to enable that.
  
  The children of a GtkFlowBox can be dynamically sorted and filtered.
  
  Although a GtkFlowBox must have only #GtkFlowBoxChild children,
  you can add any kind of widget to it via [gtk.container.Container.add], and
  a GtkFlowBoxChild widget will automatically be inserted between
  the box and the widget.
  
  Also see #GtkListBox.
  
  GtkFlowBox was added in GTK+ 3.12.
  
  # CSS nodes
  
  ```plain
  flowbox
  ├── flowboxchild
  │   ╰── <child>
  ├── flowboxchild
  │   ╰── <child>
  ┊
  ╰── [rubberband]
  ```
  
  GtkFlowBox uses a single CSS node with name flowbox. GtkFlowBoxChild
  uses a single CSS node with name flowboxchild.
  For rubberband selection, a subnode with name rubberband is used.
*/
class FlowBox : gtk.container.Container, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_flow_box_get_type != &gidSymbolNotFound ? gtk_flow_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();

  /**
      Creates a GtkFlowBox.
    Returns:     a new #GtkFlowBox container
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_new();
    this(_cretval, No.Take);
  }

  /**
      Binds model to box.
    
    If box was already bound to a model, that previous binding is
    destroyed.
    
    The contents of box are cleared and then filled with widgets that
    represent items from model. box is updated whenever model changes.
    If model is null, box is left empty.
    
    It is undefined to add or remove widgets directly (for example, with
    [gtk.flow_box.FlowBox.insert] or [gtk.container.Container.add]) while box is bound to a
    model.
    
    Note that using a model is incompatible with the filtering and sorting
    functionality in GtkFlowBox. When using a model, filtering and sorting
    should be implemented by the model.
    Params:
      model =       the #GListModel to be bound to box
      createWidgetFunc =       a function that creates widgets for items
  */
  void bindModel(gio.list_model.ListModel model, gtk.types.FlowBoxCreateWidgetFunc createWidgetFunc)
  {
    extern(C) GtkWidget* _createWidgetFuncCallback(ObjectC* item, void* userData)
    {
      gtk.widget.Widget _dretval;
      auto _dlg = cast(gtk.types.FlowBoxCreateWidgetFunc*)userData;

      _dretval = (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)item, No.Take));
      GtkWidget* _retval = cast(GtkWidget*)_dretval.cPtr(Yes.Dup);

      return _retval;
    }
    auto _createWidgetFuncCB = createWidgetFunc ? &_createWidgetFuncCallback : null;

    auto _createWidgetFunc = createWidgetFunc ? freezeDelegate(cast(void*)&createWidgetFunc) : null;
    GDestroyNotify _createWidgetFuncDestroyCB = createWidgetFunc ? &thawDelegate : null;
    gtk_flow_box_bind_model(cast(GtkFlowBox*)cPtr, model ? cast(GListModel*)(cast(ObjectG)model).cPtr(No.Dup) : null, _createWidgetFuncCB, _createWidgetFunc, _createWidgetFuncDestroyCB);
  }

  /**
      Returns whether children activate on single clicks.
    Returns:     true if children are activated on single click,
          false otherwise
  */
  bool getActivateOnSingleClick()
  {
    bool _retval;
    _retval = gtk_flow_box_get_activate_on_single_click(cast(GtkFlowBox*)cPtr);
    return _retval;
  }

  /**
      Gets the nth child in the box.
    Params:
      idx =       the position of the child
    Returns:     the child widget, which will
          always be a #GtkFlowBoxChild or null in case no child widget
          with the given index exists.
  */
  gtk.flow_box_child.FlowBoxChild getChildAtIndex(int idx)
  {
    GtkFlowBoxChild* _cretval;
    _cretval = gtk_flow_box_get_child_at_index(cast(GtkFlowBox*)cPtr, idx);
    auto _retval = ObjectG.getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(GtkFlowBoxChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the child in the (x, y) position.
    Params:
      x =       the x coordinate of the child
      y =       the y coordinate of the child
    Returns:     the child widget, which will
          always be a #GtkFlowBoxChild or null in case no child widget
          exists for the given x and y coordinates.
  */
  gtk.flow_box_child.FlowBoxChild getChildAtPos(int x, int y)
  {
    GtkFlowBoxChild* _cretval;
    _cretval = gtk_flow_box_get_child_at_pos(cast(GtkFlowBox*)cPtr, x, y);
    auto _retval = ObjectG.getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(GtkFlowBoxChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal spacing.
    Returns:     the horizontal spacing
  */
  uint getColumnSpacing()
  {
    uint _retval;
    _retval = gtk_flow_box_get_column_spacing(cast(GtkFlowBox*)cPtr);
    return _retval;
  }

  /**
      Returns whether the box is homogeneous (all children are the
    same size). See [gtk.box.Box.setHomogeneous].
    Returns:     true if the box is homogeneous.
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = gtk_flow_box_get_homogeneous(cast(GtkFlowBox*)cPtr);
    return _retval;
  }

  /**
      Gets the maximum number of children per line.
    Returns:     the maximum number of children per line
  */
  uint getMaxChildrenPerLine()
  {
    uint _retval;
    _retval = gtk_flow_box_get_max_children_per_line(cast(GtkFlowBox*)cPtr);
    return _retval;
  }

  /**
      Gets the minimum number of children per line.
    Returns:     the minimum number of children per line
  */
  uint getMinChildrenPerLine()
  {
    uint _retval;
    _retval = gtk_flow_box_get_min_children_per_line(cast(GtkFlowBox*)cPtr);
    return _retval;
  }

  /**
      Gets the vertical spacing.
    Returns:     the vertical spacing
  */
  uint getRowSpacing()
  {
    uint _retval;
    _retval = gtk_flow_box_get_row_spacing(cast(GtkFlowBox*)cPtr);
    return _retval;
  }

  /**
      Creates a list of all selected children.
    Returns:     A #GList containing the #GtkWidget for each selected child.
          Free with [glib.list.List.free] when done.
  */
  gtk.flow_box_child.FlowBoxChild[] getSelectedChildren()
  {
    GList* _cretval;
    _cretval = gtk_flow_box_get_selected_children(cast(GtkFlowBox*)cPtr);
    auto _retval = gListToD!(gtk.flow_box_child.FlowBoxChild, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of box.
    Returns:     the #GtkSelectionMode
  */
  gtk.types.SelectionMode getSelectionMode()
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_flow_box_get_selection_mode(cast(GtkFlowBox*)cPtr);
    gtk.types.SelectionMode _retval = cast(gtk.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Inserts the widget into box at position.
    
    If a sort function is set, the widget will actually be inserted
    at the calculated position and this function has the same effect
    as [gtk.container.Container.add].
    
    If position is -1, or larger than the total number of children
    in the box, then the widget will be appended to the end.
    Params:
      widget =       the #GtkWidget to add
      position =       the position to insert child in
  */
  void insert(gtk.widget.Widget widget, int position)
  {
    gtk_flow_box_insert(cast(GtkFlowBox*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null, position);
  }

  /**
      Updates the filtering for all children.
    
    Call this function when the result of the filter
    function on the box is changed due ot an external
    factor. For instance, this would be used if the
    filter function just looked for a specific search
    term, and the entry with the string has changed.
  */
  void invalidateFilter()
  {
    gtk_flow_box_invalidate_filter(cast(GtkFlowBox*)cPtr);
  }

  /**
      Updates the sorting for all children.
    
    Call this when the result of the sort function on
    box is changed due to an external factor.
  */
  void invalidateSort()
  {
    gtk_flow_box_invalidate_sort(cast(GtkFlowBox*)cPtr);
  }

  /**
      Select all children of box, if the selection
    mode allows it.
  */
  void selectAll()
  {
    gtk_flow_box_select_all(cast(GtkFlowBox*)cPtr);
  }

  /**
      Selects a single child of box, if the selection
    mode allows it.
    Params:
      child =       a child of box
  */
  void selectChild(gtk.flow_box_child.FlowBoxChild child)
  {
    gtk_flow_box_select_child(cast(GtkFlowBox*)cPtr, child ? cast(GtkFlowBoxChild*)child.cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected child.
    
    Note that the selection cannot be modified from within
    this function.
    Params:
      func =       the function to call for each selected child
  */
  void selectedForeach(gtk.types.FlowBoxForeachFunc func)
  {
    extern(C) void _funcCallback(GtkFlowBox* box, GtkFlowBoxChild* child, void* userData)
    {
      auto _dlg = cast(gtk.types.FlowBoxForeachFunc*)userData;

      (*_dlg)(ObjectG.getDObject!(gtk.flow_box.FlowBox)(cast(void*)box, No.Take), ObjectG.getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gtk_flow_box_selected_foreach(cast(GtkFlowBox*)cPtr, _funcCB, _func);
  }

  /**
      If single is true, children will be activated when you click
    on them, otherwise you need to double-click.
    Params:
      single =       true to emit child-activated on a single click
  */
  void setActivateOnSingleClick(bool single)
  {
    gtk_flow_box_set_activate_on_single_click(cast(GtkFlowBox*)cPtr, single);
  }

  /**
      Sets the horizontal space to add between children.
    See the #GtkFlowBox:column-spacing property.
    Params:
      spacing =       the spacing to use
  */
  void setColumnSpacing(uint spacing)
  {
    gtk_flow_box_set_column_spacing(cast(GtkFlowBox*)cPtr, spacing);
  }

  /**
      By setting a filter function on the box one can decide dynamically
    which of the children to show. For instance, to implement a search
    function that only shows the children matching the search terms.
    
    The filter_func will be called for each child after the call, and
    it will continue to be called each time a child changes (via
    [gtk.flow_box_child.FlowBoxChild.changed]) or when [gtk.flow_box.FlowBox.invalidateFilter]
    is called.
    
    Note that using a filter function is incompatible with using a model
    (see [gtk.flow_box.FlowBox.bindModel]).
    Params:
      filterFunc =       callback that
            lets you filter which children to show
  */
  void setFilterFunc(gtk.types.FlowBoxFilterFunc filterFunc = null)
  {
    extern(C) bool _filterFuncCallback(GtkFlowBoxChild* child, void* userData)
    {
      auto _dlg = cast(gtk.types.FlowBoxFilterFunc*)userData;

      bool _retval = (*_dlg)(ObjectG.getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child, No.Take));
      return _retval;
    }
    auto _filterFuncCB = filterFunc ? &_filterFuncCallback : null;

    auto _filterFunc = filterFunc ? freezeDelegate(cast(void*)&filterFunc) : null;
    GDestroyNotify _filterFuncDestroyCB = filterFunc ? &thawDelegate : null;
    gtk_flow_box_set_filter_func(cast(GtkFlowBox*)cPtr, _filterFuncCB, _filterFunc, _filterFuncDestroyCB);
  }

  /**
      Hooks up an adjustment to focus handling in box.
    The adjustment is also used for autoscrolling during
    rubberband selection. See [gtk.scrolled_window.ScrolledWindow.getHadjustment]
    for a typical way of obtaining the adjustment, and
    [gtk.flow_box.FlowBox.setVadjustment]for setting the vertical
    adjustment.
    
    The adjustments have to be in pixel units and in the same
    coordinate system as the allocation for immediate children
    of the box.
    Params:
      adjustment =       an adjustment which should be adjusted
           when the focus is moved among the descendents of container
  */
  void setHadjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_flow_box_set_hadjustment(cast(GtkFlowBox*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkFlowBox:homogeneous property of box, controlling
    whether or not all children of box are given equal space
    in the box.
    Params:
      homogeneous =       true to create equal allotments,
          false for variable allotments
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_flow_box_set_homogeneous(cast(GtkFlowBox*)cPtr, homogeneous);
  }

  /**
      Sets the maximum number of children to request and
    allocate space for in box’s orientation.
    
    Setting the maximum number of children per line
    limits the overall natural size request to be no more
    than n_children children long in the given orientation.
    Params:
      nChildren =       the maximum number of children per line
  */
  void setMaxChildrenPerLine(uint nChildren)
  {
    gtk_flow_box_set_max_children_per_line(cast(GtkFlowBox*)cPtr, nChildren);
  }

  /**
      Sets the minimum number of children to line up
    in box’s orientation before flowing.
    Params:
      nChildren =       the minimum number of children per line
  */
  void setMinChildrenPerLine(uint nChildren)
  {
    gtk_flow_box_set_min_children_per_line(cast(GtkFlowBox*)cPtr, nChildren);
  }

  /**
      Sets the vertical space to add between children.
    See the #GtkFlowBox:row-spacing property.
    Params:
      spacing =       the spacing to use
  */
  void setRowSpacing(uint spacing)
  {
    gtk_flow_box_set_row_spacing(cast(GtkFlowBox*)cPtr, spacing);
  }

  /**
      Sets how selection works in box.
    See #GtkSelectionMode for details.
    Params:
      mode =       the new selection mode
  */
  void setSelectionMode(gtk.types.SelectionMode mode)
  {
    gtk_flow_box_set_selection_mode(cast(GtkFlowBox*)cPtr, mode);
  }

  /**
      By setting a sort function on the box, one can dynamically
    reorder the children of the box, based on the contents of
    the children.
    
    The sort_func will be called for each child after the call,
    and will continue to be called each time a child changes (via
    [gtk.flow_box_child.FlowBoxChild.changed]) and when [gtk.flow_box.FlowBox.invalidateSort]
    is called.
    
    Note that using a sort function is incompatible with using a model
    (see [gtk.flow_box.FlowBox.bindModel]).
    Params:
      sortFunc =       the sort function
  */
  void setSortFunc(gtk.types.FlowBoxSortFunc sortFunc = null)
  {
    extern(C) int _sortFuncCallback(GtkFlowBoxChild* child1, GtkFlowBoxChild* child2, void* userData)
    {
      auto _dlg = cast(gtk.types.FlowBoxSortFunc*)userData;

      int _retval = (*_dlg)(ObjectG.getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child1, No.Take), ObjectG.getDObject!(gtk.flow_box_child.FlowBoxChild)(cast(void*)child2, No.Take));
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;

    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_flow_box_set_sort_func(cast(GtkFlowBox*)cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Hooks up an adjustment to focus handling in box.
    The adjustment is also used for autoscrolling during
    rubberband selection. See [gtk.scrolled_window.ScrolledWindow.getVadjustment]
    for a typical way of obtaining the adjustment, and
    [gtk.flow_box.FlowBox.setHadjustment]for setting the horizontal
    adjustment.
    
    The adjustments have to be in pixel units and in the same
    coordinate system as the allocation for immediate children
    of the box.
    Params:
      adjustment =       an adjustment which should be adjusted
           when the focus is moved among the descendents of container
  */
  void setVadjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_flow_box_set_vadjustment(cast(GtkFlowBox*)cPtr, adjustment ? cast(GtkAdjustment*)adjustment.cPtr(No.Dup) : null);
  }

  /**
      Unselect all children of box, if the selection
    mode allows it.
  */
  void unselectAll()
  {
    gtk_flow_box_unselect_all(cast(GtkFlowBox*)cPtr);
  }

  /**
      Unselects a single child of box, if the selection
    mode allows it.
    Params:
      child =       a child of box
  */
  void unselectChild(gtk.flow_box_child.FlowBoxChild child)
  {
    gtk_flow_box_unselect_child(cast(GtkFlowBox*)cPtr, child ? cast(GtkFlowBoxChild*)child.cPtr(No.Dup) : null);
  }

  /**
      The ::activate-cursor-child signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted when the user activates the box.
  
    ## Parameters
    $(LIST
      * $(B flowBox) the instance the signal is connected to
    )
  */
  alias ActivateCursorChildCallbackDlg = void delegate(gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias ActivateCursorChildCallbackFunc = void function(gtk.flow_box.FlowBox flowBox);

  /**
    Connect to ActivateCursorChild signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivateCursorChild(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCursorChildCallbackDlg) || is(T : ActivateCursorChildCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      _dClosure.dlg(flowBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-child", closure, after);
  }

  /**
      The ::child-activated signal is emitted when a child has been
    activated by the user.
  
    ## Parameters
    $(LIST
      * $(B child)       the child that is activated
      * $(B flowBox) the instance the signal is connected to
    )
  */
  alias ChildActivatedCallbackDlg = void delegate(gtk.flow_box_child.FlowBoxChild child, gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias ChildActivatedCallbackFunc = void function(gtk.flow_box_child.FlowBoxChild child, gtk.flow_box.FlowBox flowBox);

  /**
    Connect to ChildActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChildActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChildActivatedCallbackDlg) || is(T : ChildActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      auto child = getVal!(gtk.flow_box_child.FlowBoxChild)(&_paramVals[1]);
      _dClosure.dlg(child, flowBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-activated", closure, after);
  }

  /**
      The ::move-cursor signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted when the user initiates a cursor movement.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control the cursor
    programmatically.
    
    The default bindings for this signal come in two variants,
    the variant with the Shift modifier extends the selection,
    the variant without the Shift modifer does not.
    There are too many key combinations to list them all here.
    $(LIST
      * Arrow keys move by individual children
      * Home/End keys move to the ends of the box
      * PageUp/PageDown keys move vertically by pages
    )
  
    ## Parameters
    $(LIST
      * $(B step)       the granularity fo the move, as a #GtkMovementStep
      * $(B count)       the number of step units to move
      * $(B flowBox) the instance the signal is connected to
    )
    Returns:     true to stop other handlers from being invoked for the event.
      false to propagate the event further.
  */
  alias MoveCursorCallbackDlg = bool delegate(gtk.types.MovementStep step, int count, gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias MoveCursorCallbackFunc = bool function(gtk.types.MovementStep step, int count, gtk.flow_box.FlowBox flowBox);

  /**
    Connect to MoveCursor signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveCursorCallbackDlg) || is(T : MoveCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      auto step = getVal!(gtk.types.MovementStep)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      _retval = _dClosure.dlg(step, count, flowBox);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      The ::select-all signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to select all children of the box, if
    the selection mode permits it.
    
    The default bindings for this signal is Ctrl-a.
  
    ## Parameters
    $(LIST
      * $(B flowBox) the instance the signal is connected to
    )
  */
  alias SelectAllCallbackDlg = void delegate(gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias SelectAllCallbackFunc = void function(gtk.flow_box.FlowBox flowBox);

  /**
    Connect to SelectAll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectAllCallbackDlg) || is(T : SelectAllCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      _dClosure.dlg(flowBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      The ::selected-children-changed signal is emitted when the
    set of selected children changes.
    
    Use [gtk.flow_box.FlowBox.selectedForeach] or
    [gtk.flow_box.FlowBox.getSelectedChildren] to obtain the
    selected children.
  
    ## Parameters
    $(LIST
      * $(B flowBox) the instance the signal is connected to
    )
  */
  alias SelectedChildrenChangedCallbackDlg = void delegate(gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias SelectedChildrenChangedCallbackFunc = void function(gtk.flow_box.FlowBox flowBox);

  /**
    Connect to SelectedChildrenChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectedChildrenChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectedChildrenChangedCallbackDlg) || is(T : SelectedChildrenChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      _dClosure.dlg(flowBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selected-children-changed", closure, after);
  }

  /**
      The ::toggle-cursor-child signal is a
    [keybinding signal][GtkBindingSignal]
    which toggles the selection of the child that has the focus.
    
    The default binding for this signal is Ctrl-Space.
  
    ## Parameters
    $(LIST
      * $(B flowBox) the instance the signal is connected to
    )
  */
  alias ToggleCursorChildCallbackDlg = void delegate(gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias ToggleCursorChildCallbackFunc = void function(gtk.flow_box.FlowBox flowBox);

  /**
    Connect to ToggleCursorChild signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToggleCursorChild(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggleCursorChildCallbackDlg) || is(T : ToggleCursorChildCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      _dClosure.dlg(flowBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-child", closure, after);
  }

  /**
      The ::unselect-all signal is a
    [keybinding signal][GtkBindingSignal]
    which gets emitted to unselect all children of the box, if
    the selection mode permits it.
    
    The default bindings for this signal is Ctrl-Shift-a.
  
    ## Parameters
    $(LIST
      * $(B flowBox) the instance the signal is connected to
    )
  */
  alias UnselectAllCallbackDlg = void delegate(gtk.flow_box.FlowBox flowBox);

  /** ditto */
  alias UnselectAllCallbackFunc = void function(gtk.flow_box.FlowBox flowBox);

  /**
    Connect to UnselectAll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UnselectAllCallbackDlg) || is(T : UnselectAllCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto flowBox = getVal!(gtk.flow_box.FlowBox)(_paramVals);
      _dClosure.dlg(flowBox);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}
