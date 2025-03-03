module gtk.list_view;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.list_base;
import gtk.list_item_factory;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.scroll_info;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.selection_model;
import gtk.types;

/**
 * `GtkListView` presents a large dynamic list of items.
 * `GtkListView` uses its factory to generate one row widget for each visible
 * item and shows them in a linear display, either vertically or horizontally.
 * The property@Gtk.ListView:show-separators property offers a simple way to
 * display separators between the rows.
 * `GtkListView` allows the user to select items according to the selection
 * characteristics of the model. For models that allow multiple selected items,
 * it is possible to turn on _rubberband selection_, using
 * property@Gtk.ListView:enable-rubberband.
 * If you need multiple columns with headers, see [gtk.column_view.ColumnView].
 * To learn more about the list widget framework, see the
 * [overview](section-list-widget.html).
 * An example of using `GtkListView`:
 * ```c
 * static void
 * setup_listitem_cb $(LPAREN)GtkListItemFactory *factory,
 * GtkListItem        *list_item$(RPAREN)
 * {
 * GtkWidget *image;
 * image \= gtk_image_new $(LPAREN)$(RPAREN);
 * gtk_image_set_icon_size $(LPAREN)GTK_IMAGE $(LPAREN)image$(RPAREN), GTK_ICON_SIZE_LARGE$(RPAREN);
 * gtk_list_item_set_child $(LPAREN)list_item, image$(RPAREN);
 * }
 * static void
 * bind_listitem_cb $(LPAREN)GtkListItemFactory *factory,
 * GtkListItem        *list_item$(RPAREN)
 * {
 * GtkWidget *image;
 * GAppInfo *app_info;
 * image \= gtk_list_item_get_child $(LPAREN)list_item$(RPAREN);
 * app_info \= gtk_list_item_get_item $(LPAREN)list_item$(RPAREN);
 * gtk_image_set_from_gicon $(LPAREN)GTK_IMAGE $(LPAREN)image$(RPAREN), g_app_info_get_icon $(LPAREN)app_info$(RPAREN)$(RPAREN);
 * }
 * static void
 * activate_cb $(LPAREN)GtkListView  *list,
 * guint         position,
 * gpointer      unused$(RPAREN)
 * {
 * GAppInfo *app_info;
 * app_info \= g_list_model_get_item $(LPAREN)G_LIST_MODEL $(LPAREN)gtk_list_view_get_model $(LPAREN)list$(RPAREN)$(RPAREN), position$(RPAREN);
 * g_app_info_launch $(LPAREN)app_info, NULL, NULL, NULL$(RPAREN);
 * g_object_unref $(LPAREN)app_info$(RPAREN);
 * }
 * ...
 * model \= create_application_list $(LPAREN)$(RPAREN);
 * factory \= gtk_signal_list_item_factory_new $(LPAREN)$(RPAREN);
 * g_signal_connect $(LPAREN)factory, "setup", G_CALLBACK $(LPAREN)setup_listitem_cb$(RPAREN), NULL$(RPAREN);
 * g_signal_connect $(LPAREN)factory, "bind", G_CALLBACK $(LPAREN)bind_listitem_cb$(RPAREN), NULL$(RPAREN);
 * list \= gtk_list_view_new $(LPAREN)GTK_SELECTION_MODEL $(LPAREN)gtk_single_selection_new $(LPAREN)model$(RPAREN)$(RPAREN), factory$(RPAREN);
 * g_signal_connect $(LPAREN)list, "activate", G_CALLBACK $(LPAREN)activate_cb$(RPAREN), NULL$(RPAREN);
 * gtk_scrolled_window_set_child $(LPAREN)GTK_SCROLLED_WINDOW $(LPAREN)sw$(RPAREN), list$(RPAREN);
 * ```
 * # CSS nodes
 * ```
 * listview[.separators][.rich-list][.navigation-sidebar][.data-table]
 * ├── row[.activatable]
 * │
 * ├── row[.activatable]
 * │
 * ┊
 * ╰── [rubberband]
 * ```
 * `GtkListView` uses a single CSS node named `listview`. It may carry the
 * `.separators` style class, when property@Gtk.ListView:show-separators
 * property is set. Each child widget uses a single CSS node named `row`.
 * If the [gtk.list_item.ListItem.gboolean] property is set, the
 * corresponding row will have the `.activatable` style class. For
 * rubberband selection, a node with name `rubberband` is used.
 * The main listview node may also carry style classes to select
 * the style of [list presentation](ListContainers.html#list-styles):
 * .rich-list, .navigation-sidebar or .data-table.
 * # Accessibility
 * `GtkListView` uses the %GTK_ACCESSIBLE_ROLE_LIST role, and the list
 * items use the %GTK_ACCESSIBLE_ROLE_LIST_ITEM role.
 */
