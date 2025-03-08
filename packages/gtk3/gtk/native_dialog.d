module gtk.native_dialog;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    Native dialogs are platform dialogs that don't use #GtkDialog or
  #GtkWindow. They are used in order to integrate better with a
  platform, by looking the same as other native applications and
  supporting platform specific features.
  
  The #GtkDialog functions cannot be used on such objects, but we
  need a similar API in order to drive them. The #GtkNativeDialog
  object is an API that allows you to do this. It allows you to set
  various common properties on the dialog, as well as show and hide
  it and get a #GtkNativeDialog::response signal when the user finished
  with the dialog.
  
  There is also a [gtk.native_dialog.NativeDialog.run] helper that makes it easy
  to run any native dialog in a modal way with a recursive mainloop,
  similar to [gtk.dialog.Dialog.run].
*/
class NativeDialog : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_native_dialog_get_type != &gidSymbolNotFound ? gtk_native_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Destroys a dialog.
    
    When a dialog is destroyed, it will break any references it holds
    to other objects. If it is visible it will be hidden and any underlying
    window system resources will be destroyed.
    
    Note that this does not release any reference to the object (as opposed to
    destroying a GtkWindow) because there is no reference from the windowing
    system to the #GtkNativeDialog.
  */
  void destroy()
  {
    gtk_native_dialog_destroy(cast(GtkNativeDialog*)cPtr);
  }

  /**
      Returns whether the dialog is modal. See [gtk.native_dialog.NativeDialog.setModal].
    Returns:     true if the dialog is set to be modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_native_dialog_get_modal(cast(GtkNativeDialog*)cPtr);
    return _retval;
  }

  /**
      Gets the title of the #GtkNativeDialog.
    Returns:     the title of the dialog, or null if none has
         been set explicitly. The returned string is owned by the widget
         and must not be modified or freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_native_dialog_get_title(cast(GtkNativeDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Fetches the transient parent for this window. See
    [gtk.native_dialog.NativeDialog.setTransientFor].
    Returns:     the transient parent for this window,
      or null if no transient parent has been set.
  */
  gtk.window.Window getTransientFor()
  {
    GtkWindow* _cretval;
    _cretval = gtk_native_dialog_get_transient_for(cast(GtkNativeDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.take);
    return _retval;
  }

  /**
      Determines whether the dialog is visible.
    Returns:     true if the dialog is visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = gtk_native_dialog_get_visible(cast(GtkNativeDialog*)cPtr);
    return _retval;
  }

  /**
      Hides the dialog if it is visilbe, aborting any interaction. Once this
    is called the  #GtkNativeDialog::response signal will not be emitted
    until after the next call to [gtk.native_dialog.NativeDialog.show].
    
    If the dialog is not visible this does nothing.
  */
  void hide()
  {
    gtk_native_dialog_hide(cast(GtkNativeDialog*)cPtr);
  }

  /**
      Blocks in a recursive main loop until self emits the
    #GtkNativeDialog::response signal. It then returns the response ID
    from the ::response signal emission.
    
    Before entering the recursive main loop, [gtk.native_dialog.NativeDialog.run]
    calls [gtk.native_dialog.NativeDialog.show] on the dialog for you.
    
    After [gtk.native_dialog.NativeDialog.run] returns, then dialog will be hidden.
    
    Typical usage of this function might be:
    ```c
      gint result = gtk_native_dialog_run (GTK_NATIVE_DIALOG (dialog));
      switch (result)
        {
          case GTK_RESPONSE_ACCEPT:
             do_application_specific_something ();
             break;
          default:
             do_nothing_since_dialog_was_cancelled ();
             break;
        }
      g_object_unref (dialog);
    ```
    
    Note that even though the recursive main loop gives the effect of a
    modal dialog (it prevents the user from interacting with other
    windows in the same window group while the dialog is run), callbacks
    such as timeouts, IO channel watches, DND drops, etc, will
    be triggered during a [gtk.native_dialog.NativeDialog.run] call.
    Returns:     response ID
  */
  int run()
  {
    int _retval;
    _retval = gtk_native_dialog_run(cast(GtkNativeDialog*)cPtr);
    return _retval;
  }

  /**
      Sets a dialog modal or non-modal. Modal dialogs prevent interaction
    with other windows in the same application. To keep modal dialogs
    on top of main application windows, use
    [gtk.native_dialog.NativeDialog.setTransientFor] to make the dialog transient for the
    parent; most [window managers][gtk-X11-arch]
    will then disallow lowering the dialog below the parent.
    Params:
      modal =       whether the window is modal
  */
  void setModal(bool modal)
  {
    gtk_native_dialog_set_modal(cast(GtkNativeDialog*)cPtr, modal);
  }

  /**
      Sets the title of the #GtkNativeDialog.
    Params:
      title =       title of the dialog
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.alloc);
    gtk_native_dialog_set_title(cast(GtkNativeDialog*)cPtr, _title);
  }

  /**
      Dialog windows should be set transient for the main application
    window they were spawned from. This allows
    [window managers][gtk-X11-arch] to e.g. keep the
    dialog on top of the main window, or center the dialog over the
    main window.
    
    Passing null for parent unsets the current transient window.
    Params:
      parent =       parent window, or null
  */
  void setTransientFor(gtk.window.Window parent = null)
  {
    gtk_native_dialog_set_transient_for(cast(GtkNativeDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null);
  }

  /**
      Shows the dialog on the display, allowing the user to interact with
    it. When the user accepts the state of the dialog the dialog will
    be automatically hidden and the #GtkNativeDialog::response signal
    will be emitted.
    
    Multiple calls while the dialog is visible will be ignored.
  */
  void show()
  {
    gtk_native_dialog_show(cast(GtkNativeDialog*)cPtr);
  }

  /**
      Emitted when the user responds to the dialog.
    
    When this is called the dialog has been hidden.
    
    If you call [gtk.native_dialog.NativeDialog.hide] before the user responds to
    the dialog this signal will not be emitted.
  
    ## Parameters
    $(LIST
      * $(B responseId)       the response ID
      * $(B nativeDialog) the instance the signal is connected to
    )
  */
  alias ResponseCallbackDlg = void delegate(int responseId, gtk.native_dialog.NativeDialog nativeDialog);

  /** ditto */
  alias ResponseCallbackFunc = void function(int responseId, gtk.native_dialog.NativeDialog nativeDialog);

  /**
    Connect to Response signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectResponse(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ResponseCallbackDlg) || is(T : ResponseCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto nativeDialog = getVal!(gtk.native_dialog.NativeDialog)(_paramVals);
      auto responseId = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(responseId, nativeDialog);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("response", closure, after);
  }
}
