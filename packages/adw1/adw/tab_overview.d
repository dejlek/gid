module adw.tab_overview;

import adw.c.functions;
import adw.c.types;
import adw.tab_page;
import adw.tab_view;
import adw.types;
import gdk.types;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A tab overview for `class@TabView`.
  
  <picture>
    <source srcset="tab-overview-dark.png" media="(prefers-color-scheme: dark)">
    <img src="tab-overview.png" alt="tab-overview">
  </picture>
  
  [adw.tab_overview.TabOverview] is a widget that can display tabs from an [adw.tab_view.TabView] in a
  grid.
  
  [adw.tab_overview.TabOverview] shows a thumbnail for each tab. By default thumbnails are
  static for all pages except the selected one. They can be made always live
  by setting `property@TabPage:live-thumbnail` to `TRUE`, or refreshed with
  [adw.tab_page.TabPage.invalidateThumbnail] or
  [adw.tab_view.TabView.invalidateThumbnails] otherwise.
  
  If the pages are too tall or too wide, the thumbnails will be cropped; use
  `property@TabPage:thumbnail-xalign` and `property@TabPage:thumbnail-yalign` to
  control which part of the page should be visible in this case.
  
  Pinned tabs are shown as smaller cards without thumbnails above the other
  tabs. Unlike in `class@TabBar`, they still have titles, as well as an unpin
  button.
  
  [adw.tab_overview.TabOverview] provides search in open tabs. It searches in tab titles and
  tooltips, as well as `property@TabPage:keyword`.
  
  If `property@TabOverview:enable-new-tab` is set to `TRUE`, a new tab button
  will be shown. Connect to the `signal@TabOverview::create-tab` signal to use
  it.
  
  `property@TabOverview:secondary-menu` can be used to provide a secondary menu
  for the overview. Use it to add extra actions, e.g. to open a new window or
  undo closed tab.
  
  [adw.tab_overview.TabOverview] is intended to be used as the direct child of the window,
  with the rest of the window contents set as the `property@TabOverview:child`.
  The child is expected to contain an `class@TabView`.
  
  [adw.tab_overview.TabOverview] shows window buttons by default. They can be disabled by
  setting `property@TabOverview:show-start-title-buttons` and/or
  `property@TabOverview:show-start-title-buttons` and/or
  `property@TabOverview:show-end-title-buttons` to `FALSE`.
  
  If search and window buttons are disabled, and secondary menu is not set, the
  header bar will be hidden.
  
  ## Actions
  
  [adw.tab_overview.TabOverview] defines the `overview.open` and `overview.close` actions for
  opening and closing itself. They can be convenient when used together with
  `class@TabButton`.
  
  ## CSS nodes
  
  [adw.tab_overview.TabOverview] has a single CSS node with name `taboverview`.
