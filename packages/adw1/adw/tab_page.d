/// Module for [TabPage] class
module adw.tab_page;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gio.icon;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.widget;

/**
    An auxiliary class used by `class@TabView`.
*/
class TabPage : gobject.object.ObjectG, gtk.accessible.Accessible
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
    return cast(void function())adw_tab_page_get_type != &gidSymbolNotFound ? adw_tab_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override TabPage self()
  {
    return this;
  }

  mixin AccessibleT!();

  /**
      Gets the child of self.
      Returns: the child of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_page_get_child(cast(AdwTabPage*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon of self.
      Returns: the icon of self
  */
  gio.icon.Icon getIcon()
  {
    GIcon* _cretval;
    _cretval = adw_tab_page_get_icon(cast(AdwTabPage*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the indicator of self is activatable.
      Returns: whether the indicator is activatable
  */
  bool getIndicatorActivatable()
  {
    bool _retval;
    _retval = adw_tab_page_get_indicator_activatable(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets the indicator icon of self.
      Returns: the indicator icon of self
  */
  gio.icon.Icon getIndicatorIcon()
  {
    GIcon* _cretval;
    _cretval = adw_tab_page_get_indicator_icon(cast(AdwTabPage*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the tooltip of the indicator icon of self.
      Returns: the indicator tooltip of self
  */
  string getIndicatorTooltip()
  {
    const(char)* _cretval;
    _cretval = adw_tab_page_get_indicator_tooltip(cast(AdwTabPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the search keyword of self.
      Returns: the search keyword of self
  */
  string getKeyword()
  {
    const(char)* _cretval;
    _cretval = adw_tab_page_get_keyword(cast(AdwTabPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether to live thumbnail is enabled self.
      Returns: whether live thumbnail is enabled
  */
  bool getLiveThumbnail()
  {
    bool _retval;
    _retval = adw_tab_page_get_live_thumbnail(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is loading.
      Returns: whether self is loading
  */
  bool getLoading()
  {
    bool _retval;
    _retval = adw_tab_page_get_loading(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets whether self needs attention.
      Returns: whether self needs attention
  */
  bool getNeedsAttention()
  {
    bool _retval;
    _retval = adw_tab_page_get_needs_attention(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets the parent page of self.
      
      See [adw.tab_view.TabView.addPage] and [adw.tab_view.TabView.closePage].
      Returns: the parent page
  */
  adw.tab_page.TabPage getParent()
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_page_get_parent(cast(AdwTabPage*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self is pinned.
      
      See [adw.tab_view.TabView.setPagePinned].
      Returns: whether self is pinned
  */
  bool getPinned()
  {
    bool _retval;
    _retval = adw_tab_page_get_pinned(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is selected.
      Returns: whether self is selected
  */
  bool getSelected()
  {
    bool _retval;
    _retval = adw_tab_page_get_selected(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets the horizontal alignment of the thumbnail for self.
      Returns: the horizontal alignment
  */
  float getThumbnailXalign()
  {
    float _retval;
    _retval = adw_tab_page_get_thumbnail_xalign(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets the vertical alignment of the thumbnail for self.
      Returns: the vertical alignment
  */
  float getThumbnailYalign()
  {
    float _retval;
    _retval = adw_tab_page_get_thumbnail_yalign(cast(AdwTabPage*)cPtr);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title of self
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_tab_page_get_title(cast(AdwTabPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip of self.
      Returns: the tooltip of self
  */
  string getTooltip()
  {
    const(char)* _cretval;
    _cretval = adw_tab_page_get_tooltip(cast(AdwTabPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Invalidates thumbnail for self.
      
      If an `classTabOverview` is open, the thumbnail representing self will be
      immediately updated. Otherwise it will be update when opening the overview.
      
      Does nothing if `propertyTabPage:live-thumbnail` is set to `TRUE`.
      
      See also [adw.tab_view.TabView.invalidateThumbnails].
  */
  void invalidateThumbnail()
  {
    adw_tab_page_invalidate_thumbnail(cast(AdwTabPage*)cPtr);
  }

  /**
      Sets the icon of self.
      
      `classTabBar` and `classTabOverview` display the icon next to the title,
      unless `propertyTabPage:loading` is set to `TRUE`.
      
      [adw.tab_bar.TabBar] also won't show the icon if the page is pinned and
      [propertyTabPage:indicator-icon] is set.
  
      Params:
        icon = the icon of self
  */
  void setIcon(gio.icon.Icon icon = null)
  {
    adw_tab_page_set_icon(cast(AdwTabPage*)cPtr, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
  }

  /**
      Sets whether the indicator of self is activatable.
      
      If set to `TRUE`, `signalTabView::indicator-activated` will be emitted
      when the indicator icon is clicked.
      
      If `propertyTabPage:indicator-icon` is not set, does nothing.
  
      Params:
        activatable = whether the indicator is activatable
  */
  void setIndicatorActivatable(bool activatable)
  {
    adw_tab_page_set_indicator_activatable(cast(AdwTabPage*)cPtr, activatable);
  }

  /**
      Sets the indicator icon of self.
      
      A common use case is an audio or camera indicator in a web browser.
      
      `classTabBar` will show it at the beginning of the tab, alongside icon
      representing `propertyTabPage:icon` or loading spinner.
      
      If the page is pinned, the indicator will be shown instead of icon or
      spinner.
      
      `classTabOverview` will show it at the at the top part of the thumbnail.
      
      `propertyTabPage:indicator-tooltip` can be used to set the tooltip on the
      indicator icon.
      
      If `propertyTabPage:indicator-activatable` is set to `TRUE`, the
      indicator icon can act as a button.
  
      Params:
        indicatorIcon = the indicator icon of self
  */
  void setIndicatorIcon(gio.icon.Icon indicatorIcon = null)
  {
    adw_tab_page_set_indicator_icon(cast(AdwTabPage*)cPtr, indicatorIcon ? cast(GIcon*)(cast(ObjectG)indicatorIcon).cPtr(No.Dup) : null);
  }

  /**
      Sets the tooltip of the indicator icon of self.
      
      The tooltip can be marked up with the Pango text markup language.
      
      See `propertyTabPage:indicator-icon`.
  
      Params:
        tooltip = the indicator tooltip of self
  */
  void setIndicatorTooltip(string tooltip)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    adw_tab_page_set_indicator_tooltip(cast(AdwTabPage*)cPtr, _tooltip);
  }

  /**
      Sets the search keyword for self.
      
      `classTabOverview` can search pages by their keywords in addition to their
      titles and tooltips.
      
      Keywords allow to include e.g. page URLs into tab search in a web browser.
  
      Params:
        keyword = the search keyword
  */
  void setKeyword(string keyword)
  {
    const(char)* _keyword = keyword.toCString(No.Alloc);
    adw_tab_page_set_keyword(cast(AdwTabPage*)cPtr, _keyword);
  }

  /**
      Sets whether to enable live thumbnail for self.
      
      When set to `TRUE`, self's thumbnail in `classTabOverview` will update
      immediately when self is redrawn or resized.
      
      If it's set to `FALSE`, the thumbnail will only be live when the self is
      selected, and otherwise it will be static and will only update when
      [adw.tab_page.TabPage.invalidateThumbnail] or
      [adw.tab_view.TabView.invalidateThumbnails] is called.
  
      Params:
        liveThumbnail = whether to enable live thumbnail
  */
  void setLiveThumbnail(bool liveThumbnail)
  {
    adw_tab_page_set_live_thumbnail(cast(AdwTabPage*)cPtr, liveThumbnail);
  }

  /**
      Sets whether self is loading.
      
      If set to `TRUE`, `classTabBar` and `classTabOverview` will display a
      spinner in place of icon.
      
      If the page is pinned and `propertyTabPage:indicator-icon` is set, loading
      status will not be visible with [adw.tab_bar.TabBar].
  
      Params:
        loading = whether self is loading
  */
  void setLoading(bool loading)
  {
    adw_tab_page_set_loading(cast(AdwTabPage*)cPtr, loading);
  }

  /**
      Sets whether self needs attention.
      
      `classTabBar` will display a line under the tab representing the page if
      set to `TRUE`. If the tab is not visible, the corresponding edge of the tab
      bar will be highlighted.
      
      `classTabOverview` will display a dot in the corner of the thumbnail if set
      to `TRUE`.
      
      `classTabButton` will display a dot if any of the pages that aren't
      selected have `propertyTabPage:needs-attention` set to `TRUE`.
  
      Params:
        needsAttention = whether self needs attention
  */
  void setNeedsAttention(bool needsAttention)
  {
    adw_tab_page_set_needs_attention(cast(AdwTabPage*)cPtr, needsAttention);
  }

  /**
      Sets the horizontal alignment of the thumbnail for self.
      
      If the page is so wide that `classTabOverview` can't display it completely
      and has to crop it, horizontal alignment will determine which part of the
      page will be visible.
      
      For example, 0.5 means the center of the page will be visible, 0 means the
      start edge will be visible and 1 means the end edge will be visible.
      
      The default horizontal alignment is 0.
  
      Params:
        xalign = the new value
  */
  void setThumbnailXalign(float xalign)
  {
    adw_tab_page_set_thumbnail_xalign(cast(AdwTabPage*)cPtr, xalign);
  }

  /**
      Sets the vertical alignment of the thumbnail for self.
      
      If the page is so tall that `classTabOverview` can't display it completely
      and has to crop it, vertical alignment will determine which part of the page
      will be visible.
      
      For example, 0.5 means the center of the page will be visible, 0 means the
      top edge will be visible and 1 means the bottom edge will be visible.
      
      The default vertical alignment is 0.
  
      Params:
        yalign = the new value
  */
  void setThumbnailYalign(float yalign)
  {
    adw_tab_page_set_thumbnail_yalign(cast(AdwTabPage*)cPtr, yalign);
  }

  /**
      `classTabBar` will display it in the center of the tab unless it's pinned,
      and will use it as a tooltip unless `propertyTabPage:tooltip` is set.
      
      `classTabOverview` will display it below the thumbnail unless it's pinned,
      or inside the card otherwise, and will use it as a tooltip unless
      `propertyTabPage:tooltip` is set.
      
      Sets the title of self.
  
      Params:
        title = the title of self
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_tab_page_set_title(cast(AdwTabPage*)cPtr, _title);
  }

  /**
      Sets the tooltip of self.
      
      The tooltip can be marked up with the Pango text markup language.
      
      If not set, `classTabBar` and `classTabOverview` will use
      `propertyTabPage:title` as a tooltip instead.
  
      Params:
        tooltip = the tooltip of self
  */
  void setTooltip(string tooltip)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    adw_tab_page_set_tooltip(cast(AdwTabPage*)cPtr, _tooltip);
  }
}
