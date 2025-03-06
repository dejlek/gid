module gtk.message_dialog;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.message_dialog.MessageDialog] presents a dialog with some message text.
  
  ![An example GtkMessageDialog](messagedialog.png)
  
  It’s simply a convenience widget; you could construct the equivalent of
  [gtk.message_dialog.MessageDialog] from [gtk.dialog.Dialog] without too much effort, but
  [gtk.message_dialog.MessageDialog] saves typing.
  
  The easiest way to do a modal message dialog is to use the [gtk.types.DialogFlags.Modal]
  flag, which will call [gtk.window.Window.setModal] internally. The dialog will
  prevent interaction with the parent window until it's hidden or destroyed.
  You can use the [gtk.dialog.Dialog.response] signal to know when the user
  dismissed the dialog.
  
  An example for using a modal dialog:
  ```c
  GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT | GTK_DIALOG_MODAL;
  dialog = gtk_message_dialog_new (parent_window,
                                   flags,
                                   GTK_MESSAGE_ERROR,
                                   GTK_BUTTONS_CLOSE,
                                   "Error reading “%s”: %s",
                                   filename,
                                   g_strerror (errno));
  // Destroy the dialog when the user responds to it
  // (e.g. clicks a button)
  
  g_signal_connect (dialog, "response",
                    G_CALLBACK (gtk_window_destroy),
                    NULL);
  ```
  
  You might do a non-modal [gtk.message_dialog.MessageDialog] simply by omitting the
  [gtk.types.DialogFlags.Modal] flag:
  
  ```c
  GtkDialogFlags flags = GTK_DIALOG_DESTROY_WITH_PARENT;
  dialog = gtk_message_dialog_new (parent_window,
                                   flags,
                                   GTK_MESSAGE_ERROR,
                                   GTK_BUTTONS_CLOSE,
                                   "Error reading “%s”: %s",
                                   filename,
                                   g_strerror (errno));
  
  // Destroy the dialog when the user responds to it
  // (e.g. clicks a button)
  g_signal_connect (dialog, "response",
                    G_CALLBACK (gtk_window_destroy),
                    NULL);
  ```
  
  # GtkMessageDialog as GtkBuildable
  
  The [gtk.message_dialog.MessageDialog] implementation of the [gtk.buildable.Buildable] interface exposes
  the message area as an internal child with the name “message_area”.

  Deprecated:     Use [gtk.alert_dialog.AlertDialog] instead
*/
class MessageDialog : gtk.dialog.Dialog
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_message_dialog_get_type != &gidSymbolNotFound ? gtk_message_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Returns the message area of the dialog.
    
    This is the box where the dialog’s primary and secondary labels
    are packed. You can add your own extra content to that box and it
    will appear below those labels. See [gtk.dialog.Dialog.getContentArea]
    for the corresponding function in the parent [gtk.dialog.Dialog].
    Returns:     A [gtk.box.Box] corresponding to the
        “message area” in the message_dialog
  
    Deprecated:     Use [gtk.alert_dialog.AlertDialog] instead
  */
  gtk.widget.Widget getMessageArea()
  {
    GtkWidget* _cretval;
    _cretval = gtk_message_dialog_get_message_area(cast(GtkMessageDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the text of the message dialog.
    Params:
      str =       string with Pango markup
  
    Deprecated:     Use [gtk.alert_dialog.AlertDialog] instead
  */
  void setMarkup(string str)
  {
    const(char)* _str = str.toCString(No.Alloc);
    gtk_message_dialog_set_markup(cast(GtkMessageDialog*)cPtr, _str);
  }
}
