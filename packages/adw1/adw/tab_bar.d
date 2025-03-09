module adw.tab_bar;

import adw.c.functions;
import adw.c.types;
import adw.tab_page;
import adw.tab_view;
import adw.types;
import gdk.types;
import gid.gid;
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
    A tab bar for `class@TabView`.
  
  <picture>
    <source srcset="tab-bar-dark.png" media="(prefers-color-scheme: dark)">
    <img src="tab-bar.png" alt="tab-bar">
  </picture>
  
  The [adw.tab_bar.TabBar] widget is a tab bar that can be used with conjunction with
  [adw.tab_view.TabView]. It is typically used as a top bar within `class@ToolbarView`.
  
  [adw.tab_bar.TabBar] can autohide and can optionally contain action widgets on both
  sides of the tabs.
  
  When there's not enough space to show all the tabs, [adw.tab_bar.TabBar] will scroll
  them. Pinned tabs always stay visible and aren't a part of the scrollable
  area.
  
  ## CSS nodes
  
  [adw.tab_bar.TabBar] has a single CSS node with name `tabbar`.
*/
class TabBar : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_tab_bar_get_type != &gidSymbolNotFound ? adw_tab_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.tab_bar.TabBar].
    Returns:     the newly created [adw.tab_bar.TabBar]
  */
  this()
  {
    AdwTabBar* _cretval;
    _cretval = adw_tab_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether the tabs automatically hide.
    Returns:     whether the tabs automatically hide
  */
  bool getAutohide()
  {
    bool _retval;
    _retval = adw_tab_bar_get_autohide(cast(AdwTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets the widget shown after the tabs.
    Returns:     the widget shown after the tabs
  */
  gtk.widget.Widget getEndActionWidget()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_bar_get_end_action_widget(cast(AdwTabBar*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether tabs expand to full width.
    Returns:     whether tabs expand to full width.
  */
  bool getExpandTabs()
  {
    bool _retval;
    _retval = adw_tab_bar_get_expand_tabs(cast(AdwTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets the current action during a drop on the extra_drop_target.
    Returns:     the drag action of the current drop.
  */
  gdk.types.DragAction getExtraDragPreferredAction()
  {
    GdkDragAction _cretval;
    _cretval = adw_tab_bar_get_extra_drag_preferred_action(cast(AdwTabBar*)cPtr);
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
    _retval = adw_tab_bar_get_extra_drag_preload(cast(AdwTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets whether tabs use inverted layout.
    Returns:     whether tabs use inverted layout
  */
  bool getInverted()
  {
    bool _retval;
    _retval = adw_tab_bar_get_inverted(cast(AdwTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is overflowing.
    
    If `TRUE`, all tabs cannot be displayed at once and require scrolling.
    Returns:     whether self is overflowing
  */
  bool getIsOverflowing()
  {
    bool _retval;
    _retval = adw_tab_bar_get_is_overflowing(cast(AdwTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets the widget shown before the tabs.
    Returns:     the widget shown before the tabs
  */
  gtk.widget.Widget getStartActionWidget()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_bar_get_start_action_widget(cast(AdwTabBar*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the tabs are currently revealed.
    
    See `propertyTabBar:autohide`.
    Returns:     whether the tabs are currently revealed
  */
  bool getTabsRevealed()
  {
    bool _retval;
    _retval = adw_tab_bar_get_tabs_revealed(cast(AdwTabBar*)cPtr);
    return _retval;
  }

  /**
      Gets the tab view self controls.
    Returns:     the view self controls
  */
  adw.tab_view.TabView getView()
  {
    AdwTabView* _cretval;
    _cretval = adw_tab_bar_get_view(cast(AdwTabBar*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.tab_view.TabView)(cast(AdwTabView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets whether the tabs automatically hide.
    
    If set to `TRUE`, the tab bar disappears when `propertyTabBar:view` has 0
    or 1 tab, no pinned tabs, and no tab is being transferred.
    
    See `propertyTabBar:tabs-revealed`.
    Params:
      autohide =       whether the tabs automatically hide
  */
  void setAutohide(bool autohide)
  {
    adw_tab_bar_set_autohide(cast(AdwTabBar*)cPtr, autohide);
  }

  /**
      Sets the widget to show after the tabs.
    Params:
      widget =       the widget to show after the tabs
  */
  void setEndActionWidget(gtk.widget.Widget widget = null)
  {
    adw_tab_bar_set_end_action_widget(cast(AdwTabBar*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets whether tabs expand to full width.
    
    If set to `TRUE`, the tabs will always vary width filling the whole width
    when possible, otherwise tabs will always have the minimum possible size.
    Params:
      expandTabs =       whether to expand tabs
  */
  void setExpandTabs(bool expandTabs)
  {
    adw_tab_bar_set_expand_tabs(cast(AdwTabBar*)cPtr, expandTabs);
  }

  /**
      Sets whether drop data should be preloaded on hover.
    
    See [gtk.drop_target.DropTarget.gboolean].
    Params:
      preload =       whether to preload drop data
  */
  void setExtraDragPreload(bool preload)
  {
    adw_tab_bar_set_extra_drag_preload(cast(AdwTabBar*)cPtr, preload);
  }

  /**
      Sets whether tabs tabs use inverted layout.
    
    If set to `TRUE`, non-pinned tabs will have the close button at the beginning
    and the indicator at the end rather than the opposite.
    Params:
      inverted =       whether tabs use inverted layout
  */
  void setInverted(bool inverted)
  {
    adw_tab_bar_set_inverted(cast(AdwTabBar*)cPtr, inverted);
  }

  /**
      Sets the widget to show before the tabs.
    Params:
      widget =       the widget to show before the tabs
  */
  void setStartActionWidget(gtk.widget.Widget widget = null)
  {
    adw_tab_bar_set_start_action_widget(cast(AdwTabBar*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets the tab view self controls.
    Params:
      view =       a tab view
  */
  void setView(adw.tab_view.TabView view = null)
  {
    adw_tab_bar_set_view(cast(AdwTabBar*)cPtr, view ? cast(AdwTabView*)view.cPtr(No.Dup) : null);
  }

  /**
      Sets the supported types for this drop target.
    
    Sets up an extra drop target on tabs.
    
    This allows to drag arbitrary content onto tabs, for example URLs in a web
    browser.
    
    If a tab is hovered for a certain period of time while dragging the content,
    it will be automatically selected.
    
    The `signalTabBar::extra-drag-drop` signal can be used to handle the drop.
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
    adw_tab_bar_setup_extra_drop_target(cast(AdwTabBar*)cPtr, actions, _types, _nTypes);
  }

  /**
      This signal is emitted when content is dropped onto a tab.
    
    The content must be of one of the types set up via
    [adw.tab_bar.TabBar.setupExtraDropTarget].
    
    See [gtk.drop_target.DropTarget.drop].
  
    ## Parameters
    $(LIST
      * $(B page)       the page matching the tab the content was dropped onto
      * $(B value)       the [gobject.value.Value] being dropped
      * $(B tabBar) the instance the signal is connected to
    )
    Returns:     whether the drop was accepted for page
  */
  alias ExtraDragDropCallbackDlg = bool delegate(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_bar.TabBar tabBar);

  /** ditto */
  alias ExtraDragDropCallbackFunc = bool function(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_bar.TabBar tabBar);

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
      auto tabBar = getVal!(adw.tab_bar.TabBar)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto value = getVal!(gobject.value.Value)(&_paramVals[2]);
      _retval = _dClosure.dlg(page, value, tabBar);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-drop", closure, after);
  }

  /**
      This signal is emitted when the dropped content is preloaded.
    
    In order for data to be preloaded, `propertyTabBar:extra-drag-preload`
    must be set to `TRUE`.
    
    The content must be of one of the types set up via
    [adw.tab_bar.TabBar.setupExtraDropTarget].
    
    See [gtk.drop_target.DropTarget.GObject.Value].
  
    ## Parameters
    $(LIST
      * $(B page)       the page matching the tab the content was dropped onto
      * $(B value)       the [gobject.value.Value] being dropped
      * $(B tabBar) the instance the signal is connected to
    )
    Returns:     the preferred action for the drop on page
  */
  alias ExtraDragValueCallbackDlg = gdk.types.DragAction delegate(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_bar.TabBar tabBar);

  /** ditto */
  alias ExtraDragValueCallbackFunc = gdk.types.DragAction function(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_bar.TabBar tabBar);

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
      auto tabBar = getVal!(adw.tab_bar.TabBar)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto value = getVal!(gobject.value.Value)(&_paramVals[2]);
      auto _dretval = _dClosure.dlg(page, value, tabBar);
      GdkDragAction _retval = cast(GdkDragAction)_dretval;
      setVal!gdk.types.DragAction(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-value", closure, after);
  }
}
