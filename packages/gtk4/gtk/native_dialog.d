module gtk.native_dialog;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    Native dialogs are platform dialogs that don't use [gtk.dialog.Dialog].
  
  They are used in order to integrate better with a platform, by
  looking the same as other native applications and supporting
  platform specific features.
  
  The [gtk.dialog.Dialog] functions cannot be used on such objects,
  but we need a similar API in order to drive them. The [gtk.native_dialog.NativeDialog]
  object is an API that allows you to do this. It allows you to set
  various common properties on the dialog, as well as show and hide
  it and get a [gtk.native_dialog.NativeDialog.response] signal when the user
  finished with the dialog.
  
  Note that unlike [gtk.dialog.Dialog], [gtk.native_dialog.NativeDialog] objects are not
  toplevel widgets, and GTK does not keep them alive. It is your
  responsibility to keep a reference until you are done with the
  object.
*/
class NativeDialog : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
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
    to other objects.
    
    If it is visible it will be hidden and any underlying window system
    resources will be destroyed.
    
    Note that this does not release any reference to the object (as opposed
    to destroying a [gtk.window.Window]) because there is no reference from the
    windowing system to the [gtk.native_dialog.NativeDialog].
  */
  void destroy()
  {
    gtk_native_dialog_destroy(cast(GtkNativeDialog*)cPtr);
  }

  /**
      Returns whether the dialog is modal.
    Returns:     true if the dialog is set to be modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_native_dialog_get_modal(cast(GtkNativeDialog*)cPtr);
    return _retval;
  }

  /**
      Gets the title of the [gtk.native_dialog.NativeDialog].
    Returns:     the title of the dialog, or null if none has
         been set explicitly. The returned string is owned by the widget
         and must not be modified or freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_native_dialog_get_title(cast(GtkNativeDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Fetches the transient parent for this window.
    Returns:     the transient parent for this window,
        or null if no transient parent has been set.
  */
  gtk.window.Window getTransientFor()
  {
    GtkWindow* _cretval;
    _cretval = gtk_native_dialog_get_transient_for(cast(GtkNativeDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
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
      Hides the dialog if it is visible, aborting any interaction.
    
    Once this is called the [gtk.native_dialog.NativeDialog.response] signal
    will *not* be emitted until after the next call to
    [gtk.native_dialog.NativeDialog.show].
    
    If the dialog is not visible this does nothing.
  */
  void hide()
  {
    gtk_native_dialog_hide(cast(GtkNativeDialog*)cPtr);
  }

  /**
      Sets a dialog modal or non-modal.
    
    Modal dialogs prevent interaction with other windows in the same
    application. To keep modal dialogs on top of main application
    windows, use [gtk.native_dialog.NativeDialog.setTransientFor] to make
    the dialog transient for the parent; most window managers will
    then disallow lowering the dialog below the parent.
    Params:
      modal =       whether the window is modal
  */
  void setModal(bool modal)
  {
    gtk_native_dialog_set_modal(cast(GtkNativeDialog*)cPtr, modal);
  }

  /**
      Sets the title of the `GtkNativeDialog.`
    Params:
      title =       title of the dialog
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_native_dialog_set_title(cast(GtkNativeDialog*)cPtr, _title);
  }

  /**
      Dialog windows should be set transient for the main application
    window they were spawned from.
    
    This allows window managers to e.g. keep the dialog on top of the
    main window, or center the dialog over the main window.
    
    Passing null for parent unsets the current transient window.
    Params:
      parent =       parent window
  */
  void setTransientFor(gtk.window.Window parent = null)
  {
    gtk_native_dialog_set_transient_for(cast(GtkNativeDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
  }

  /**
      Shows the dialog on the display.
    
    When the user accepts the state of the dialog the dialog will
    be automatically hidden and the [gtk.native_dialog.NativeDialog.response]
    signal will be emitted.
    
    Multiple calls while the dialog is visible will be ignored.
  */
  void show()
  {
    gtk_native_dialog_show(cast(GtkNativeDialog*)cPtr);
  }

  /**
      Emitted when the user responds to the dialog.
    
    When this is called the dialog has been hidden.
    
    If you call [gtk.native_dialog.NativeDialog.hide] before the user
    responds to the dialog this signal will not be emitted.
  
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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectResponse(T)(T callback, Flag!"After" after = No.After)
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
