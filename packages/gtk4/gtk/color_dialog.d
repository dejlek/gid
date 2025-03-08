module gtk.color_dialog;

import gdk.rgba;
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
    A [gtk.color_dialog.ColorDialog] object collects the arguments that
  are needed to present a color chooser dialog to the
  user, such as a title for the dialog and whether it
  should be modal.
  
  The dialog is shown with the [gtk.color_dialog.ColorDialog.chooseRgba]
  function. This API follows the GIO async pattern, and the
  result can be obtained by calling
  [gtk.color_dialog.ColorDialog.chooseRgbaFinish].
  
  See [gtk.color_dialog_button.ColorDialogButton] for a convenient control
  that uses [gtk.color_dialog.ColorDialog] and presents the results.
*/
class ColorDialog : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_dialog_get_type != &gidSymbolNotFound ? gtk_color_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.color_dialog.ColorDialog] object.
    Returns:     the new [gtk.color_dialog.ColorDialog]
  */
  this()
  {
    GtkColorDialog* _cretval;
    _cretval = gtk_color_dialog_new();
    this(_cretval, Yes.take);
  }

  /**
      This function initiates a color choice operation by
    presenting a color chooser dialog to the user.
    
    The callback will be called when the dialog is dismissed.
    It should call [gtk.color_dialog.ColorDialog.chooseRgbaFinish]
    to obtain the result.
    Params:
      parent =       the parent [gtk.window.Window]
      initialColor =       the color to select initially
      cancellable =       a [gio.cancellable.Cancellable] to cancel the operation
      callback =       a callback to call when the operation is complete
  */
  void chooseRgba(gtk.window.Window parent = null, gdk.rgba.RGBA initialColor = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_color_dialog_choose_rgba(cast(GtkColorDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null, initialColor ? cast(const(GdkRGBA)*)initialColor.cPtr(No.dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.color_dialog.ColorDialog.chooseRgba] call and
    returns the resulting color.
    Params:
      result =       a [gio.async_result.AsyncResult]
    Returns:     the selected color, or
        `NULL` and error is set
  */
  gdk.rgba.RGBA chooseRgbaFinish(gio.async_result.AsyncResult result)
  {
    GdkRGBA* _cretval;
    GError *_err;
    _cretval = gtk_color_dialog_choose_rgba_finish(cast(GtkColorDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Returns whether the color chooser dialog
    blocks interaction with the parent window
    while it is presented.
    Returns:     `TRUE` if the color chooser dialog is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_color_dialog_get_modal(cast(GtkColorDialog*)cPtr);
    return _retval;
  }

  /**
      Returns the title that will be shown on the
    color chooser dialog.
    Returns:     the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_color_dialog_get_title(cast(GtkColorDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Returns whether colors may have alpha.
    Returns:     `TRUE` if colors may have alpha
  */
  bool getWithAlpha()
  {
    bool _retval;
    _retval = gtk_color_dialog_get_with_alpha(cast(GtkColorDialog*)cPtr);
    return _retval;
  }

  /**
      Sets whether the color chooser dialog
    blocks interaction with the parent window
    while it is presented.
    Params:
      modal =       the new value
  */
  void setModal(bool modal)
  {
    gtk_color_dialog_set_modal(cast(GtkColorDialog*)cPtr, modal);
  }

  /**
      Sets the title that will be shown on the
    color chooser dialog.
    Params:
      title =       the new title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.alloc);
    gtk_color_dialog_set_title(cast(GtkColorDialog*)cPtr, _title);
  }

  /**
      Sets whether colors may have alpha.
    Params:
      withAlpha =       the new value
  */
  void setWithAlpha(bool withAlpha)
  {
    gtk_color_dialog_set_with_alpha(cast(GtkColorDialog*)cPtr, withAlpha);
  }
}
