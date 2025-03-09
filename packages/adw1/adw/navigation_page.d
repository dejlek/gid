module adw.navigation_page;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A page within `class@NavigationView` or `class@NavigationSplitView`.
  
  Each page has a child widget, a title and optionally a tag.
  
  The `signal@NavigationPage::showing`, `signal@NavigationPage::shown`,
  `signal@NavigationPage::hiding` and `signal@NavigationPage::hidden` signals
  can be used to track the page's visibility within its [adw.navigation_view.NavigationView].
  
  ## Header Bar Integration
  
  When placed inside [adw.navigation_page.NavigationPage], `class@HeaderBar` will display the
  page title instead of window title.
  
  When used together with `class@NavigationView`, it will also display a back
  button that can be used to go back to the previous page. Set
  `property@HeaderBar:show-back-button` to `FALSE` to disable that behavior if
  it's unwanted.
  
  ## CSS Nodes
  
  [adw.navigation_page.NavigationPage] has a single CSS node with name
  `navigation-view-page`.
  
  ## Accessibility
  
  [adw.navigation_page.NavigationPage] uses the [gtk.types.AccessibleRole.Group] role.
*/
class NavigationPage : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_navigation_page_get_type != &gidSymbolNotFound ? adw_navigation_page_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.navigation_page.NavigationPage].
    Params:
      child =       the child widget
      title =       the page title
    Returns:     the new created [adw.navigation_page.NavigationPage]
  */
  this(gtk.widget.Widget child, string title)
  {
    AdwNavigationPage* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = adw_navigation_page_new(child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _title);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [adw.navigation_page.NavigationPage] with provided tag.
    Params:
      child =       the child widget
      title =       the page title
      tag =       the page tag
    Returns:     the new created [adw.navigation_page.NavigationPage]
  */
  static adw.navigation_page.NavigationPage newWithTag(gtk.widget.Widget child, string title, string tag)
  {
    AdwNavigationPage* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    const(char)* _tag = tag.toCString(No.Alloc);
    _cretval = adw_navigation_page_new_with_tag(child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _title, _tag);
    auto _retval = ObjectG.getDObject!(adw.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self can be popped from navigation stack.
    Returns:     whether the page can be popped from navigation stack
  */
  bool getCanPop()
  {
    bool _retval;
    _retval = adw_navigation_page_get_can_pop(cast(AdwNavigationPage*)cPtr);
    return _retval;
  }

  /**
      Gets the child widget of self.
    Returns:     the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_navigation_page_get_child(cast(AdwNavigationPage*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the tag of self.
    Returns:     the page tag
  */
  string getTag()
  {
    const(char)* _cretval;
    _cretval = adw_navigation_page_get_tag(cast(AdwNavigationPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
    Returns:     the title of self
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_navigation_page_get_title(cast(AdwNavigationPage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets whether self can be popped from navigation stack.
    
    Set it to `FALSE` to disable shortcuts and gestures, as well as remove the
    back button from `classHeaderBar`.
    
    Manually calling [adw.navigation_view.NavigationView.pop] or using the `navigation.pop`
    action will still work.
    
    See `propertyHeaderBar:show-back-button` for removing only the back button,
    but not shortcuts.
    Params:
      canPop =       whether the page can be popped from navigation stack
  */
  void setCanPop(bool canPop)
  {
    adw_navigation_page_set_can_pop(cast(AdwNavigationPage*)cPtr, canPop);
  }

  /**
      Sets the child widget of self.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_navigation_page_set_child(cast(AdwNavigationPage*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets the tag for self.
    
    The tag can be used to retrieve the page with
    [adw.navigation_view.NavigationView.findPage], as well as with
    [adw.navigation_view.NavigationView.pushByTag], [adw.navigation_view.NavigationView.popToTag] or
    [adw.navigation_view.NavigationView.replaceWithTags].
    
    Tags must be unique within each `classNavigationView`.
    
    The tag also must be set to use the `navigation.push` action.
    Params:
      tag =       the page tag
  */
  void setTag(string tag = null)
  {
    const(char)* _tag = tag.toCString(No.Alloc);
    adw_navigation_page_set_tag(cast(AdwNavigationPage*)cPtr, _tag);
  }

  /**
      Sets the title of self.
    
    It's displayed in `classHeaderBar` instead of the window title, and used as
    the tooltip on the next page's back button, as well as by screen reader.
    Params:
      title =       the title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_navigation_page_set_title(cast(AdwNavigationPage*)cPtr, _title);
  }

  /**
      Emitted when the navigation view transition has been completed and the page
    is fully hidden.
    
    It will always be preceded by `signalNavigationPage::hiding` or
    `signalNavigationPage::showing`.
  
    ## Parameters
    $(LIST
      * $(B navigationPage) the instance the signal is connected to
    )
  */
  alias HiddenCallbackDlg = void delegate(adw.navigation_page.NavigationPage navigationPage);

  /** ditto */
  alias HiddenCallbackFunc = void function(adw.navigation_page.NavigationPage navigationPage);

  /**
    Connect to Hidden signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectHidden(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HiddenCallbackDlg) || is(T : HiddenCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto navigationPage = getVal!(adw.navigation_page.NavigationPage)(_paramVals);
      _dClosure.dlg(navigationPage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hidden", closure, after);
  }

  /**
      Emitted when the page starts hiding at the beginning of the navigation view
    transition.
    
    It will always be followed by `signalNavigationPage::hidden` or
    `signalNavigationPage::shown`.
  
    ## Parameters
    $(LIST
      * $(B navigationPage) the instance the signal is connected to
    )
  */
  alias HidingCallbackDlg = void delegate(adw.navigation_page.NavigationPage navigationPage);

  /** ditto */
  alias HidingCallbackFunc = void function(adw.navigation_page.NavigationPage navigationPage);

  /**
    Connect to Hiding signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectHiding(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HidingCallbackDlg) || is(T : HidingCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto navigationPage = getVal!(adw.navigation_page.NavigationPage)(_paramVals);
      _dClosure.dlg(navigationPage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hiding", closure, after);
  }

  /**
      Emitted when the page shows at the beginning of the navigation view
    transition.
    
    It will always be followed by `signalNavigationPage::shown` or
    `signalNavigationPage::hidden`.
  
    ## Parameters
    $(LIST
      * $(B navigationPage) the instance the signal is connected to
    )
  */
  alias ShowingCallbackDlg = void delegate(adw.navigation_page.NavigationPage navigationPage);

  /** ditto */
  alias ShowingCallbackFunc = void function(adw.navigation_page.NavigationPage navigationPage);

  /**
    Connect to Showing signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowing(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowingCallbackDlg) || is(T : ShowingCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto navigationPage = getVal!(adw.navigation_page.NavigationPage)(_paramVals);
      _dClosure.dlg(navigationPage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("showing", closure, after);
  }

  /**
      Emitted when the navigation view transition has been completed and the page
    is fully shown.
    
    It will always be preceded by `signalNavigationPage::showing` or
    `signalNavigationPage::hiding`.
  
    ## Parameters
    $(LIST
      * $(B navigationPage) the instance the signal is connected to
    )
  */
  alias ShownCallbackDlg = void delegate(adw.navigation_page.NavigationPage navigationPage);

  /** ditto */
  alias ShownCallbackFunc = void function(adw.navigation_page.NavigationPage navigationPage);

  /**
    Connect to Shown signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShown(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShownCallbackDlg) || is(T : ShownCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto navigationPage = getVal!(adw.navigation_page.NavigationPage)(_paramVals);
      _dClosure.dlg(navigationPage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("shown", closure, after);
  }
}
