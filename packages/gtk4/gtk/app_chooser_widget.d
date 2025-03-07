module gtk.app_chooser_widget;

import gid.gid;
import gio.app_info;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.app_chooser_widget.AppChooserWidget] is a widget for selecting applications.
  
  It is the main building block for [gtk.app_chooser_dialog.AppChooserDialog].
  Most applications only need to use the latter; but you can use
  this widget as part of a larger widget if you have special needs.
  
  [gtk.app_chooser_widget.AppChooserWidget] offers detailed control over what applications
  are shown, using the
  `property@Gtk.AppChooserWidget:show-default`,
  `property@Gtk.AppChooserWidget:show-recommended`,
  `property@Gtk.AppChooserWidget:show-fallback`,
  `property@Gtk.AppChooserWidget:show-other` and
  `property@Gtk.AppChooserWidget:show-all` properties. See the
  [gtk.app_chooser.AppChooser] documentation for more information about these
  groups of applications.
  
  To keep track of the selected application, use the
  `signal@Gtk.AppChooserWidget::application-selected` and
  `signal@Gtk.AppChooserWidget::application-activated` signals.
  
  ## CSS nodes
  
  [gtk.app_chooser_widget.AppChooserWidget] has a single CSS node with name appchooser.

  Deprecated:     The application selection widgets should be
      implemented according to the design of each platform and/or
      application requiring them.
*/
class AppChooserWidget : gtk.widget.Widget, gtk.app_chooser.AppChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
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
      Creates a new [gtk.app_chooser_widget.AppChooserWidget] for applications
    that can handle content of the given type.
    Params:
      contentType =       the content type to show applications for
    Returns:     a newly created [gtk.app_chooser_widget.AppChooserWidget]
  
    Deprecated:     This widget will be removed in GTK 5
  */
  this(string contentType)
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = gtk_app_chooser_widget_new(_contentType);
    this(_cretval, No.Take);
  }

  /**
      Returns the text that is shown if there are not applications
    that can handle the content type.
    Returns:     the value of `propertyGtk.AppChooserWidget:default-text`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  string getDefaultText()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_widget_get_default_text(cast(GtkAppChooserWidget*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the app chooser should show all applications
    in a flat list.
    Returns:     the value of `propertyGtk.AppChooserWidget:show-all`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getShowAll()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_all(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show the default handler
    for the content type in a separate section.
    Returns:     the value of `propertyGtk.AppChooserWidget:show-default`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getShowDefault()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_default(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show related applications
    for the content type in a separate section.
    Returns:     the value of `propertyGtk.AppChooserWidget:show-fallback`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getShowFallback()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_fallback(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show applications
    which are unrelated to the content type.
    Returns:     the value of `propertyGtk.AppChooserWidget:show-other`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getShowOther()
  {
    bool _retval;
    _retval = gtk_app_chooser_widget_get_show_other(cast(GtkAppChooserWidget*)cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show recommended applications
    for the content type in a separate section.
    Returns:     the value of `propertyGtk.AppChooserWidget:show-recommended`
  
    Deprecated:     This widget will be removed in GTK 5
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
      text =       the new value for `propertyGtk.AppChooserWidget:default-text`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setDefaultText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_app_chooser_widget_set_default_text(cast(GtkAppChooserWidget*)cPtr, _text);
  }

  /**
      Sets whether the app chooser should show all applications
    in a flat list.
    Params:
      setting =       the new value for `propertyGtk.AppChooserWidget:show-all`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setShowAll(bool setting)
  {
    gtk_app_chooser_widget_set_show_all(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show the default handler
    for the content type in a separate section.
    Params:
      setting =       the new value for `propertyGtk.AppChooserWidget:show-default`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setShowDefault(bool setting)
  {
    gtk_app_chooser_widget_set_show_default(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show related applications
    for the content type in a separate section.
    Params:
      setting =       the new value for `propertyGtk.AppChooserWidget:show-fallback`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setShowFallback(bool setting)
  {
    gtk_app_chooser_widget_set_show_fallback(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show applications
    which are unrelated to the content type.
    Params:
      setting =       the new value for `propertyGtk.AppChooserWidget:show-other`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setShowOther(bool setting)
  {
    gtk_app_chooser_widget_set_show_other(cast(GtkAppChooserWidget*)cPtr, setting);
  }

  /**
      Sets whether the app chooser should show recommended applications
    for the content type in a separate section.
    Params:
      setting =       the new value for `propertyGtk.AppChooserWidget:show-recommended`
  
    Deprecated:     This widget will be removed in GTK 5
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
      * $(B application)       the activated [gio.app_info.AppInfo]
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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectApplicationActivated(T)(T callback, Flag!"After" after = No.After)
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
      * $(B application)       the selected [gio.app_info.AppInfo]
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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectApplicationSelected(T)(T callback, Flag!"After" after = No.After)
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
}
