module adw.view_switcher_title;

import adw.c.functions;
import adw.c.types;
import adw.types;
import adw.view_stack;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A view switcher title.
  
  <picture>
    <source srcset="view-switcher-title-dark.png" media="(prefers-color-scheme: dark)">
    <img src="view-switcher-title.png" alt="view-switcher-title">
  </picture>
  
  A widget letting you switch between multiple views contained by a
  `class@ViewStack` via an `class@ViewSwitcher`.
  
  It is designed to be used as the title widget of a `class@HeaderBar`, and
  will display the window's title when the window is too narrow to fit the view
  switcher e.g. on mobile phones, or if there are less than two views.
  
  In order to center the title in narrow windows, the header bar should have
  `property@HeaderBar:centering-policy` set to
  [adw.types.CenteringPolicy.Strict].
  
  [adw.view_switcher_title.ViewSwitcherTitle] is intended to be used together with
  `class@ViewSwitcherBar`.
  
  A common use case is to bind the `property@ViewSwitcherBar:reveal` property
  to `property@ViewSwitcherTitle:title-visible` to automatically reveal the
  view switcher bar when the title label is displayed in place of the view
  switcher, as follows:
  
  ```xml
  <object class="AdwWindow">
    <property name="content">
      <object class="AdwToolbarView">
        <child type="top">
          <object class="AdwHeaderBar">
            <property name="centering-policy">strict</property>
            <property name="title-widget">
              <object class="AdwViewSwitcherTitle" id="title">
                <property name="stack">stack</property>
              </object>
            </property>
          </object>
        </child>
        <property name="content">
          <object class="AdwViewStack" id="stack"/>
        </property>
        <child type="bottom">
          <object class="AdwViewSwitcherBar">
            <property name="stack">stack</property>
            <binding name="reveal">
              <lookup name="title-visible">title</lookup>
            </binding>
          </object>
        </child>
      </object>
    </property>
  </object>
  ```
  
  ## CSS nodes
  
  [adw.view_switcher_title.ViewSwitcherTitle] has a single CSS node with name `viewswitchertitle`.

  Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
*/
class ViewSwitcherTitle : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_view_switcher_title_get_type != &gidSymbolNotFound ? adw_view_switcher_title_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ViewSwitcherTitle self()
  {
    return this;
  }

  /**
      Creates a new [adw.view_switcher_title.ViewSwitcherTitle].
    Returns:     the newly created [adw.view_switcher_title.ViewSwitcherTitle]
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_view_switcher_title_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the stack controlled by self.
    Returns:     the stack
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  adw.view_stack.ViewStack getStack()
  {
    AdwViewStack* _cretval;
    _cretval = adw_view_switcher_title_get_stack(cast(AdwViewSwitcherTitle*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.view_stack.ViewStack)(cast(AdwViewStack*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the subtitle of self.
    Returns:     the subtitle
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  string getSubtitle()
  {
    const(char)* _cretval;
    _cretval = adw_view_switcher_title_get_subtitle(cast(AdwViewSwitcherTitle*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
    Returns:     the title
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_view_switcher_title_get_title(cast(AdwViewSwitcherTitle*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the title of self is currently visible.
    
    If the title is visible, it means the view switcher is hidden an it may be
    wanted to show an alternative switcher, e.g. a `classViewSwitcherBar`.
    Returns:     whether the title of self is currently visible
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  bool getTitleVisible()
  {
    bool _retval;
    _retval = adw_view_switcher_title_get_title_visible(cast(AdwViewSwitcherTitle*)cPtr);
    return _retval;
  }

  /**
      Gets whether self's view switcher is enabled.
    Returns:     whether the view switcher is enabled
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  bool getViewSwitcherEnabled()
  {
    bool _retval;
    _retval = adw_view_switcher_title_get_view_switcher_enabled(cast(AdwViewSwitcherTitle*)cPtr);
    return _retval;
  }

  /**
      Sets the stack controlled by self.
    Params:
      stack =       a stack
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  void setStack(adw.view_stack.ViewStack stack = null)
  {
    adw_view_switcher_title_set_stack(cast(AdwViewSwitcherTitle*)cPtr, stack ? cast(AdwViewStack*)stack.cPtr(No.Dup) : null);
  }

  /**
      Sets the subtitle of self.
    
    The subtitle should give the user additional details.
    Params:
      subtitle =       a subtitle
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  void setSubtitle(string subtitle)
  {
    const(char)* _subtitle = subtitle.toCString(No.Alloc);
    adw_view_switcher_title_set_subtitle(cast(AdwViewSwitcherTitle*)cPtr, _subtitle);
  }

  /**
      Sets the title of self.
    
    The title typically identifies the current view or content item, and
    generally does not use the application name.
    Params:
      title =       a title
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_view_switcher_title_set_title(cast(AdwViewSwitcherTitle*)cPtr, _title);
  }

  /**
      Sets whether self's view switcher is enabled.
    
    If it is disabled, the title will be displayed instead. This allows to
    programmatically hide the view switcher even if it fits in the available
    space.
    
    This can be used e.g. to ensure the view switcher is hidden below a certain
    window width, or any other constraint you find suitable.
    Params:
      enabled =       whether the view switcher is enabled
  
    Deprecated:     See [the migration guide](migrating-to-breakpoints.html#replace-adwviewswitchertitle)
  */
  void setViewSwitcherEnabled(bool enabled)
  {
    adw_view_switcher_title_set_view_switcher_enabled(cast(AdwViewSwitcherTitle*)cPtr, enabled);
  }
}
