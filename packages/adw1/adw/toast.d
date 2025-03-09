module adw.toast;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import glib.variant;
import gobject.dclosure;
import gobject.object;
import gtk.widget;

/**
    A helper object for `class@ToastOverlay`.
  
  Toasts are meant to be passed into [adw.toast_overlay.ToastOverlay.addToast] as
  follows:
  
  ```c
  adw_toast_overlay_add_toast (overlay, adw_toast_new (_("Simple Toast")));
  ```
  
  <picture>
    <source srcset="toast-simple-dark.png" media="(prefers-color-scheme: dark)">
    <img src="toast-simple.png" alt="toast-simple">
  </picture>
  
  Toasts always have a close button. They emit the `signal@Toast::dismissed`
  signal when disappearing.
  
  `property@Toast:timeout` determines how long the toast stays on screen, while
  `property@Toast:priority` determines how it behaves if another toast is
  already being displayed.
  
  Toast titles use Pango markup by default, set `property@Toast:use-markup` to
  `FALSE` if this is unwanted.
  
  `property@Toast:custom-title` can be used to replace the title label with a
  custom widget.
  
  ## Actions
  
  Toasts can have one button on them, with a label and an attached
  [gio.action.Action].
  
  ```c
  AdwToast *toast = adw_toast_new (_("Toast with Action"));
  
  adw_toast_set_button_label (toast, _("_Example"));
  adw_toast_set_action_name (toast, "win.example");
  
  adw_toast_overlay_add_toast (overlay, toast);
  ```
  
  <picture>
    <source srcset="toast-action-dark.png" media="(prefers-color-scheme: dark)">
    <img src="toast-action.png" alt="toast-action">
  </picture>
  
  ## Modifying toasts
  
  Toasts can be modified after they have been shown. For this, an [adw.toast.Toast]
  reference must be kept around while the toast is visible.
  
  A common use case for this is using toasts as undo prompts that stack with
  each other, allowing to batch undo the last deleted items:
  
  ```c
  
  static void
  toast_undo_cb (GtkWidget  *sender,
                 const char *action,
                 GVariant   *param)
  {
    // Undo the deletion
  }
  
  static void
  dismissed_cb (MyWindow *self)
  {
    self->undo_toast = NULL;
  
    // Permanently delete the items
  }
  
  static void
  delete_item (MyWindow *self,
               MyItem   *item)
  {
    g_autofree char *title = NULL;
    int n_items;
  
    // Mark the item as waiting for deletion
    n_items = ... // The number of waiting items
  
    if (!self->undo_toast) {
      self->undo_toast = adw_toast_new_format (_("‘%s’ deleted"), ...);
  
      adw_toast_set_priority (self->undo_toast, ADW_TOAST_PRIORITY_HIGH);
      adw_toast_set_button_label (self->undo_toast, _("_Undo"));
      adw_toast_set_action_name (self->undo_toast, "toast.undo");
  
      g_signal_connect_swapped (self->undo_toast, "dismissed",
                                G_CALLBACK (dismissed_cb), self);
  
      adw_toast_overlay_add_toast (self->toast_overlay, self->undo_toast);
  
      return;
    }
  
    title =
      g_strdup_printf (ngettext ("<span font_features='tnum=1'>%d</span> item deleted",
                                 "<span font_features='tnum=1'>%d</span> items deleted",
                                 n_items), n_items);
  
    adw_toast_set_title (self->undo_toast, title);
  
    // Bump the toast timeout
    adw_toast_overlay_add_toast (self->toast_overlay, g_object_ref (self->undo_toast));
  }
  
  static void
  my_window_class_init (MyWindowClass *klass)
  {
    GtkWidgetClass *widget_class = GTK_WIDGET_CLASS (klass);
  
    gtk_widget_class_install_action (widget_class, "toast.undo", NULL, toast_undo_cb);
  }
  ```
  
  <picture>
    <source srcset="toast-undo-dark.png" media="(prefers-color-scheme: dark)">
    <img src="toast-undo.png" alt="toast-undo">
  </picture>
*/
class Toast : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_toast_get_type != &gidSymbolNotFound ? adw_toast_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.toast.Toast].
    
    The toast will use title as its title.
    
    title can be marked up with the Pango text markup language.
    Params:
      title =       the title to be displayed
    Returns:     the new created [adw.toast.Toast]
  */
  this(string title)
  {
    AdwToast* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = adw_toast_new(_title);
    this(_cretval, Yes.Take);
  }

  /**
      Dismisses self.
    
    Does nothing if self has already been dismissed, or hasn't been added to an
    `classToastOverlay`.
  */
  void dismiss()
  {
    adw_toast_dismiss(cast(AdwToast*)cPtr);
  }

  /**
      Gets the name of the associated action.
    Returns:     the action name
  */
  string getActionName()
  {
    const(char)* _cretval;
    _cretval = adw_toast_get_action_name(cast(AdwToast*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the parameter for action invocations.
    Returns:     the action target
  */
  glib.variant.VariantG getActionTargetValue()
  {
    VariantC* _cretval;
    _cretval = adw_toast_get_action_target_value(cast(AdwToast*)cPtr);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the label to show on the button.
    Returns:     the button label
  */
  string getButtonLabel()
  {
    const(char)* _cretval;
    _cretval = adw_toast_get_button_label(cast(AdwToast*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the custom title widget of self.
    Returns:     the custom title widget
  */
  gtk.widget.Widget getCustomTitle()
  {
    GtkWidget* _cretval;
    _cretval = adw_toast_get_custom_title(cast(AdwToast*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets priority for self.
    Returns:     the priority
  */
  adw.types.ToastPriority getPriority()
  {
    AdwToastPriority _cretval;
    _cretval = adw_toast_get_priority(cast(AdwToast*)cPtr);
    adw.types.ToastPriority _retval = cast(adw.types.ToastPriority)_cretval;
    return _retval;
  }

  /**
      Gets timeout for self.
    Returns:     the timeout
  */
  uint getTimeout()
  {
    uint _retval;
    _retval = adw_toast_get_timeout(cast(AdwToast*)cPtr);
    return _retval;
  }

  /**
      Gets the title that will be displayed on the toast.
    
    If a custom title has been set with [adw.toast.Toast.setCustomTitle]
    the return value will be null.
    Returns:     the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_toast_get_title(cast(AdwToast*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether to use Pango markup for the toast title.
    Returns:     whether the toast uses markup
  */
  bool getUseMarkup()
  {
    bool _retval;
    _retval = adw_toast_get_use_markup(cast(AdwToast*)cPtr);
    return _retval;
  }

  /**
      Sets the name of the associated action.
    
    It will be activated when clicking the button.
    
    See `propertyToast:action-target`.
    Params:
      actionName =       the action name
  */
  void setActionName(string actionName = null)
  {
    const(char)* _actionName = actionName.toCString(No.Alloc);
    adw_toast_set_action_name(cast(AdwToast*)cPtr, _actionName);
  }

  /**
      Sets the parameter for action invocations.
    
    If the action_target variant has a floating reference this function
    will sink it.
    Params:
      actionTarget =       the action target
  */
  void setActionTargetValue(glib.variant.VariantG actionTarget = null)
  {
    adw_toast_set_action_target_value(cast(AdwToast*)cPtr, actionTarget ? cast(VariantC*)actionTarget.cPtr(No.Dup) : null);
  }

  /**
      Sets the label to show on the button.
    
    Underlines in the button text can be used to indicate a mnemonic.
    
    If set to `NULL`, the button won't be shown.
    
    See `propertyToast:action-name`.
    Params:
      buttonLabel =       a button label
  */
  void setButtonLabel(string buttonLabel = null)
  {
    const(char)* _buttonLabel = buttonLabel.toCString(No.Alloc);
    adw_toast_set_button_label(cast(AdwToast*)cPtr, _buttonLabel);
  }

  /**
      Sets the custom title widget of self.
    
    It will be displayed instead of the title if set. In this case,
    `propertyToast:title` is ignored.
    
    Setting a custom title will unset `propertyToast:title`.
    Params:
      widget =       the custom title widget
  */
  void setCustomTitle(gtk.widget.Widget widget = null)
  {
    adw_toast_set_custom_title(cast(AdwToast*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }

  /**
      Sets the action name and its parameter.
    
    detailed_action_name is a string in the format accepted by
    [gio.action.Action.parseDetailedName].
    Params:
      detailedActionName =       the detailed action name
  */
  void setDetailedActionName(string detailedActionName = null)
  {
    const(char)* _detailedActionName = detailedActionName.toCString(No.Alloc);
    adw_toast_set_detailed_action_name(cast(AdwToast*)cPtr, _detailedActionName);
  }

  /**
      Sets priority for self.
    
    Priority controls how the toast behaves when another toast is already
    being displayed.
    
    If priority is [adw.types.ToastPriority.Normal], the toast will be queued.
    
    If priority is [adw.types.ToastPriority.High], the toast will be displayed
    immediately, pushing the previous toast into the queue instead.
    Params:
      priority =       the priority
  */
  void setPriority(adw.types.ToastPriority priority)
  {
    adw_toast_set_priority(cast(AdwToast*)cPtr, priority);
  }

  /**
      Sets timeout for self.
    
    If timeout is 0, the toast is displayed indefinitely until manually
    dismissed.
    
    Toasts cannot disappear while being hovered, pressed (on touchscreen), or
    have keyboard focus inside them.
    Params:
      timeout =       the timeout
  */
  void setTimeout(uint timeout)
  {
    adw_toast_set_timeout(cast(AdwToast*)cPtr, timeout);
  }

  /**
      Sets the title that will be displayed on the toast.
    
    The title can be marked up with the Pango text markup language.
    
    Setting a title will unset `propertyToast:custom-title`.
    
    If `propertyToast:custom-title` is set, it will be used instead.
    Params:
      title =       a title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_toast_set_title(cast(AdwToast*)cPtr, _title);
  }

  /**
      Whether to use Pango markup for the toast title.
    
    See also `funcPango.parse_markup`.
    Params:
      useMarkup =       whether to use markup
  */
  void setUseMarkup(bool useMarkup)
  {
    adw_toast_set_use_markup(cast(AdwToast*)cPtr, useMarkup);
  }

  /**
      Emitted after the button has been clicked.
    
    It can be used as an alternative to setting an action.
  
    ## Parameters
    $(LIST
      * $(B toast) the instance the signal is connected to
    )
  */
  alias ButtonClickedCallbackDlg = void delegate(adw.toast.Toast toast);

  /** ditto */
  alias ButtonClickedCallbackFunc = void function(adw.toast.Toast toast);

  /**
    Connect to ButtonClicked signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectButtonClicked(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ButtonClickedCallbackDlg) || is(T : ButtonClickedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto toast = getVal!(adw.toast.Toast)(_paramVals);
      _dClosure.dlg(toast);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("button-clicked", closure, after);
  }

  /**
      Emitted when the toast has been dismissed.
  
    ## Parameters
    $(LIST
      * $(B toast) the instance the signal is connected to
    )
  */
  alias DismissedCallbackDlg = void delegate(adw.toast.Toast toast);

  /** ditto */
  alias DismissedCallbackFunc = void function(adw.toast.Toast toast);

  /**
    Connect to Dismissed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDismissed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DismissedCallbackDlg) || is(T : DismissedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto toast = getVal!(adw.toast.Toast)(_paramVals);
      _dClosure.dlg(toast);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("dismissed", closure, after);
  }
}
