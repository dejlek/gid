module gtk.alert_dialog;

import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
 * A `GtkAlertDialog` object collects the arguments that
 * are needed to present a message to the user.
 * The message is shown with the [Gtk.AlertDialog.choose]
 * function. This API follows the GIO async pattern, and the result can
 * be obtained by calling [Gtk.AlertDialog.chooseFinish].
 * If you don't need to wait for a button to be clicked, you can use
 * [Gtk.AlertDialog.show].
 */
class AlertDialog : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_alert_dialog_get_type != &gidSymbolNotFound ? gtk_alert_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * This function shows the alert to the user.
   * The callback will be called when the alert is dismissed.
   * It should call [Gtk.AlertDialog.chooseFinish]
   * to obtain the result.
   * It is ok to pass `NULL` for the callback if the alert
   * does not have more than one button. A simpler API for
   * this case is [Gtk.AlertDialog.show].
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void choose(Window parent, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_alert_dialog_choose(cast(GtkAlertDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [Gtk.AlertDialog.choose] call
   * and returns the index of the button that was clicked.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: the index of the button that was clicked, or -1 if
   *   the dialog was cancelled and propertyGtk.AlertDialog:cancel-button
   *   is not set
   */
  int chooseFinish(AsyncResult result)
  {
    int _retval;
    GError *_err;
    _retval = gtk_alert_dialog_choose_finish(cast(GtkAlertDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Returns the button labels for the alert.
   * Returns: the button labels
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
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
   * Returns the index of the cancel button.
   * Returns: the index of the cancel button, or -1
   */
  int getCancelButton()
  {
    int _retval;
    _retval = gtk_alert_dialog_get_cancel_button(cast(GtkAlertDialog*)cPtr);
    return _retval;
  }

  /**
   * Returns the index of the default button.
   * Returns: the index of the default button, or -1
   */
  int getDefaultButton()
  {
    int _retval;
    _retval = gtk_alert_dialog_get_default_button(cast(GtkAlertDialog*)cPtr);
    return _retval;
  }

  /**
   * Returns the detail text that will be shown in the alert.
   * Returns: the detail text
   */
  string getDetail()
  {
    const(char)* _cretval;
    _cretval = gtk_alert_dialog_get_detail(cast(GtkAlertDialog*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns the message that will be shown in the alert.
   * Returns: the message
   */
  string getMessage()
  {
    const(char)* _cretval;
    _cretval = gtk_alert_dialog_get_message(cast(GtkAlertDialog*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns whether the alert blocks interaction
   * with the parent window while it is presented.
   * Returns: `TRUE` if the alert is modal
   */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_alert_dialog_get_modal(cast(GtkAlertDialog*)cPtr);
    return _retval;
  }

  /**
   * Sets the button labels for the alert.
   * Params:
   *   labels = the new button labels
   */
  void setButtons(string[] labels)
  {
    char*[] _tmplabels;
    foreach (s; labels)
      _tmplabels ~= s.toCString(No.Alloc);
    _tmplabels ~= null;
    const(char*)* _labels = _tmplabels.ptr;
    gtk_alert_dialog_set_buttons(cast(GtkAlertDialog*)cPtr, _labels);
  }

  /**
   * Sets the index of the cancel button.
   * See propertyGtk.AlertDialog:cancel-button for
   * details of how this value is used.
   * Params:
   *   button = the new cancel button
   */
  void setCancelButton(int button)
  {
    gtk_alert_dialog_set_cancel_button(cast(GtkAlertDialog*)cPtr, button);
  }

  /**
   * Sets the index of the default button.
   * See propertyGtk.AlertDialog:default-button for
   * details of how this value is used.
   * Params:
   *   button = the new default button
   */
  void setDefaultButton(int button)
  {
    gtk_alert_dialog_set_default_button(cast(GtkAlertDialog*)cPtr, button);
  }

  /**
   * Sets the detail text that will be shown in the alert.
   * Params:
   *   detail = the new detail text
   */
  void setDetail(string detail)
  {
    const(char)* _detail = detail.toCString(No.Alloc);
    gtk_alert_dialog_set_detail(cast(GtkAlertDialog*)cPtr, _detail);
  }

  /**
   * Sets the message that will be shown in the alert.
   * Params:
   *   message = the new message
   */
  void setMessage(string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    gtk_alert_dialog_set_message(cast(GtkAlertDialog*)cPtr, _message);
  }

  /**
   * Sets whether the alert blocks interaction
   * with the parent window while it is presented.
   * Params:
   *   modal = the new value
   */
  void setModal(bool modal)
  {
    gtk_alert_dialog_set_modal(cast(GtkAlertDialog*)cPtr, modal);
  }

  /**
   * Show the alert to the user.
   * This function is a simple version of [Gtk.AlertDialog.choose]
   * intended for dialogs with a single button.
   * If you want to cancel the dialog or if the alert has more than one button,
   * you should use that function instead and provide it with a #GCancellable or
   * callback respectively.
   * Params:
   *   parent = the parent `GtkWindow`
   */
  void show(Window parent)
  {
    gtk_alert_dialog_show(cast(GtkAlertDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
  }
}
