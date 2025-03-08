module gtk.app_chooser_widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.app_info;
import gobject.dclosure;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    #GtkAppChooserWidget is a widget for selecting applications.
  It is the main building block for #GtkAppChooserDialog. Most
  applications only need to use the latter; but you can use
  this widget as part of a larger widget if you have special needs.
  
  #GtkAppChooserWidget offers detailed control over what applications
  are shown, using the
  #GtkAppChooserWidget:show-default,
  #GtkAppChooserWidget:show-recommended,
  #GtkAppChooserWidget:show-fallback,
  #GtkAppChooserWidget:show-other and
  #GtkAppChooserWidget:show-all
  properties. See the #GtkAppChooser documentation for more information
  about these groups of applications.
  
  To keep track of the selected application, use the
  #GtkAppChooserWidget::application-selected and #GtkAppChooserWidget::application-activated signals.
  
  # CSS nodes
  
  GtkAppChooserWidget has a single CSS node with name appchooser.
*/
class AppChooserWidget : gtk.box.Box, gtk.app_chooser.AppChooser
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_app_chooser_widget_get_type != &gidSymbolNotFound ? gtk_app_chooser_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin AppChooserT!();

  /**
      Creates a new #GtkAppChooserWidget for applications
    that can handle content of the given type.
    Params:
      contentType =       the content type to show applications for
    Returns:     a newly created #GtkAppChooserWidget
  */
  this(string contentType)
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString(No.alloc);
    _cretval = gtk_app_chooser_widget_new(_contentType);
    this(_cretval, No.take);
  }

  /**
      Returns the text that is shown if there are not applications
    that can handle the content type.
    Returns:     the value of #GtkAppChooserWidget:default-text
  */
  string getDefaultText()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_widget_get_default_text(cast(GtkAppChooserWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-all
    property.
    Returns:     the value of #GtkAppChooserWidget:show-all
  */
  bool getShowAll()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_all(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-default
    property.
    Returns:     the value of #GtkAppChooserWidget:show-default
  */
  bool getShowDefault()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_default(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-fallback
    property.
    Returns:     the value of #GtkAppChooserWidget:show-fallback
  */
  bool getShowFallback()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_fallback(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-other
    property.
    Returns:     the value of #GtkAppChooserWidget:show-other
  */
  bool getShowOther()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_other(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-recommended
    property.
    Returns:     the value of #GtkAppChooserWidget:show-recommended
  */
  bool getShowRecommended()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_recommended(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Sets the text that is shown if there are not applications
    that can handle the content type.
    Params:
      text =       the new value for #GtkAppChooserWidget:default-text
  */
  void setDefaultText(string text)
  {
    const(char)* _text = text.toCString(No.alloc);
    gtk_app_chooser_widget_set_default_text(cast(GtkAppChooserWidget*)cPtr, _text);
  }

  /**
      Sets whether the app chooser should show all applications
    in a flat list.
    Params:
      setting =       the new value for #GtkAppChooserWidget:show-all
  */
  void setShowAll(bool setting)
  {
    gtk_app_chooser_widget_set_show_all(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show the default handler
    for the content type in a separate section.
    Params:
      setting =       the new value for #GtkAppChooserWidget:show-default
  */
  void setShowDefault(bool setting)
  {
    gtk_app_chooser_widget_set_show_default(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show related applications
    for the content type in a separate section.
    Params:
      setting =       the new value for #GtkAppChooserWidget:show-fallback
  */
  void setShowFallback(bool setting)
  {
    gtk_app_chooser_widget_set_show_fallback(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show applications
    which are unrelated to the content type.
    Params:
      setting =       the new value for #GtkAppChooserWidget:show-other
  */
  void setShowOther(bool setting)
  {
    gtk_app_chooser_widget_set_show_other(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show recommended applications
    for the content type in a separate section.
    Params:
      setting =       the new value for #GtkAppChooserWidget:show-recommended
  */
  void setShowRecommended(bool setting)
  {
    gtk_app_chooser_widget_set_show_recommended(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Emitted when an application item is activated from the widget's list.
    
    This usually happens when the user double clicks an item, or an item
    is selected and the user presses one of the keys Space, Shift+Space,
    Return or Enter.
  
    ## Parameters
    $(LIST
      * $(B application)       the activated #GAppInfo
      * $(B appChooserWidget) the instance the signal is connected to
    )
  */
  alias ApplicationActivatedCallbackDlg = void delegate(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget);

  /** ditto */
  alias ApplicationActivatedCallbackFunc = void function(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget);

  /**
    Connect to ApplicationActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectApplicationActivated(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ApplicationActivatedCallbackDlg) || is(T : ApplicationActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appChooserWidget = getVal!(gtk.app_chooser_widget.AppChooserWidget)(_paramVals);
      auto application = getVal!(gio.app_info.AppInfo)(&_paramVals[1]);
      _dClosure.dlg(application, appChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("application-activated", closure, after);
  }

  /**
      Emitted when an application item is selected from the widget's list.
  
    ## Parameters
    $(LIST
      * $(B application)       the selected #GAppInfo
      * $(B appChooserWidget) the instance the signal is connected to
    )
  */
  alias ApplicationSelectedCallbackDlg = void delegate(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget);

  /** ditto */
  alias ApplicationSelectedCallbackFunc = void function(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget);

  /**
    Connect to ApplicationSelected signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectApplicationSelected(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ApplicationSelectedCallbackDlg) || is(T : ApplicationSelectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appChooserWidget = getVal!(gtk.app_chooser_widget.AppChooserWidget)(_paramVals);
      auto application = getVal!(gio.app_info.AppInfo)(&_paramVals[1]);
      _dClosure.dlg(application, appChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("application-selected", closure, after);
  }

  /**
      Emitted when a context menu is about to popup over an application item.
    Clients can insert menu items into the provided #GtkMenu object in the
    callback of this signal; the context menu will be shown over the item
    if at least one item has been added to the menu.
  
    ## Parameters
    $(LIST
      * $(B menu)       the #GtkMenu to populate
      * $(B application)       the current #GAppInfo
      * $(B appChooserWidget) the instance the signal is connected to
    )
  */
  alias PopulatePopupCallbackDlg = void delegate(gtk.menu.Menu menu, gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget);

  /** ditto */
  alias PopulatePopupCallbackFunc = void function(gtk.menu.Menu menu, gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget);

  /**
    Connect to PopulatePopup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopulatePopup(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PopulatePopupCallbackDlg) || is(T : PopulatePopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appChooserWidget = getVal!(gtk.app_chooser_widget.AppChooserWidget)(_paramVals);
      auto menu = getVal!(gtk.menu.Menu)(&_paramVals[1]);
      auto application = getVal!(gio.app_info.AppInfo)(&_paramVals[2]);
      _dClosure.dlg(menu, application, appChooserWidget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }
}
