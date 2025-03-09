module adw.view_stack_page;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.widget;

/**
    An auxiliary class used by `class@ViewStack`.
*/
class ViewStackPage : gobject.object.ObjectG, gtk.accessible.Accessible
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_view_stack_page_get_type != &gidSymbolNotFound ? adw_view_stack_page_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin AccessibleT!();

  /**
      Gets the badge number for this page.
    Returns:     the badge number for this page
  */
  uint getBadgeNumber()
  {
    uint _retval;
    _retval = adw_view_stack_page_get_badge_number(cast(AdwViewStackPage*)cPtr);
    return _retval;
  }

  /**
      Gets the stack child to which self belongs.
    Returns:     the child to which self belongs
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_view_stack_page_get_child(cast(AdwViewStackPage*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of the page.
    Returns:     the icon name of the page
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_page_get_icon_name(cast(AdwViewStackPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of the page.
    Returns:     the name of the page
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_page_get_name(cast(AdwViewStackPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the page requires the user attention.
    Returns:     whether the page needs attention
  */
  bool getNeedsAttention()
  {
    bool _retval;
    _retval = adw_view_stack_page_get_needs_attention(cast(AdwViewStackPage*)cPtr);
    return _retval;
  }

  /**
      Gets the page title.
    Returns:     the page title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_page_get_title(cast(AdwViewStackPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether underlines in the page title indicate mnemonics.
    Returns:     whether underlines in the page title indicate mnemonics
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = adw_view_stack_page_get_use_underline(cast(AdwViewStackPage*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is visible in its [adw.view_stack.ViewStack].
    
    This is independent from the [gtk.widget.Widget.gboolean]
    property of its widget.
    Returns:     whether self is visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = adw_view_stack_page_get_visible(cast(AdwViewStackPage*)cPtr);
    return _retval;
  }

  /**
      Sets the badge number for this page.
    
    `classViewSwitcher` can display it as a badge next to the page icon. It is
    commonly used to display a number of unread items within the page.
    
    It can be used together with `propertyViewStack{age}:needs-attention`.
    Params:
      badgeNumber =       the new value to set
  */
  void setBadgeNumber(uint badgeNumber)
  {
    adw_view_stack_page_set_badge_number(cast(AdwViewStackPage*)cPtr, badgeNumber);
  }

  /**
      Sets the icon name of the page.
    Params:
      iconName =       the icon name
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_view_stack_page_set_icon_name(cast(AdwViewStackPage*)cPtr, _iconName);
  }

  /**
      Sets the name of the page.
    Params:
      name =       the page name
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_view_stack_page_set_name(cast(AdwViewStackPage*)cPtr, _name);
  }

  /**
      Sets whether the page requires the user attention.
    
    `classViewSwitcher` will display it as a dot next to the page icon.
    Params:
      needsAttention =       the new value to set
  */
  void setNeedsAttention(bool needsAttention)
  {
    adw_view_stack_page_set_needs_attention(cast(AdwViewStackPage*)cPtr, needsAttention);
  }

  /**
      Sets the page title.
    Params:
      title =       the page title
  */
  void setTitle(string title = null)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_view_stack_page_set_title(cast(AdwViewStackPage*)cPtr, _title);
  }

  /**
      Sets whether underlines in the page title indicate mnemonics.
    Params:
      useUnderline =       the new value to set
  */
  void setUseUnderline(bool useUnderline)
  {
    adw_view_stack_page_set_use_underline(cast(AdwViewStackPage*)cPtr, useUnderline);
  }

  /**
      Sets whether page is visible in its [adw.view_stack.ViewStack].
    
    This is independent from the [gtk.widget.Widget.gboolean] property of
    `propertyViewStackPage:child`.
    Params:
      visible =       whether self is visible
  */
  void setVisible(bool visible)
  {
    adw_view_stack_page_set_visible(cast(AdwViewStackPage*)cPtr, visible);
  }
}
