module gtk.icon_view;

import gdk.content_formats;
import gdk.paintable;
import gdk.rectangle;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.cell_renderer;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.tooltip;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_path;
import gtk.types;
import gtk.widget;

/**
    [gtk.icon_view.IconView] is a widget which displays data in a grid of icons.
  
  [gtk.icon_view.IconView] provides an alternative view on a [gtk.tree_model.TreeModel].
  It displays the model as a grid of icons with labels. Like
  [gtk.tree_view.TreeView], it allows to select one or multiple items
  (depending on the selection mode, see [gtk.icon_view.IconView.setSelectionMode]).
  In addition to selection with the arrow keys, [gtk.icon_view.IconView] supports
  rubberband selection, which is controlled by dragging the pointer.
  
  Note that if the tree model is backed by an actual tree store (as
  opposed to a flat list where the mapping to icons is obvious),
  [gtk.icon_view.IconView] will only display the first level of the tree and
  ignore the tree’s branches.
  
  ## CSS nodes
  
  ```
  iconview.view
  ╰── [rubberband]
  ```
  
  [gtk.icon_view.IconView] has a single CSS node with name iconview and style class .view.
  For rubberband selection, a subnode with name rubberband is used.

  Deprecated:     Use [gtk.grid_view.GridView] instead
*/
class IconView : gtk.widget.Widget, gtk.cell_layout.CellLayout, gtk.scrollable.Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_icon_view_get_type != &gidSymbolNotFound ? gtk_icon_view_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin CellLayoutT!();
  mixin ScrollableT!();

  /**
      Creates a new [gtk.icon_view.IconView] widget
    Returns:     A newly created [gtk.icon_view.IconView] widget
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.icon_view.IconView] widget using the
    specified area to layout cells inside the icons.
    Params:
      area =       the [gtk.cell_area.CellArea] to use to layout cells
    Returns:     A newly created [gtk.icon_view.IconView] widget
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  static gtk.icon_view.IconView newWithArea(gtk.cell_area.CellArea area)
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new_with_area(area ? cast(GtkCellArea*)area.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.icon_view.IconView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.icon_view.IconView] widget with the model model.
    Params:
      model =       The model.
    Returns:     A newly created [gtk.icon_view.IconView] widget.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  static gtk.icon_view.IconView newWithModel(gtk.tree_model.TreeModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new_with_model(model ? cast(GtkTreeModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.icon_view.IconView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gdk.paintable.Paintable] representation of the item at path.
    This image is used for a drag icon.
    Params:
      path =       a [gtk.tree_path.TreePath] in icon_view
    Returns:     a newly-allocated [gdk.paintable.Paintable] of the drag icon.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  gdk.paintable.Paintable createDragIcon(gtk.tree_path.TreePath path)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_icon_view_create_drag_icon(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Turns icon_view into a drop destination for automatic DND. Calling this
    method sets [gtk.icon_view.IconView]:reorderable to false.
    Params:
      formats =       the formats that the drag will support
      actions =       the bitmask of possible actions for a drag to this
           widget
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void enableModelDragDest(gdk.content_formats.ContentFormats formats, gdk.types.DragAction actions)
  {
    gtk_icon_view_enable_model_drag_dest(cast(GtkIconView*)cPtr, formats ? cast(GdkContentFormats*)formats.cPtr(No.Dup) : null, actions);
  }

  /**
      Turns icon_view into a drag source for automatic DND. Calling this
    method sets [gtk.icon_view.IconView]:reorderable to false.
    Params:
      startButtonMask =       Mask of allowed buttons to start drag
      formats =       the formats that the drag will support
      actions =       the bitmask of possible actions for a drag from this
           widget
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void enableModelDragSource(gdk.types.ModifierType startButtonMask, gdk.content_formats.ContentFormats formats, gdk.types.DragAction actions)
  {
    gtk_icon_view_enable_model_drag_source(cast(GtkIconView*)cPtr, startButtonMask, formats ? cast(GdkContentFormats*)formats.cPtr(No.Dup) : null, actions);
  }

  /**
      Gets the setting set by [gtk.icon_view.IconView.setActivateOnSingleClick].
    Returns:     true if item-activated will be emitted on a single click
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getActivateOnSingleClick()
  {
    bool _retval;
    _retval = gtk_icon_view_get_activate_on_single_click(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Fills the bounding rectangle in widget coordinates for the cell specified by
    path and cell. If cell is null the main cell area is used.
    
    This function is only valid if icon_view is realized.
    Params:
      path =       a [gtk.tree_path.TreePath]
      cell =       a [gtk.cell_renderer.CellRenderer]
      rect =       rectangle to fill with cell rect
    Returns:     false if there is no such item, true otherwise
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getCellRect(gtk.tree_path.TreePath path, gtk.cell_renderer.CellRenderer cell, out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    GdkRectangle _rect;
    _retval = gtk_icon_view_get_cell_rect(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell.cPtr(No.Dup) : null, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
    return _retval;
  }

  /**
      Returns the value of the ::column-spacing property.
    Returns:     the space between columns
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getColumnSpacing()
  {
    int _retval;
    _retval = gtk_icon_view_get_column_spacing(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the value of the ::columns property.
    Returns:     the number of columns, or -1
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getColumns()
  {
    int _retval;
    _retval = gtk_icon_view_get_columns(cast(GtkIconView*)cPtr);
    return _retval;
  }

  alias getCursor = gtk.widget.Widget.getCursor;

  /**
      Fills in path and cell with the current cursor path and cell.
    If the cursor isn’t currently set, then *path will be null.
    If no cell currently has focus, then *cell will be null.
    
    The returned [gtk.tree_path.TreePath] must be freed with [gtk.tree_path.TreePath.free].
    Params:
      path =       Return location for the current
          cursor path
      cell =       Return location the current
          focus cell
    Returns:     true if the cursor is set.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getCursor(out gtk.tree_path.TreePath path, out gtk.cell_renderer.CellRenderer cell)
  {
    bool _retval;
    GtkTreePath* _path;
    GtkCellRenderer* _cell;
    _retval = gtk_icon_view_get_cursor(cast(GtkIconView*)cPtr, &_path, &_cell);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    cell = new gtk.cell_renderer.CellRenderer(cast(void*)_cell, No.Take);
    return _retval;
  }

  /**
      Determines the destination item for a given position.
    Params:
      dragX =       the position to determine the destination item for
      dragY =       the position to determine the destination item for
      path =       Return location for the path of the item
      pos =       Return location for the drop position
    Returns:     whether there is an item at the given position.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getDestItemAtPos(int dragX, int dragY, out gtk.tree_path.TreePath path, out gtk.types.IconViewDropPosition pos)
  {
    bool _retval;
    GtkTreePath* _path;
    _retval = gtk_icon_view_get_dest_item_at_pos(cast(GtkIconView*)cPtr, dragX, dragY, &_path, &pos);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    return _retval;
  }

  /**
      Gets information about the item that is highlighted for feedback.
    Params:
      path =       Return location for the path of
          the highlighted item
      pos =       Return location for the drop position
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void getDragDestItem(out gtk.tree_path.TreePath path, out gtk.types.IconViewDropPosition pos)
  {
    GtkTreePath* _path;
    gtk_icon_view_get_drag_dest_item(cast(GtkIconView*)cPtr, &_path, &pos);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
  }

  /**
      Gets the path and cell for the icon at the given position.
    Params:
      x =       The x position to be identified
      y =       The y position to be identified
      path =       Return location for the path
      cell =       Return location for the renderer
          responsible for the cell at (x, y)
    Returns:     true if an item exists at the specified position
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getItemAtPos(int x, int y, out gtk.tree_path.TreePath path, out gtk.cell_renderer.CellRenderer cell)
  {
    bool _retval;
    GtkTreePath* _path;
    GtkCellRenderer* _cell;
    _retval = gtk_icon_view_get_item_at_pos(cast(GtkIconView*)cPtr, x, y, &_path, &_cell);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    cell = new gtk.cell_renderer.CellRenderer(cast(void*)_cell, No.Take);
    return _retval;
  }

  /**
      Gets the column in which the item path is currently
    displayed. Column numbers start at 0.
    Params:
      path =       the [gtk.tree_path.TreePath] of the item
    Returns:     The column in which the item is displayed
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getItemColumn(gtk.tree_path.TreePath path)
  {
    int _retval;
    _retval = gtk_icon_view_get_item_column(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the value of the ::item-orientation property which determines
    whether the labels are drawn beside the icons instead of below.
    Returns:     the relative position of texts and icons
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  gtk.types.Orientation getItemOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_icon_view_get_item_orientation(cast(GtkIconView*)cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the value of the ::item-padding property.
    Returns:     the padding around items
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getItemPadding()
  {
    int _retval;
    _retval = gtk_icon_view_get_item_padding(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Gets the row in which the item path is currently
    displayed. Row numbers start at 0.
    Params:
      path =       the [gtk.tree_path.TreePath] of the item
    Returns:     The row in which the item is displayed
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getItemRow(gtk.tree_path.TreePath path)
  {
    int _retval;
    _retval = gtk_icon_view_get_item_row(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the value of the ::item-width property.
    Returns:     the width of a single item, or -1
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getItemWidth()
  {
    int _retval;
    _retval = gtk_icon_view_get_item_width(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the value of the ::margin property.
    Returns:     the space at the borders
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getMargin()
  {
    int _retval;
    _retval = gtk_icon_view_get_margin(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the column with markup text for icon_view.
    Returns:     the markup column, or -1 if it’s unset.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getMarkupColumn()
  {
    int _retval;
    _retval = gtk_icon_view_get_markup_column(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the model the [gtk.icon_view.IconView] is based on.  Returns null if the
    model is unset.
    Returns:     The currently used [gtk.tree_model.TreeModel]
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_icon_view_get_model(cast(GtkIconView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the path for the icon at the given position.
    Params:
      x =       The x position to be identified
      y =       The y position to be identified
    Returns:     The [gtk.tree_path.TreePath] corresponding
      to the icon or null if no icon exists at that position.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  gtk.tree_path.TreePath getPathAtPos(int x, int y)
  {
    GtkTreePath* _cretval;
    _cretval = gtk_icon_view_get_path_at_pos(cast(GtkIconView*)cPtr, x, y);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the column with pixbufs for icon_view.
    Returns:     the pixbuf column, or -1 if it’s unset.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getPixbufColumn()
  {
    int _retval;
    _retval = gtk_icon_view_get_pixbuf_column(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Retrieves whether the user can reorder the list via drag-and-drop.
    See [gtk.icon_view.IconView.setReorderable].
    Returns:     true if the list can be reordered.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getReorderable()
  {
    bool _retval;
    _retval = gtk_icon_view_get_reorderable(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the value of the ::row-spacing property.
    Returns:     the space between rows
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getRowSpacing()
  {
    int _retval;
    _retval = gtk_icon_view_get_row_spacing(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Creates a list of paths of all selected items. Additionally, if you are
    planning on modifying the model after calling this function, you may
    want to convert the returned list into a list of `GtkTreeRowReferences`.
    To do this, you can use [gtk.tree_row_reference.TreeRowReference.new_].
    
    To free the return value, use [glib.list.List.freeFull]:
    ```c
    GtkWidget *icon_view = gtk_icon_view_new ();
    // Use icon_view
    
    GList *list = gtk_icon_view_get_selected_items (GTK_ICON_VIEW (icon_view));
    
    // use list
    
    g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
    ```
    Returns:     A [glib.list.List] containing a [gtk.tree_path.TreePath] for each selected row.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  gtk.tree_path.TreePath[] getSelectedItems()
  {
    GList* _cretval;
    _cretval = gtk_icon_view_get_selected_items(cast(GtkIconView*)cPtr);
    auto _retval = gListToD!(gtk.tree_path.TreePath, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of the icon_view.
    Returns:     the current selection mode
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  gtk.types.SelectionMode getSelectionMode()
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_icon_view_get_selection_mode(cast(GtkIconView*)cPtr);
    gtk.types.SelectionMode _retval = cast(gtk.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Returns the value of the ::spacing property.
    Returns:     the space between cells
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_icon_view_get_spacing(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the column with text for icon_view.
    Returns:     the text column, or -1 if it’s unset.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getTextColumn()
  {
    int _retval;
    _retval = gtk_icon_view_get_text_column(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      Returns the column of icon_view’s model which is being used for
    displaying tooltips on icon_view’s rows.
    Returns:     the index of the tooltip column that is currently being
      used, or -1 if this is disabled.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  int getTooltipColumn()
  {
    int _retval;
    _retval = gtk_icon_view_get_tooltip_column(cast(GtkIconView*)cPtr);
    return _retval;
  }

  /**
      This function is supposed to be used in a `GtkWidget::query-tooltip`
    signal handler for [gtk.icon_view.IconView]. The x, y and keyboard_tip values
    which are received in the signal handler, should be passed to this
    function without modification.
    
    The return value indicates whether there is an icon view item at the given
    coordinates (true) or not (false) for mouse tooltips. For keyboard
    tooltips the item returned will be the cursor item. When true, then any of
    model, path and iter which have been provided will be set to point to
    that row and the corresponding model.
    Params:
      x =       the x coordinate (relative to widget coordinates)
      y =       the y coordinate (relative to widget coordinates)
      keyboardTip =       whether this is a keyboard tooltip or not
      model =       a pointer to receive a [gtk.tree_model.TreeModel]
      path =       a pointer to receive a [gtk.tree_path.TreePath]
      iter =       a pointer to receive a [gtk.tree_iter.TreeIter]
    Returns:     whether or not the given tooltip context points to an item
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getTooltipContext(int x, int y, bool keyboardTip, out gtk.tree_model.TreeModel model, out gtk.tree_path.TreePath path, out gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    GtkTreeModel* _model;
    GtkTreePath* _path;
    GtkTreeIter _iter;
    _retval = gtk_icon_view_get_tooltip_context(cast(GtkIconView*)cPtr, x, y, keyboardTip, &_model, &_path, &_iter);
    model = ObjectG.getDObject!(gtk.tree_model.TreeModel)(_model, No.Take);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Sets start_path and end_path to be the first and last visible path.
    Note that there may be invisible paths in between.
    
    Both paths should be freed with [gtk.tree_path.TreePath.free] after use.
    Params:
      startPath =       Return location for start of region
      endPath =       Return location for end of region
    Returns:     true, if valid paths were placed in start_path and end_path
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool getVisibleRange(out gtk.tree_path.TreePath startPath, out gtk.tree_path.TreePath endPath)
  {
    bool _retval;
    GtkTreePath* _startPath;
    GtkTreePath* _endPath;
    _retval = gtk_icon_view_get_visible_range(cast(GtkIconView*)cPtr, &_startPath, &_endPath);
    startPath = new gtk.tree_path.TreePath(cast(void*)_startPath, Yes.Take);
    endPath = new gtk.tree_path.TreePath(cast(void*)_endPath, Yes.Take);
    return _retval;
  }

  /**
      Activates the item determined by path.
    Params:
      path =       The [gtk.tree_path.TreePath] to be activated
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void itemActivated(gtk.tree_path.TreePath path)
  {
    gtk_icon_view_item_activated(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
  }

  /**
      Returns true if the icon pointed to by path is currently
    selected. If path does not point to a valid location, false is returned.
    Params:
      path =       A [gtk.tree_path.TreePath] to check selection on.
    Returns:     true if path is selected.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  bool pathIsSelected(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = gtk_icon_view_path_is_selected(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the alignments of icon_view to the position specified by path.
    row_align determines where the row is placed, and col_align determines
    where column is placed.  Both are expected to be between 0.0 and 1.0.
    0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
    center.
    
    If use_align is false, then the alignment arguments are ignored, and the
    tree does the minimum amount of work to scroll the item onto the screen.
    This means that the item will be scrolled to the edge closest to its current
    position.  If the item is currently visible on the screen, nothing is done.
    
    This function only works if the model is set, and path is a valid row on
    the model. If the model changes before the icon_view is realized, the
    centered path will be modified to reflect this change.
    Params:
      path =       The path of the item to move to.
      useAlign =       whether to use alignment arguments, or false.
      rowAlign =       The vertical alignment of the item specified by path.
      colAlign =       The horizontal alignment of the item specified by path.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void scrollToPath(gtk.tree_path.TreePath path, bool useAlign, float rowAlign, float colAlign)
  {
    gtk_icon_view_scroll_to_path(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null, useAlign, rowAlign, colAlign);
  }

  /**
      Selects all the icons. icon_view must has its selection mode set
    to [gtk.types.SelectionMode.Multiple].
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void selectAll()
  {
    gtk_icon_view_select_all(cast(GtkIconView*)cPtr);
  }

  /**
      Selects the row at path.
    Params:
      path =       The [gtk.tree_path.TreePath] to be selected.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void selectPath(gtk.tree_path.TreePath path)
  {
    gtk_icon_view_select_path(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected icon. Note that the model or
    selection cannot be modified from within this function.
    Params:
      func =       The function to call for each selected icon.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void selectedForeach(gtk.types.IconViewForeachFunc func)
  {
    extern(C) void _funcCallback(GtkIconView* iconView, GtkTreePath* path, void* data)
    {
      auto _dlg = cast(gtk.types.IconViewForeachFunc*)data;

      (*_dlg)(ObjectG.getDObject!(gtk.icon_view.IconView)(cast(void*)iconView, No.Take), path ? new gtk.tree_path.TreePath(cast(void*)path, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    gtk_icon_view_selected_foreach(cast(GtkIconView*)cPtr, _funcCB, _func);
  }

  /**
      Causes the [gtk.icon_view.IconView]::item-activated signal to be emitted on
    a single click instead of a double click.
    Params:
      single =       true to emit item-activated on a single click
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setActivateOnSingleClick(bool single)
  {
    gtk_icon_view_set_activate_on_single_click(cast(GtkIconView*)cPtr, single);
  }

  /**
      Sets the ::column-spacing property which specifies the space
    which is inserted between the columns of the icon view.
    Params:
      columnSpacing =       the column spacing
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setColumnSpacing(int columnSpacing)
  {
    gtk_icon_view_set_column_spacing(cast(GtkIconView*)cPtr, columnSpacing);
  }

  /**
      Sets the ::columns property which determines in how
    many columns the icons are arranged. If columns is
    -1, the number of columns will be chosen automatically
    to fill the available area.
    Params:
      columns =       the number of columns
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setColumns(int columns)
  {
    gtk_icon_view_set_columns(cast(GtkIconView*)cPtr, columns);
  }

  alias setCursor = gtk.widget.Widget.setCursor;

  /**
      Sets the current keyboard focus to be at path, and selects it.  This is
    useful when you want to focus the user’s attention on a particular item.
    If cell is not null, then focus is given to the cell specified by
    it. Additionally, if start_editing is true, then editing should be
    started in the specified cell.
    
    This function is often followed by `gtk_widget_grab_focus
    (icon_view)` in order to give keyboard focus to the widget.
    Please note that editing can only happen when the widget is realized.
    Params:
      path =       A [gtk.tree_path.TreePath]
      cell =       One of the cell renderers of icon_view
      startEditing =       true if the specified cell should start being edited.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setCursor(gtk.tree_path.TreePath path, gtk.cell_renderer.CellRenderer cell, bool startEditing)
  {
    gtk_icon_view_set_cursor(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell.cPtr(No.Dup) : null, startEditing);
  }

  /**
      Sets the item that is highlighted for feedback.
    Params:
      path =       The path of the item to highlight
      pos =       Specifies where to drop, relative to the item
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setDragDestItem(gtk.tree_path.TreePath path, gtk.types.IconViewDropPosition pos)
  {
    gtk_icon_view_set_drag_dest_item(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null, pos);
  }

  /**
      Sets the ::item-orientation property which determines whether the labels
    are drawn beside the icons instead of below.
    Params:
      orientation =       the relative position of texts and icons
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setItemOrientation(gtk.types.Orientation orientation)
  {
    gtk_icon_view_set_item_orientation(cast(GtkIconView*)cPtr, orientation);
  }

  /**
      Sets the [gtk.icon_view.IconView]:item-padding property which specifies the padding
    around each of the icon view’s items.
    Params:
      itemPadding =       the item padding
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setItemPadding(int itemPadding)
  {
    gtk_icon_view_set_item_padding(cast(GtkIconView*)cPtr, itemPadding);
  }

  /**
      Sets the ::item-width property which specifies the width
    to use for each item. If it is set to -1, the icon view will
    automatically determine a suitable item size.
    Params:
      itemWidth =       the width for each item
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setItemWidth(int itemWidth)
  {
    gtk_icon_view_set_item_width(cast(GtkIconView*)cPtr, itemWidth);
  }

  /**
      Sets the ::margin property which specifies the space
    which is inserted at the top, bottom, left and right
    of the icon view.
    Params:
      margin =       the margin
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setMargin(int margin)
  {
    gtk_icon_view_set_margin(cast(GtkIconView*)cPtr, margin);
  }

  /**
      Sets the column with markup information for icon_view to be
    column. The markup column must be of type `G_TYPE_STRING`.
    If the markup column is set to something, it overrides
    the text column set by [gtk.icon_view.IconView.setTextColumn].
    Params:
      column =       A column in the currently used model, or -1 to display no text
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setMarkupColumn(int column)
  {
    gtk_icon_view_set_markup_column(cast(GtkIconView*)cPtr, column);
  }

  /**
      Sets the model for a [gtk.icon_view.IconView].
    If the icon_view already has a model set, it will remove
    it before setting the new model.  If model is null, then
    it will unset the old model.
    Params:
      model =       The model.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_icon_view_set_model(cast(GtkIconView*)cPtr, model ? cast(GtkTreeModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }

  /**
      Sets the column with pixbufs for icon_view to be column. The pixbuf
    column must be of type `GDK_TYPE_PIXBUF`
    Params:
      column =       A column in the currently used model, or -1 to disable
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setPixbufColumn(int column)
  {
    gtk_icon_view_set_pixbuf_column(cast(GtkIconView*)cPtr, column);
  }

  /**
      This function is a convenience function to allow you to reorder models that
    support the [gtk.tree_drag_source_iface.TreeDragSourceIface] and the [gtk.tree_drag_dest_iface.TreeDragDestIface]. Both
    [gtk.tree_store.TreeStore] and [gtk.list_store.ListStore] support these. If reorderable is true, then
    the user can reorder the model by dragging and dropping rows.  The
    developer can listen to these changes by connecting to the model's
    row_inserted and row_deleted signals. The reordering is implemented by setting up
    the icon view as a drag source and destination. Therefore, drag and
    drop can not be used in a reorderable view for any other purpose.
    
    This function does not give you any degree of control over the order -- any
    reordering is allowed.  If more control is needed, you should probably
    handle drag and drop manually.
    Params:
      reorderable =       true, if the list of items can be reordered.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setReorderable(bool reorderable)
  {
    gtk_icon_view_set_reorderable(cast(GtkIconView*)cPtr, reorderable);
  }

  /**
      Sets the ::row-spacing property which specifies the space
    which is inserted between the rows of the icon view.
    Params:
      rowSpacing =       the row spacing
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setRowSpacing(int rowSpacing)
  {
    gtk_icon_view_set_row_spacing(cast(GtkIconView*)cPtr, rowSpacing);
  }

  /**
      Sets the selection mode of the icon_view.
    Params:
      mode =       The selection mode
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setSelectionMode(gtk.types.SelectionMode mode)
  {
    gtk_icon_view_set_selection_mode(cast(GtkIconView*)cPtr, mode);
  }

  /**
      Sets the ::spacing property which specifies the space
    which is inserted between the cells (i.e. the icon and
    the text) of an item.
    Params:
      spacing =       the spacing
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setSpacing(int spacing)
  {
    gtk_icon_view_set_spacing(cast(GtkIconView*)cPtr, spacing);
  }

  /**
      Sets the column with text for icon_view to be column. The text
    column must be of type `G_TYPE_STRING`.
    Params:
      column =       A column in the currently used model, or -1 to display no text
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setTextColumn(int column)
  {
    gtk_icon_view_set_text_column(cast(GtkIconView*)cPtr, column);
  }

  /**
      Sets the tip area of tooltip to the area which cell occupies in
    the item pointed to by path. See also [gtk.tooltip.Tooltip.setTipArea].
    
    See also [gtk.icon_view.IconView.setTooltipColumn] for a simpler alternative.
    Params:
      tooltip =       a [gtk.tooltip.Tooltip]
      path =       a [gtk.tree_path.TreePath]
      cell =       a [gtk.cell_renderer.CellRenderer]
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setTooltipCell(gtk.tooltip.Tooltip tooltip, gtk.tree_path.TreePath path, gtk.cell_renderer.CellRenderer cell = null)
  {
    gtk_icon_view_set_tooltip_cell(cast(GtkIconView*)cPtr, tooltip ? cast(GtkTooltip*)tooltip.cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell.cPtr(No.Dup) : null);
  }

  /**
      If you only plan to have simple (text-only) tooltips on full items, you
    can use this function to have [gtk.icon_view.IconView] handle these automatically
    for you. column should be set to the column in icon_view’s model
    containing the tooltip texts, or -1 to disable this feature.
    
    When enabled, `GtkWidget:has-tooltip` will be set to true and
    icon_view will connect a `GtkWidget::query-tooltip` signal handler.
    
    Note that the signal handler sets the text with [gtk.tooltip.Tooltip.setMarkup],
    so &, <, etc have to be escaped in the text.
    Params:
      column =       an integer, which is a valid column number for icon_view’s model
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setTooltipColumn(int column)
  {
    gtk_icon_view_set_tooltip_column(cast(GtkIconView*)cPtr, column);
  }

  /**
      Sets the tip area of tooltip to be the area covered by the item at path.
    See also [gtk.icon_view.IconView.setTooltipColumn] for a simpler alternative.
    See also [gtk.tooltip.Tooltip.setTipArea].
    Params:
      tooltip =       a [gtk.tooltip.Tooltip]
      path =       a [gtk.tree_path.TreePath]
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void setTooltipItem(gtk.tooltip.Tooltip tooltip, gtk.tree_path.TreePath path)
  {
    gtk_icon_view_set_tooltip_item(cast(GtkIconView*)cPtr, tooltip ? cast(GtkTooltip*)tooltip.cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
  }

  /**
      Unselects all the icons.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void unselectAll()
  {
    gtk_icon_view_unselect_all(cast(GtkIconView*)cPtr);
  }

  /**
      Unselects the row at path.
    Params:
      path =       The [gtk.tree_path.TreePath] to be unselected.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void unselectPath(gtk.tree_path.TreePath path)
  {
    gtk_icon_view_unselect_path(cast(GtkIconView*)cPtr, path ? cast(GtkTreePath*)path.cPtr(No.Dup) : null);
  }

  /**
      Undoes the effect of [gtk.icon_view.IconView.enableModelDragDest]. Calling this
    method sets [gtk.icon_view.IconView]:reorderable to false.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void unsetModelDragDest()
  {
    gtk_icon_view_unset_model_drag_dest(cast(GtkIconView*)cPtr);
  }

  /**
      Undoes the effect of [gtk.icon_view.IconView.enableModelDragSource]. Calling this
    method sets [gtk.icon_view.IconView]:reorderable to false.
  
    Deprecated:     Use [gtk.grid_view.GridView] instead
  */
  void unsetModelDragSource()
  {
    gtk_icon_view_unset_model_drag_source(cast(GtkIconView*)cPtr);
  }

  /**
      A [keybinding signal][gtk.signal_action.SignalAction]
    which gets emitted when the user activates the currently
    focused item.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control activation
    programmatically.
    
    The default bindings for this signal are Space, Return and Enter.
  
    ## Parameters
    $(LIST
      * $(B iconView) the instance the signal is connected to
    )
    Returns: 
  */
  alias ActivateCursorItemCallbackDlg = bool delegate(gtk.icon_view.IconView iconView);

  /** ditto */
  alias ActivateCursorItemCallbackFunc = bool function(gtk.icon_view.IconView iconView);

  /**
    Connect to ActivateCursorItem signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivateCursorItem(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCursorItemCallbackDlg) || is(T : ActivateCursorItemCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      _retval = _dClosure.dlg(iconView);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-item", closure, after);
  }

  /**
      The ::item-activated signal is emitted when the method
    [gtk.icon_view.IconView.itemActivated] is called, when the user double
    clicks an item with the "activate-on-single-click" property set
    to false, or when the user single clicks an item when the
    "activate-on-single-click" property set to true. It is also
    emitted when a non-editable item is selected and one of the keys:
    Space, Return or Enter is pressed.
  
    ## Parameters
    $(LIST
      * $(B path)       the [gtk.tree_path.TreePath] for the activated item
      * $(B iconView) the instance the signal is connected to
    )
  */
  alias ItemActivatedCallbackDlg = void delegate(gtk.tree_path.TreePath path, gtk.icon_view.IconView iconView);

  /** ditto */
  alias ItemActivatedCallbackFunc = void function(gtk.tree_path.TreePath path, gtk.icon_view.IconView iconView);

  /**
    Connect to ItemActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectItemActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ItemActivatedCallbackDlg) || is(T : ItemActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      auto path = getVal!(gtk.tree_path.TreePath)(&_paramVals[1]);
      _dClosure.dlg(path, iconView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("item-activated", closure, after);
  }

  /**
      The ::move-cursor signal is a
    [keybinding signal][gtk.signal_action.SignalAction]
    which gets emitted when the user initiates a cursor movement.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control the cursor
    programmatically.
    
    The default bindings for this signal include
    $(LIST
      * Arrow keys which move by individual steps
      * Home/End keys which move to the first/last item
      * PageUp/PageDown which move by "pages"
    )
    All of these will extend the selection when combined with
    the Shift modifier.
  
    ## Parameters
    $(LIST
      * $(B step)       the granularity of the move, as a [gtk.types.MovementStep]
      * $(B count)       the number of step units to move
      * $(B extend)       whether to extend the selection
      * $(B modify)       whether to modify the selection
      * $(B iconView) the instance the signal is connected to
    )
    Returns: 
  */
  alias MoveCursorCallbackDlg = bool delegate(gtk.types.MovementStep step, int count, bool extend, bool modify, gtk.icon_view.IconView iconView);

  /** ditto */
  alias MoveCursorCallbackFunc = bool function(gtk.types.MovementStep step, int count, bool extend, bool modify, gtk.icon_view.IconView iconView);

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
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      auto step = getVal!(gtk.types.MovementStep)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      auto extend = getVal!(bool)(&_paramVals[3]);
      auto modify = getVal!(bool)(&_paramVals[4]);
      _retval = _dClosure.dlg(step, count, extend, modify, iconView);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      A [keybinding signal][gtk.signal_action.SignalAction]
    which gets emitted when the user selects all items.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control selection
    programmatically.
    
    The default binding for this signal is Ctrl-a.
  
    ## Parameters
    $(LIST
      * $(B iconView) the instance the signal is connected to
    )
  */
  alias SelectAllCallbackDlg = void delegate(gtk.icon_view.IconView iconView);

  /** ditto */
  alias SelectAllCallbackFunc = void function(gtk.icon_view.IconView iconView);

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
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      _dClosure.dlg(iconView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      A [keybinding signal][gtk.signal_action.SignalAction]
    which gets emitted when the user selects the item that is currently
    focused.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control selection
    programmatically.
    
    There is no default binding for this signal.
  
    ## Parameters
    $(LIST
      * $(B iconView) the instance the signal is connected to
    )
  */
  alias SelectCursorItemCallbackDlg = void delegate(gtk.icon_view.IconView iconView);

  /** ditto */
  alias SelectCursorItemCallbackFunc = void function(gtk.icon_view.IconView iconView);

  /**
    Connect to SelectCursorItem signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectCursorItem(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectCursorItemCallbackDlg) || is(T : SelectCursorItemCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      _dClosure.dlg(iconView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-cursor-item", closure, after);
  }

  /**
      The ::selection-changed signal is emitted when the selection
    (i.e. the set of selected items) changes.
  
    ## Parameters
    $(LIST
      * $(B iconView) the instance the signal is connected to
    )
  */
  alias SelectionChangedCallbackDlg = void delegate(gtk.icon_view.IconView iconView);

  /** ditto */
  alias SelectionChangedCallbackFunc = void function(gtk.icon_view.IconView iconView);

  /**
    Connect to SelectionChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectionChangedCallbackDlg) || is(T : SelectionChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      _dClosure.dlg(iconView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
      A [keybinding signal][gtk.signal_action.SignalAction]
    which gets emitted when the user toggles whether the currently
    focused item is selected or not. The exact effect of this
    depend on the selection mode.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control selection
    programmatically.
    
    There is no default binding for this signal is Ctrl-Space.
  
    ## Parameters
    $(LIST
      * $(B iconView) the instance the signal is connected to
    )
  */
  alias ToggleCursorItemCallbackDlg = void delegate(gtk.icon_view.IconView iconView);

  /** ditto */
  alias ToggleCursorItemCallbackFunc = void function(gtk.icon_view.IconView iconView);

  /**
    Connect to ToggleCursorItem signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToggleCursorItem(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggleCursorItemCallbackDlg) || is(T : ToggleCursorItemCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      _dClosure.dlg(iconView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-item", closure, after);
  }

  /**
      A [keybinding signal][gtk.signal_action.SignalAction]
    which gets emitted when the user unselects all items.
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to control selection
    programmatically.
    
    The default binding for this signal is Ctrl-Shift-a.
  
    ## Parameters
    $(LIST
      * $(B iconView) the instance the signal is connected to
    )
  */
  alias UnselectAllCallbackDlg = void delegate(gtk.icon_view.IconView iconView);

  /** ditto */
  alias UnselectAllCallbackFunc = void function(gtk.icon_view.IconView iconView);

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
      auto iconView = getVal!(gtk.icon_view.IconView)(_paramVals);
      _dClosure.dlg(iconView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}
