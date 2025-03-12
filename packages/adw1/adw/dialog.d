module adw.dialog;

import adw.breakpoint;
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
    An adaptive dialog container.
  
  <picture>
    <source srcset="dialog-floating-dark.png" media="(prefers-color-scheme: dark)">
    <img src="dialog-floating.png" alt="dialog-floating">
  </picture>
  <picture>
    <source srcset="dialog-bottom-dark.png" media="(prefers-color-scheme: dark)">
    <img src="dialog-bottom.png" alt="dialog-bottom">
  </picture>
  
  [adw.dialog.Dialog] is similar to a window, but is shown within another window. It
  can be used with `class@Window` and `class@ApplicationWindow`, use
  [adw.dialog.Dialog.present] to show it.
  
  [adw.dialog.Dialog] is not resizable. Use the `property@Dialog:content-width` and
  `property@Dialog:content-height` properties to set its size, or set
  `property@Dialog:follows-content-size` to `TRUE` to make the dialog track the
  content's size as it changes. [adw.dialog.Dialog] can never be larger than its parent
  window.
  
  [adw.dialog.Dialog] can be presented as a centered floating window or a bottom sheet.
  By default it's automatic depending on the available size.
  `property@Dialog:presentation-mode` can be used to change that.
  
  [adw.dialog.Dialog] can be closed via [adw.dialog.Dialog.close].
  
  When presented as a bottom sheet, [adw.dialog.Dialog] can also be closed via swiping
  it down.
  
  The `property@Dialog:can-close` can be used to prevent closing. In that case,
  `signal@Dialog::close-attempt` gets emitted instead.
  
  Use [adw.dialog.Dialog.forceClose] to close the dialog even when `can-close` is set to
  `FALSE`.
  
  ## Header Bar Integration
  
  When placed inside an [adw.dialog.Dialog], `class@HeaderBar` will display the dialog
  title instead of window title. It will also adjust the decoration layout to
  ensure it always has a close button and nothing else. Set
  `property@HeaderBar:show-start-title-buttons` and
  `property@HeaderBar:show-end-title-buttons` to `FALSE` to remove it if it's
  unwanted.
  
  ## Breakpoints
  
  [adw.dialog.Dialog] can be used with `class@Breakpoint` the same way as
  `class@BreakpointBin`. Refer to that widget's documentation for details.
  
  Like [adw.breakpoint_bin.BreakpointBin], if breakpoints are used, [adw.dialog.Dialog] doesn't have a
  minimum size, and `property@Gtk.Widget:width-request` and
  `property@Gtk.Widget:height-request` properties must be set manually.