*/
class TabOverview : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_tab_overview_get_type != &gidSymbolNotFound ? adw_tab_overview_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.tab_overview.TabOverview].
    Returns:     the newly created [adw.tab_overview.TabOverview]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_overview_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
    Returns:     the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_overview_get_child(cast(AdwTabOverview*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to new tab button is enabled for self.
    Returns:     whether new tab button is enabled
  */
  bool getEnableNewTab()
  {
    bool _retval;
    _retval = adw_tab_overview_get_enable_new_tab(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets whether search in tabs is enabled for self.
    Returns:     whether search is enabled
  */
  bool getEnableSearch()
  {
    bool _retval;
    _retval = adw_tab_overview_get_enable_search(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets the current action during a drop on the extra_drop_target.
    Returns:     the drag action of the current drop.
  */
  gdk.types.DragAction getExtraDragPreferredAction()
  {
    GdkDragAction _cretval;
    _cretval = adw_tab_overview_get_extra_drag_preferred_action(cast(AdwTabOverview*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets whether drop data should be preloaded on hover.
    Returns:     whether drop data should be preloaded on hover
  */
  bool getExtraDragPreload()
  {
    bool _retval;
    _retval = adw_tab_overview_get_extra_drag_preload(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets whether thumbnails use inverted layout.
    Returns:     whether thumbnails use inverted layout
  */
  bool getInverted()
  {
    bool _retval;
    _retval = adw_tab_overview_get_inverted(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is open.
    Returns:     whether the overview is open
  */
  bool getOpen()
  {
    bool _retval;
    _retval = adw_tab_overview_get_open(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets whether search is currently active for self.
    
    See `propertyTabOverview:enable-search`.
    Returns:     whether search is active
  */
  bool getSearchActive()
  {
    bool _retval;
    _retval = adw_tab_overview_get_search_active(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets the secondary menu model for self.
    Returns:     the secondary menu model
  */
  gio.menu_model.MenuModel getSecondaryMenu()
  {
    GMenuModel* _cretval;
    _cretval = adw_tab_overview_get_secondary_menu(cast(AdwTabOverview*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether end title buttons are shown in self's header bar.
    Returns:     whether end title buttons are shown
  */
  bool getShowEndTitleButtons()
  {
    bool _retval;
    _retval = adw_tab_overview_get_show_end_title_buttons(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets whether start title buttons are shown in self's header bar.
    Returns:     whether start title buttons are shown
  */
  bool getShowStartTitleButtons()
  {
    bool _retval;
    _retval = adw_tab_overview_get_show_start_title_buttons(cast(AdwTabOverview*)cPtr);
    return _retval;
  }

  /**
      Gets the tab view self controls.
    Returns:     the tab view
  */
  adw.tab_view.TabView getView()
  {
    AdwTabView* _cretval;
    _cretval = adw_tab_overview_get_view(cast(AdwTabOverview*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.tab_view.TabView)(cast(AdwTabView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_tab_overview_set_child(cast(AdwTabOverview*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets whether to enable new tab button for self.
    
    Connect to the `signalTabOverview::create-tab` signal to use it.
    Params:
      enableNewTab =       whether to enable new tab button
  */
  void setEnableNewTab(bool enableNewTab)
  {
    adw_tab_overview_set_enable_new_tab(cast(AdwTabOverview*)cPtr, enableNewTab);
  }

  /**
      Sets whether to enable search in tabs for self.
    
    Search matches tab titles and tooltips, as well as keywords, set via
    `propertyTabPage:keyword`. Use keywords to search in e.g. page URLs in a web
    browser.
    
    During search, tab reordering and drag-n-drop are disabled.
    
    Use `propertyTabOverview:search-active` to check out if search is currently
    active.
    Params:
      enableSearch =       whether to enable search
  */
  void setEnableSearch(bool enableSearch)
  {
    adw_tab_overview_set_enable_search(cast(AdwTabOverview*)cPtr, enableSearch);
  }

  /**
      Sets whether drop data should be preloaded on hover.
    
    See [gtk.drop_target.DropTarget.gboolean].
    Params:
      preload =       whether to preload drop data
  */
  void setExtraDragPreload(bool preload)
  {
    adw_tab_overview_set_extra_drag_preload(cast(AdwTabOverview*)cPtr, preload);
  }

  /**
      Sets whether thumbnails use inverted layout.
    
    If set to `TRUE`, thumbnails will have the close or unpin button at the
    beginning and the indicator at the end rather than the other way around.
    Params:
      inverted =       whether thumbnails use inverted layout
  */
  void setInverted(bool inverted)
  {
    adw_tab_overview_set_inverted(cast(AdwTabOverview*)cPtr, inverted);
  }

  /**
      Sets whether the to open self.
    Params:
      open =       whether the overview is open
  */
  void setOpen(bool open)
  {
    adw_tab_overview_set_open(cast(AdwTabOverview*)cPtr, open);
  }

  /**
      Sets the secondary menu model for self.
    
    Use it to add extra actions, e.g. to open a new window or undo closed tab.
    Params:
      secondaryMenu =       a menu model
  */
  void setSecondaryMenu(gio.menu_model.MenuModel secondaryMenu = null)
  {
    adw_tab_overview_set_secondary_menu(cast(AdwTabOverview*)cPtr, secondaryMenu ? cast(GMenuModel*)secondaryMenu.cPtr(No.Dup) : null);
  }

  /**
      Sets whether to show end title buttons in self's header bar.
    
    See `propertyHeaderBar:show-start-title-buttons` for the other side.
    Params:
      showEndTitleButtons =       whether to show end title buttons
  */
  void setShowEndTitleButtons(bool showEndTitleButtons)
  {
    adw_tab_overview_set_show_end_title_buttons(cast(AdwTabOverview*)cPtr, showEndTitleButtons);
  }

  /**
      Sets whether to show start title buttons in self's header bar.
    
    See `propertyHeaderBar:show-end-title-buttons` for the other side.
    Params:
      showStartTitleButtons =       whether to show start title buttons
  */
  void setShowStartTitleButtons(bool showStartTitleButtons)
  {
    adw_tab_overview_set_show_start_title_buttons(cast(AdwTabOverview*)cPtr, showStartTitleButtons);
  }

  /**
      Sets the tab view to control.
    
    The view must be inside self, see `propertyTabOverview:child`.
    Params:
      view =       a tab view
  */
  void setView(adw.tab_view.TabView view = null)
  {
    adw_tab_overview_set_view(cast(AdwTabOverview*)cPtr, view ? cast(AdwTabView*)view.cPtr(No.Dup) : null);
  }

  /**
      Sets the supported types for this drop target.
    
    Sets up an extra drop target on tabs.
    
    This allows to drag arbitrary content onto tabs, for example URLs in a web
    browser.
    
    If a tab is hovered for a certain period of time while dragging the content,
    it will be automatically selected.
    
    The `signalTabOverview::extra-drag-drop` signal can be used to handle the
    drop.
    Params:
      actions =       the supported actions
      types =       all supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s that can be dropped
  */
  void setupExtraDropTarget(gdk.types.DragAction actions, gobject.types.GType[] types = null)
  {
    size_t _nTypes;
    if (types)
      _nTypes = cast(size_t)types.length;

    auto _types = cast(GType*)types.ptr;
    adw_tab_overview_setup_extra_drop_target(cast(AdwTabOverview*)cPtr, actions, _types, _nTypes);
  }

  /**
      Emitted when a tab needs to be created.
    
    This can happen after the new tab button has been pressed, see
    `propertyTabOverview:enable-new-tab`.
    
    The signal handler is expected to create a new page in the corresponding
    `classTabView` and return it.
  
    ## Parameters
    $(LIST
      * $(B tabOverview) the instance the signal is connected to
    )
    Returns:     the newly created page
  */
  alias CreateTabCallbackDlg = adw.tab_page.TabPage delegate(adw.tab_overview.TabOverview tabOverview);

  /** ditto */
  alias CreateTabCallbackFunc = adw.tab_page.TabPage function(adw.tab_overview.TabOverview tabOverview);

  /**
    Connect to CreateTab signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCreateTab(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CreateTabCallbackDlg) || is(T : CreateTabCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabOverview = getVal!(adw.tab_overview.TabOverview)(_paramVals);
      auto _retval = _dClosure.dlg(tabOverview);
      setVal!adw.tab_page.TabPage(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-tab", closure, after);
  }

  /**
      This signal is emitted when content is dropped onto a tab.
    
    The content must be of one of the types set up via
    [adw.tab_overview.TabOverview.setupExtraDropTarget].
    
    See [gtk.drop_target.DropTarget.drop].
  
    ## Parameters
    $(LIST
      * $(B page)       the page matching the tab the content was dropped onto
      * $(B value)       the [gobject.value.Value] being dropped
      * $(B tabOverview) the instance the signal is connected to
    )
    Returns:     whether the drop was accepted for page
  */
  alias ExtraDragDropCallbackDlg = bool delegate(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview);

  /** ditto */
  alias ExtraDragDropCallbackFunc = bool function(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview);

  /**
    Connect to ExtraDragDrop signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectExtraDragDrop(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ExtraDragDropCallbackDlg) || is(T : ExtraDragDropCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto tabOverview = getVal!(adw.tab_overview.TabOverview)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto value = getVal!(gobject.value.Value)(&_paramVals[2]);
      _retval = _dClosure.dlg(page, value, tabOverview);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-drop", closure, after);
  }

  /**
      This signal is emitted when the dropped content is preloaded.
    
    In order for data to be preloaded, `propertyTabOverview:extra-drag-preload`
    must be set to `TRUE`.
    
    The content must be of one of the types set up via
    [adw.tab_overview.TabOverview.setupExtraDropTarget].
    
    See [gtk.drop_target.DropTarget.GObject.Value].
  
    ## Parameters
    $(LIST
      * $(B page)       the page matching the tab the content was dropped onto
      * $(B value)       the [gobject.value.Value] being dropped
      * $(B tabOverview) the instance the signal is connected to
    )
    Returns:     the preferred action for the drop on page
  */
  alias ExtraDragValueCallbackDlg = gdk.types.DragAction delegate(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview);

  /** ditto */
  alias ExtraDragValueCallbackFunc = gdk.types.DragAction function(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview);

  /**
    Connect to ExtraDragValue signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectExtraDragValue(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ExtraDragValueCallbackDlg) || is(T : ExtraDragValueCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabOverview = getVal!(adw.tab_overview.TabOverview)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto value = getVal!(gobject.value.Value)(&_paramVals[2]);
      auto _dretval = _dClosure.dlg(page, value, tabOverview);
      GdkDragAction _retval = cast(GdkDragAction)_dretval;
      setVal!gdk.types.DragAction(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-value", closure, after);
  }
}