class ListView : gtk.list_base.ListBase
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_list_view_get_type != &gidSymbolNotFound ? gtk_list_view_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkListView` that uses the given factory for
   * mapping items to widgets.
   * The function takes ownership of the
   * arguments, so you can write code like
   * ```c
   * list_view \= gtk_list_view_new $(LPAREN)create_model $(LPAREN)$(RPAREN),
   * gtk_builder_list_item_factory_new_from_resource $(LPAREN)"/resource.ui"$(RPAREN)$(RPAREN);
   * ```
   * Params:
   *   model = the model to use
   *   factory = The factory to populate items with
   * Returns: a new `GtkListView` using the given model and factory
   */
  this(gtk.selection_model.SelectionModel model = null, gtk.list_item_factory.ListItemFactory factory = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_view_new(model ? cast(GtkSelectionModel*)(cast(ObjectG)model).cPtr(Yes.Dup) : null, factory ? cast(GtkListItemFactory*)factory.cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Returns whether rows can be selected by dragging with the mouse.
   * Returns: %TRUE if rubberband selection is enabled
   */
  bool getEnableRubberband()
  {
    bool _retval;
    _retval = gtk_list_view_get_enable_rubberband(cast(GtkListView*)cPtr);
    return _retval;
  }

  /**
   * Gets the factory that's currently used to populate list items.
   * Returns: The factory in use
   */
  gtk.list_item_factory.ListItemFactory getFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_list_view_get_factory(cast(GtkListView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the factory that's currently used to populate section headers.
   * Returns: The factory in use
   */
  gtk.list_item_factory.ListItemFactory getHeaderFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_list_view_get_header_factory(cast(GtkListView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the model that's currently used to read the items displayed.
   * Returns: The model in use
   */
  gtk.selection_model.SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_list_view_get_model(cast(GtkListView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
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
    _retval = gtk_list_view_get_show_separators(cast(GtkListView*)cPtr);
    return _retval;
  }

  /**
   * Returns whether rows will be activated on single click and
   * selected on hover.
   * Returns: %TRUE if rows are activated on single click
   */
  bool getSingleClickActivate()
  {
    bool _retval;
    _retval = gtk_list_view_get_single_click_activate(cast(GtkListView*)cPtr);
    return _retval;
  }

  /**
   * Gets the behavior set for the <kbd>Tab</kbd> key.
   * Returns: The behavior of the <kbd>Tab</kbd> key
   */
  gtk.types.ListTabBehavior getTabBehavior()
  {
    GtkListTabBehavior _cretval;
    _cretval = gtk_list_view_get_tab_behavior(cast(GtkListView*)cPtr);
    gtk.types.ListTabBehavior _retval = cast(gtk.types.ListTabBehavior)_cretval;
    return _retval;
  }

  /**
   * Scrolls to the item at the given position and performs the actions
   * specified in flags.
   * This function works no matter if the listview is shown or focused.
   * If it isn't, then the changes will take effect once that happens.
   * Params:
   *   pos = position of the item
   *   flags = actions to perform
   *   scroll = details of how to perform
   *     the scroll operation or %NULL to scroll into view
   */
  void scrollTo(uint pos, gtk.types.ListScrollFlags flags, gtk.scroll_info.ScrollInfo scroll = null)
  {
    gtk_list_view_scroll_to(cast(GtkListView*)cPtr, pos, flags, scroll ? cast(GtkScrollInfo*)scroll.cPtr(Yes.Dup) : null);
  }

  /**
   * Sets whether selections can be changed by dragging with the mouse.
   * Params:
   *   enableRubberband = %TRUE to enable rubberband selection
   */
  void setEnableRubberband(bool enableRubberband)
  {
    gtk_list_view_set_enable_rubberband(cast(GtkListView*)cPtr, enableRubberband);
  }

  /**
   * Sets the `GtkListItemFactory` to use for populating list items.
   * Params:
   *   factory = the factory to use
   */
  void setFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_list_view_set_factory(cast(GtkListView*)cPtr, factory ? cast(GtkListItemFactory*)factory.cPtr(No.Dup) : null);
  }

  /**
   * Sets the `GtkListItemFactory` to use for populating the
   * [gtk.list_header.ListHeader] objects used in section headers.
   * If this factory is set to %NULL, the list will not show section headers.
   * Params:
   *   factory = the factory to use
   */
  void setHeaderFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_list_view_set_header_factory(cast(GtkListView*)cPtr, factory ? cast(GtkListItemFactory*)factory.cPtr(No.Dup) : null);
  }

  /**
   * Sets the model to use.
   * This must be a [gtk.selection_model.SelectionModel] to use.
   * Params:
   *   model = the model to use
   */
  void setModel(gtk.selection_model.SelectionModel model = null)
  {
    gtk_list_view_set_model(cast(GtkListView*)cPtr, model ? cast(GtkSelectionModel*)(cast(ObjectG)model).cPtr(No.Dup) : null);
  }

  /**
   * Sets whether the list box should show separators
   * between rows.
   * Params:
   *   showSeparators = %TRUE to show separators
   */
  void setShowSeparators(bool showSeparators)
  {
    gtk_list_view_set_show_separators(cast(GtkListView*)cPtr, showSeparators);
  }

  /**
   * Sets whether rows should be activated on single click and
   * selected on hover.
   * Params:
   *   singleClickActivate = %TRUE to activate items on single click
   */
  void setSingleClickActivate(bool singleClickActivate)
  {
    gtk_list_view_set_single_click_activate(cast(GtkListView*)cPtr, singleClickActivate);
  }

  /**
   * Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
   * Params:
   *   tabBehavior = The desired tab behavior
   */
  void setTabBehavior(gtk.types.ListTabBehavior tabBehavior)
  {
    gtk_list_view_set_tab_behavior(cast(GtkListView*)cPtr, tabBehavior);
  }

  /**
   * Emitted when a row has been activated by the user,
   * usually via activating the GtkListView|list.activate-item action.
   * This allows for a convenient way to handle activation in a listview.
   * See [gtk.list_item.ListItem.setActivatable] for details on how to use
   * this signal.
   * Params
   *   position = position of item to activate
   *   listView = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(uint position, gtk.list_view.ListView listView);
  alias ActivateCallbackFunc = void function(uint position, gtk.list_view.ListView listView);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto listView = getVal!(gtk.list_view.ListView)(_paramVals);
      auto position = getVal!(uint)(&_paramVals[1]);
      _dClosure.dlg(position, listView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