*/
class Dialog : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_dialog_get_type != &gidSymbolNotFound ? adw_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Dialog self()
  {
    return this;
  }

  /**
      Creates a new [adw.dialog.Dialog].
    Returns:     the new created [adw.dialog.Dialog]
  */
  this()
  {
    AdwDialog* _cretval;
    _cretval = adw_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Adds breakpoint to self.
    Params:
      breakpoint =       the breakpoint to add
  */
  void addBreakpoint(adw.breakpoint.Breakpoint breakpoint)
  {
    adw_dialog_add_breakpoint(cast(AdwDialog*)cPtr, breakpoint ? cast(AdwBreakpoint*)breakpoint.cPtr(Yes.Dup) : null);
  }

  /**
      Attempts to close self.
    
    If the `propertyDialog:can-close` property is set to `FALSE`, the
    `signalDialog::close-attempt` signal is emitted.
    
    See also: [adw.dialog.Dialog.forceClose].
    Returns:     whether self was successfully closed
  */
  bool close()
  {
    bool _retval;
    _retval = adw_dialog_close(cast(AdwDialog*)cPtr);
    return _retval;
  }

  /**
      Closes self.
    
    Unlike [adw.dialog.Dialog.close], it succeeds even if `propertyDialog:can-close`
    is set to `FALSE`.
  */
  void forceClose()
  {
    adw_dialog_force_close(cast(AdwDialog*)cPtr);
  }

  /**
      Gets whether self can be closed.
    Returns:     whether the dialog can be closed
  */
  bool getCanClose()
  {
    bool _retval;
    _retval = adw_dialog_get_can_close(cast(AdwDialog*)cPtr);
    return _retval;
  }

  /**
      Gets the child widget of self.
    Returns:     the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_dialog_get_child(cast(AdwDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the height of the dialog's contents.
    Returns:     the content height
  */
  int getContentHeight()
  {
    int _retval;
    _retval = adw_dialog_get_content_height(cast(AdwDialog*)cPtr);
    return _retval;
  }

  /**
      Gets the width of the dialog's contents.
    Returns:     the content width
  */
  int getContentWidth()
  {
    int _retval;
    _retval = adw_dialog_get_content_width(cast(AdwDialog*)cPtr);
    return _retval;
  }

  /**
      Gets the current breakpoint.
    Returns:     the current breakpoint
  */
  adw.breakpoint.Breakpoint getCurrentBreakpoint()
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_dialog_get_current_breakpoint(cast(AdwDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.breakpoint.Breakpoint)(cast(AdwBreakpoint*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default widget for self.
    Returns:     the default widget
  */
  gtk.widget.Widget getDefaultWidget()
  {
    GtkWidget* _cretval;
    _cretval = adw_dialog_get_default_widget(cast(AdwDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the focus widget for self.
    Returns:     the focus widget
  */
  gtk.widget.Widget getFocus()
  {
    GtkWidget* _cretval;
    _cretval = adw_dialog_get_focus(cast(AdwDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to size content of self automatically.
    Returns:     whether to size content automatically
  */
  bool getFollowsContentSize()
  {
    bool _retval;
    _retval = adw_dialog_get_follows_content_size(cast(AdwDialog*)cPtr);
    return _retval;
  }

  /**
      Gets presentation mode for self.
    Returns:     the presentation mode
  */
  adw.types.DialogPresentationMode getPresentationMode()
  {
    AdwDialogPresentationMode _cretval;
    _cretval = adw_dialog_get_presentation_mode(cast(AdwDialog*)cPtr);
    adw.types.DialogPresentationMode _retval = cast(adw.types.DialogPresentationMode)_cretval;
    return _retval;
  }

  /**
      Gets the title of self.
    Returns:     the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_dialog_get_title(cast(AdwDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Presents self within parent's window.
    
    If self is already shown, raises it to the top instead.
    
    If the window is an `classWindow` or `classApplicationWindow`, the dialog
    will be shown within it. Otherwise, it will be a separate window.
    Params:
      parent =       a widget within the toplevel
  */
  void present(gtk.widget.Widget parent = null)
  {
    adw_dialog_present(cast(AdwDialog*)cPtr, parent ? cast(GtkWidget*)parent.cPtr(No.Dup) : null);
  }

  /**
      Sets whether self can be closed.
    
    If set to `FALSE`, the close button, shortcuts and
    [adw.dialog.Dialog.close] will result in `signalDialog::close-attempt` being
    emitted instead, and bottom sheet close swipe will be disabled.
    [adw.dialog.Dialog.forceClose] still works.
    Params:
      canClose =       whether to allow closing
  */
  void setCanClose(bool canClose)
  {
    adw_dialog_set_can_close(cast(AdwDialog*)cPtr, canClose);
  }

  /**
      Sets the child widget of self.
    Params:
      child =       the child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_dialog_set_child(cast(AdwDialog*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
  }

  /**
      Sets the height of the dialog's contents.
    
    Set it to -1 to reset it to the content's natural height.
    
    See also: `propertyGtk.Window:default-height`
    Params:
      contentHeight =       the content height
  */
  void setContentHeight(int contentHeight)
  {
    adw_dialog_set_content_height(cast(AdwDialog*)cPtr, contentHeight);
  }

  /**
      Sets the width of the dialog's contents.
    
    Set it to -1 to reset it to the content's natural width.
    
    See also: `propertyGtk.Window:default-width`
    Params:
      contentWidth =       the content width
  */
  void setContentWidth(int contentWidth)
  {
    adw_dialog_set_content_width(cast(AdwDialog*)cPtr, contentWidth);
  }

  /**
      Sets the default widget for self.
    
    It's activated when the user presses Enter.
    Params:
      defaultWidget =       the default widget
  */
  void setDefaultWidget(gtk.widget.Widget defaultWidget = null)
  {
    adw_dialog_set_default_widget(cast(AdwDialog*)cPtr, defaultWidget ? cast(GtkWidget*)defaultWidget.cPtr(No.Dup) : null);
  }

  /**
      Sets the focus widget for self.
    
    If focus is not the current focus widget, and is focusable, sets it as the
    focus widget for the dialog.
    
    If focus is `NULL`, unsets the focus widget for this dialog. To set the focus
    to a particular widget in the dialog, it is usually more convenient to use
    [gtk.widget.Widget.grabFocus] instead of this function.
    Params:
      focus =       the focus widget
  */
  void setFocus(gtk.widget.Widget focus = null)
  {
    adw_dialog_set_focus(cast(AdwDialog*)cPtr, focus ? cast(GtkWidget*)focus.cPtr(No.Dup) : null);
  }

  /**
      Sets whether to size content of self automatically.
    
    If set to `TRUE`, always use the content's natural size instead of
    `propertyDialog:content-width` and `propertyDialog:content-height`. If
    the content resizes, the dialog will immediately resize as well.
    
    See also: [gtk.window.Window.gboolean]
    Params:
      followsContentSize =       whether to size content automatically
  */
  void setFollowsContentSize(bool followsContentSize)
  {
    adw_dialog_set_follows_content_size(cast(AdwDialog*)cPtr, followsContentSize);
  }

  /**
      Sets presentation mode for self.
    
    When set to [adw.types.DialogPresentationMode.Auto], the dialog appears as a bottom sheet when the
    following condition is met: `max-width: 450px or max-height: 360px`, and as a
    floating window otherwise.
    
    Set it to [adw.types.DialogPresentationMode.Floating] or [adw.types.DialogPresentationMode.BottomSheet] to always
    present it a floating window or a bottom sheet respectively, regardless of
    available size.
    
    Presentation mode does nothing for dialogs presented as a window.
    Params:
      presentationMode =       the new presentation mode
  */
  void setPresentationMode(adw.types.DialogPresentationMode presentationMode)
  {
    adw_dialog_set_presentation_mode(cast(AdwDialog*)cPtr, presentationMode);
  }

  /**
      Sets the title of self.
    Params:
      title =       the new title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_dialog_set_title(cast(AdwDialog*)cPtr, _title);
  }

  /**
      Emitted when the close button or shortcut is used, or
    [adw.dialog.Dialog.close] is called while `propertyDialog:can-close` is set to
    `FALSE`.
  
    ## Parameters
    $(LIST
      * $(B dialog) the instance the signal is connected to
    )
  */
  alias CloseAttemptCallbackDlg = void delegate(adw.dialog.Dialog dialog);

  /** ditto */
  alias CloseAttemptCallbackFunc = void function(adw.dialog.Dialog dialog);

  /**
    Connect to CloseAttempt signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCloseAttempt(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CloseAttemptCallbackDlg) || is(T : CloseAttemptCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dialog = getVal!(adw.dialog.Dialog)(_paramVals);
      _dClosure.dlg(dialog);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-attempt", closure, after);
  }

  /**
      Emitted when the dialog is successfully closed.
  
    ## Parameters
    $(LIST
      * $(B dialog) the instance the signal is connected to
    )
  */
  alias ClosedCallbackDlg = void delegate(adw.dialog.Dialog dialog);

  /** ditto */
  alias ClosedCallbackFunc = void function(adw.dialog.Dialog dialog);

  /**
    Connect to Closed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClosedCallbackDlg) || is(T : ClosedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dialog = getVal!(adw.dialog.Dialog)(_paramVals);
      _dClosure.dlg(dialog);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }
}
