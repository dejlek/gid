module gtk.alert_dialog;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    A [gtk.alert_dialog.AlertDialog] object collects the arguments that
  are needed to present a message to the user.
  
  The message is shown with the [gtk.alert_dialog.AlertDialog.choose]
  function. This API follows the GIO async pattern, and the result can
  be obtained by calling [gtk.alert_dialog.AlertDialog.chooseFinish].
  
  If you don't need to wait for a button to be clicked, you can use
  [gtk.alert_dialog.AlertDialog.show].
*/
class AlertDialog : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_alert_dialog_get_type != &gidSymbolNotFound ? gtk_alert_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      This function shows the alert to the user.
    
    The callback will be called when the alert is dismissed.
    It should call [gtk.alert_dialog.AlertDialog.chooseFinish]
    to obtain the result.
    
    It is ok to pass `NULL` for the callback if the alert
    does not have more than one button. A simpler API for
    this case is [gtk.alert_dialog.AlertDialog.show].
    Params:
      parent =       the parent [gtk.window.Window]
      cancellable =       a [gio.cancellable.Cancellable] to cancel the operation
      callback =       a callback to call when the operation is complete
  */
  void choose(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_alert_dialog_choose(cast(GtkAlertDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.alert_dialog.AlertDialog.choose] call
    and returns the index of the button that was clicked.
    Params:
      result =       a [gio.async_result.AsyncResult]
    Returns:     the index of the button that was clicked, or -1 if
        the dialog was cancelled and `propertyGtk.AlertDialog:cancel-button`
        is not set
  */
  int chooseFinish(gio.async_result.AsyncResult result)
  {
    int _retval;
    GError *_err;
    _retval = gtk_alert_dialog_choose_finish(cast(GtkAlertDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Returns the button labels for the alert.
    Returns:     the button labels
  */
  string[] getButtons()
  {
    const(char*)* _cretval;
    _cretval = gtk_alert_dialog_get_buttons(cast(GtkAlertDialog*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.free);
    }
    return _retval;
  }

  /**
      Returns the index of the cancel button.
    Returns:     the index of the cancel button, or -1
  */
  int getCancelButton()
  {
    int _retval;
    _retval = gtk_alert_dialog_get_cancel_button(cast(GtkAlertDialog*)cPtr);
    return _retval;
  }

  /**
      Returns the index of the default button.
    Returns:     the index of the default button, or -1
  */
  int getDefaultButton()
  {
    int _retval;
    _retval = gtk_alert_dialog_get_default_button(cast(GtkAlertDialog*)cPtr);
    return _retval;
  }

  /**
      Returns the detail text that will be shown in the alert.
    Returns:     the detail text
  */
  string getDetail()
  {
    const(char)* _cretval;
    _cretval = gtk_alert_dialog_get_detail(cast(GtkAlertDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns the message that will be shown in the alert.
    Returns:     the message
  */
  string getMessage()
  {
    const(char)* _cretval;
    _cretval = gtk_alert_dialog_get_message(cast(GtkAlertDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns whether the alert blocks interaction
    with the parent window while it is presented.
    Returns:     `TRUE` if the alert is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_alert_dialog_get_modal(cast(GtkAlertDialog*)cPtr);
    return _retval;
  }

  /**
      Sets the button labels for the alert.
    Params:
      labels =       the new button labels
  */
  void setButtons(string[] labels)
  {
    char*[] _tmplabels;
    foreach (s; labels)
      _tmplabels ~= s.toCString(No.alloc);
    _tmplabels ~= null;
    const(char*)* _labels = _tmplabels.ptr;
    gtk_alert_dialog_set_buttons(cast(GtkAlertDialog*)cPtr, _labels);
  }

  /**
      Sets the index of the cancel button.
    
    See `propertyGtk.AlertDialog:cancel-button` for
    details of how this value is used.
    Params:
      button =       the new cancel button
  */
  void setCancelButton(int button)
  {
    gtk_alert_dialog_set_cancel_button(cast(GtkAlertDialog*)cPtr, button);
  }

  /**
      Sets the index of the default button.
    
    See `propertyGtk.AlertDialog:default-button` for
    details of how this value is used.
    Params:
      button =       the new default button
  */
  void setDefaultButton(int button)
  {
    gtk_alert_dialog_set_default_button(cast(GtkAlertDialog*)cPtr, button);
  }

  /**
      Sets the detail text that will be shown in the alert.
    Params:
      detail =       the new detail text
  */
  void setDetail(string detail)
  {
    const(char)* _detail = detail.toCString(No.alloc);
    gtk_alert_dialog_set_detail(cast(GtkAlertDialog*)cPtr, _detail);
  }

  /**
      Sets the message that will be shown in the alert.
    Params:
      message =       the new message
  */
  void setMessage(string message)
  {
    const(char)* _message = message.toCString(No.alloc);
    gtk_alert_dialog_set_message(cast(GtkAlertDialog*)cPtr, _message);
  }

  /**
      Sets whether the alert blocks interaction
    with the parent window while it is presented.
    Params:
      modal =       the new value
  */
  void setModal(bool modal)
  {
    gtk_alert_dialog_set_modal(cast(GtkAlertDialog*)cPtr, modal);
  }

  /**
      Show the alert to the user.
    
    This function is a simple version of [gtk.alert_dialog.AlertDialog.choose]
    intended for dialogs with a single button.
    If you want to cancel the dialog or if the alert has more than one button,
    you should use that function instead and provide it with a #GCancellable or
    callback respectively.
    Params:
      parent =       the parent [gtk.window.Window]
  */
  void show(gtk.window.Window parent = null)
  {
    gtk_alert_dialog_show(cast(GtkAlertDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null);
  }
}
