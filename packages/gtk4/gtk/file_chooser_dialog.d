module gtk.file_chooser_dialog;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;

/**
 * `GtkFileChooserDialog` is a dialog suitable for use with
 * “File Open” or “File Save” commands.
 * ![An example GtkFileChooserDialog](filechooser.png)
 * This widget works by putting a [gtk.file_chooser_widget.FileChooserWidget]
 * inside a [gtk.dialog.Dialog]. It exposes the [gtk.file_chooser.FileChooser]
 * interface, so you can use all of the [gtk.file_chooser.FileChooser] functions
 * on the file chooser dialog as well as those for [gtk.dialog.Dialog].
 * Note that `GtkFileChooserDialog` does not have any methods of its
 * own. Instead, you should use the functions that work on a
 * [gtk.file_chooser.FileChooser].
 * If you want to integrate well with the platform you should use the
 * [gtk.file_chooser_native.FileChooserNative] API, which will use a platform-specific
 * dialog if available and fall back to `GtkFileChooserDialog`
 * otherwise.
 * ## Typical usage
 * In the simplest of cases, you can the following code to use
 * `GtkFileChooserDialog` to select a file for opening:
 * ```c
 * static void
 * on_open_response $(LPAREN)GtkDialog *dialog,
 * int        response$(RPAREN)
 * {
 * if $(LPAREN)response \=\= GTK_RESPONSE_ACCEPT$(RPAREN)
 * {
 * GtkFileChooser *chooser \= GTK_FILE_CHOOSER $(LPAREN)dialog$(RPAREN);
 * g_autoptr$(LPAREN)GFile$(RPAREN) file \= gtk_file_chooser_get_file $(LPAREN)chooser$(RPAREN);
 * open_file $(LPAREN)file$(RPAREN);
 * }
 * gtk_window_destroy $(LPAREN)GTK_WINDOW $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * }
 * // ...
 * GtkWidget *dialog;
 * GtkFileChooserAction action \= GTK_FILE_CHOOSER_ACTION_OPEN;
 * dialog \= gtk_file_chooser_dialog_new $(LPAREN)"Open File",
 * parent_window,
 * action,
 * _$(LPAREN)"_Cancel"$(RPAREN),
 * GTK_RESPONSE_CANCEL,
 * _$(LPAREN)"_Open"$(RPAREN),
 * GTK_RESPONSE_ACCEPT,
 * NULL$(RPAREN);
 * gtk_window_present $(LPAREN)GTK_WINDOW $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * g_signal_connect $(LPAREN)dialog, "response",
 * G_CALLBACK $(LPAREN)on_open_response$(RPAREN),
 * NULL$(RPAREN);
 * ```
 * To use a dialog for saving, you can use this:
 * ```c
 * static void
 * on_save_response $(LPAREN)GtkDialog *dialog,
 * int        response$(RPAREN)
 * {
 * if $(LPAREN)response \=\= GTK_RESPONSE_ACCEPT$(RPAREN)
 * {
 * GtkFileChooser *chooser \= GTK_FILE_CHOOSER $(LPAREN)dialog$(RPAREN);
 * g_autoptr$(LPAREN)GFile$(RPAREN) file \= gtk_file_chooser_get_file $(LPAREN)chooser$(RPAREN);
 * save_to_file $(LPAREN)file$(RPAREN);
 * }
 * gtk_window_destroy $(LPAREN)GTK_WINDOW $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * }
 * // ...
 * GtkWidget *dialog;
 * GtkFileChooser *chooser;
 * GtkFileChooserAction action \= GTK_FILE_CHOOSER_ACTION_SAVE;
 * dialog \= gtk_file_chooser_dialog_new $(LPAREN)"Save File",
 * parent_window,
 * action,
 * _$(LPAREN)"_Cancel"$(RPAREN),
 * GTK_RESPONSE_CANCEL,
 * _$(LPAREN)"_Save"$(RPAREN),
 * GTK_RESPONSE_ACCEPT,
 * NULL$(RPAREN);
 * chooser \= GTK_FILE_CHOOSER $(LPAREN)dialog$(RPAREN);
 * if $(LPAREN)user_edited_a_new_document$(RPAREN)
 * gtk_file_chooser_set_current_name $(LPAREN)chooser, _$(LPAREN)"Untitled document"$(RPAREN)$(RPAREN);
 * else
 * gtk_file_chooser_set_file $(LPAREN)chooser, existing_filename$(RPAREN);
 * gtk_window_present $(LPAREN)GTK_WINDOW $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * g_signal_connect $(LPAREN)dialog, "response",
 * G_CALLBACK $(LPAREN)on_save_response$(RPAREN),
 * NULL$(RPAREN);
 * ```
 * ## Setting up a file chooser dialog
 * There are various cases in which you may need to use a `GtkFileChooserDialog`:
 * - To select a file for opening, use %GTK_FILE_CHOOSER_ACTION_OPEN.
 * - To save a file for the first time, use %GTK_FILE_CHOOSER_ACTION_SAVE,
 * and suggest a name such as “Untitled” with
 * [gtk.file_chooser.FileChooser.setCurrentName].
 * - To save a file under a different name, use %GTK_FILE_CHOOSER_ACTION_SAVE,
 * and set the existing file with [gtk.file_chooser.FileChooser.setFile].
 * - To choose a folder instead of a filem use %GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
 * In general, you should only cause the file chooser to show a specific
 * folder when it is appropriate to use [gtk.file_chooser.FileChooser.setFile],
 * i.e. when you are doing a “Save As” command and you already have a file
 * saved somewhere.
 * ## Response Codes
 * `GtkFileChooserDialog` inherits from [gtk.dialog.Dialog], so buttons that
 * go in its action area have response codes such as %GTK_RESPONSE_ACCEPT and
 * %GTK_RESPONSE_CANCEL. For example, you could call
 * [gtk.file_chooser_dialog.FileChooserDialog.new_] as follows:
 * ```c
 * GtkWidget *dialog;
 * GtkFileChooserAction action \= GTK_FILE_CHOOSER_ACTION_OPEN;
 * dialog \= gtk_file_chooser_dialog_new $(LPAREN)"Open File",
 * parent_window,
 * action,
 * _$(LPAREN)"_Cancel"$(RPAREN),
 * GTK_RESPONSE_CANCEL,
 * _$(LPAREN)"_Open"$(RPAREN),
 * GTK_RESPONSE_ACCEPT,
 * NULL$(RPAREN);
 * ```
 * This will create buttons for “Cancel” and “Open” that use predefined
 * response identifiers from [gtk.types.ResponseType].  For most dialog
 * boxes you can use your own custom response codes rather than the
 * ones in [gtk.types.ResponseType], but `GtkFileChooserDialog` assumes that
 * its “accept”-type action, e.g. an “Open” or “Save” button,
 * will have one of the following response codes:
 * - %GTK_RESPONSE_ACCEPT
 * - %GTK_RESPONSE_OK
 * - %GTK_RESPONSE_YES
 * - %GTK_RESPONSE_APPLY
 * This is because `GtkFileChooserDialog` must intercept responses and switch
 * to folders if appropriate, rather than letting the dialog terminate — the
 * implementation uses these known response codes to know which responses can
 * be blocked if appropriate.
 * To summarize, make sure you use a predefined response code
 * when you use `GtkFileChooserDialog` to ensure proper operation.
 * ## CSS nodes
 * `GtkFileChooserDialog` has a single CSS node with the name `window` and style
 * class `.filechooser`.

 * Deprecated: Use [gtk.file_dialog.FileDialog] instead
 */
class FileChooserDialog : gtk.dialog.Dialog, gtk.file_chooser.FileChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_file_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_file_chooser_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FileChooserT!();
}
