module gtk.app_chooser_button;

import gid.gid;
import gio.icon;
import gobject.dclosure;
import gobject.object;
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
    The [gtk.app_chooser_button.AppChooserButton] lets the user select an application.
  
  ![An example GtkAppChooserButton](appchooserbutton.png)
  
  Initially, a [gtk.app_chooser_button.AppChooserButton] selects the first application
  in its list, which will either be the most-recently used application
  or, if `property@Gtk.AppChooserButton:show-default-item` is true, the
  default application.
  
  The list of applications shown in a [gtk.app_chooser_button.AppChooserButton] includes
  the recommended applications for the given content type. When
  `property@Gtk.AppChooserButton:show-default-item` is set, the default
  application is also included. To let the user chooser other applications,
  you can set the `property@Gtk.AppChooserButton:show-dialog-item` property,
  which allows to open a full [gtk.app_chooser_dialog.AppChooserDialog].
  
  It is possible to add custom items to the list, using
  [gtk.app_chooser_button.AppChooserButton.appendCustomItem]. These items cause
  the `signal@Gtk.AppChooserButton::custom-item-activated` signal to be
  emitted when they are selected.
  
  To track changes in the selected application, use the
  [gtk.app_chooser_button.AppChooserButton.changed] signal.
  
  ## CSS nodes
  
  [gtk.app_chooser_button.AppChooserButton] has a single CSS node with the name “appchooserbutton”.

  Deprecated:     The application selection widgets should be
      implemented according to the design of each platform and/or
      application requiring them.
*/
class AppChooserButton : gtk.widget.Widget, gtk.app_chooser.AppChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_app_chooser_button_get_type != &gidSymbolNotFound ? gtk_app_chooser_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override AppChooserButton self()
  {
    return this;
  }

  mixin AppChooserT!();

  /**
      Creates a new [gtk.app_chooser_button.AppChooserButton] for applications
    that can handle content of the given type.
    Params:
      contentType =       the content type to show applications for
    Returns:     a newly created [gtk.app_chooser_button.AppChooserButton]
  
    Deprecated:     This widget will be removed in GTK 5
  */
  this(string contentType)
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = gtk_app_chooser_button_new(_contentType);
    this(_cretval, No.Take);
  }

  /**
      Appends a custom item to the list of applications that is shown
    in the popup.
    
    The item name must be unique per-widget. Clients can use the
    provided name as a detail for the
    `signalGtk.AppChooserButton::custom-item-activated` signal, to add a
    callback for the activation of a particular custom item in the list.
    
    See also [gtk.app_chooser_button.AppChooserButton.appendSeparator].
    Params:
      name =       the name of the custom item
      label =       the label for the custom item
      icon =       the icon for the custom item
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void appendCustomItem(string name, string label, gio.icon.Icon icon)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    gtk_app_chooser_button_append_custom_item(cast(GtkAppChooserButton*)cPtr, _name, _label, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
  }

  /**
      Appends a separator to the list of applications that is shown
    in the popup.
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void appendSeparator()
  {
    gtk_app_chooser_button_append_separator(cast(GtkAppChooserButton*)cPtr);
  }

  /**
      Returns the text to display at the top of the dialog.
    Returns:     the text to display at the top of the dialog,
        or null, in which case a default text is displayed
  
    Deprecated:     This widget will be removed in GTK 5
  */
  string getHeading()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_button_get_heading(cast(GtkAppChooserButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the dialog is modal.
    Returns:     true if the dialog is modal
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_app_chooser_button_get_modal(cast(GtkAppChooserButton*)cPtr);
    return _retval;
  }

  /**
      Returns whether the dropdown menu should show the default
    application at the top.
    Returns:     the value of `propertyGtk.AppChooserButton:show-default-item`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getShowDefaultItem()
  {
    bool _retval;
    _retval = gtk_app_chooser_button_get_show_default_item(cast(GtkAppChooserButton*)cPtr);
    return _retval;
  }

  /**
      Returns whether the dropdown menu shows an item
    for a [gtk.app_chooser_dialog.AppChooserDialog].
    Returns:     the value of `propertyGtk.AppChooserButton:show-dialog-item`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  bool getShowDialogItem()
  {
    bool _retval;
    _retval = gtk_app_chooser_button_get_show_dialog_item(cast(GtkAppChooserButton*)cPtr);
    return _retval;
  }

  /**
      Selects a custom item.
    
    See [gtk.app_chooser_button.AppChooserButton.appendCustomItem].
    
    Use [gtk.app_chooser.AppChooser.refresh] to bring the selection
    to its initial state.
    Params:
      name =       the name of the custom item
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setActiveCustomItem(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_app_chooser_button_set_active_custom_item(cast(GtkAppChooserButton*)cPtr, _name);
  }

  /**
      Sets the text to display at the top of the dialog.
    
    If the heading is not set, the dialog displays a default text.
    Params:
      heading =       a string containing Pango markup
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setHeading(string heading)
  {
    const(char)* _heading = heading.toCString(No.Alloc);
    gtk_app_chooser_button_set_heading(cast(GtkAppChooserButton*)cPtr, _heading);
  }

  /**
      Sets whether the dialog should be modal.
    Params:
      modal =       true to make the dialog modal
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setModal(bool modal)
  {
    gtk_app_chooser_button_set_modal(cast(GtkAppChooserButton*)cPtr, modal);
  }

  /**
      Sets whether the dropdown menu of this button should show the
    default application for the given content type at top.
    Params:
      setting =       the new value for `propertyGtk.AppChooserButton:show-default-item`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setShowDefaultItem(bool setting)
  {
    gtk_app_chooser_button_set_show_default_item(cast(GtkAppChooserButton*)cPtr, setting);
  }

  /**
      Sets whether the dropdown menu of this button should show an
    entry to trigger a [gtk.app_chooser_dialog.AppChooserDialog].
    Params:
      setting =       the new value for `propertyGtk.AppChooserButton:show-dialog-item`
  
    Deprecated:     This widget will be removed in GTK 5
  */
  void setShowDialogItem(bool setting)
  {
    gtk_app_chooser_button_set_show_dialog_item(cast(GtkAppChooserButton*)cPtr, setting);
  }

  /**
      Emitted to when the button is activated.
    
    The `::activate` signal on [gtk.app_chooser_button.AppChooserButton] is an action signal and
    emitting it causes the button to pop up its dialog.
  
    ## Parameters
    $(LIST
      * $(B appChooserButton) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.app_chooser_button.AppChooserButton appChooserButton);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.app_chooser_button.AppChooserButton appChooserButton);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appChooserButton = getVal!(gtk.app_chooser_button.AppChooserButton)(_paramVals);
      _dClosure.dlg(appChooserButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Emitted when the active application changes.
  
    ## Parameters
    $(LIST
      * $(B appChooserButton) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gtk.app_chooser_button.AppChooserButton appChooserButton);

  /** ditto */
  alias ChangedCallbackFunc = void function(gtk.app_chooser_button.AppChooserButton appChooserButton);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appChooserButton = getVal!(gtk.app_chooser_button.AppChooserButton)(_paramVals);
      _dClosure.dlg(appChooserButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Emitted when a custom item is activated.
    
    Use [gtk.app_chooser_button.AppChooserButton.appendCustomItem],
    to add custom items.
  
    ## Parameters
    $(LIST
      * $(B itemName)       the name of the activated item
      * $(B appChooserButton) the instance the signal is connected to
    )
  */
  alias CustomItemActivatedCallbackDlg = void delegate(string itemName, gtk.app_chooser_button.AppChooserButton appChooserButton);

  /** ditto */
  alias CustomItemActivatedCallbackFunc = void function(string itemName, gtk.app_chooser_button.AppChooserButton appChooserButton);

  /**
    Connect to CustomItemActivated signal.
    Params:
      detail = Signal detail or null (default)
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCustomItemActivated(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : CustomItemActivatedCallbackDlg) || is(T : CustomItemActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appChooserButton = getVal!(gtk.app_chooser_button.AppChooserButton)(_paramVals);
      auto itemName = getVal!(string)(&_paramVals[1]);
      _dClosure.dlg(itemName, appChooserButton);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("custom-item-activated"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
