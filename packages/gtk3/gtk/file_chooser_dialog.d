module gtk.file_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.types;

/**
 * #GtkFileChooserDialog is a dialog box suitable for use with
 * “File/Open” or “File/Save as” commands.  This widget works by
 * putting a #GtkFileChooserWidget inside a #GtkDialog.  It exposes
 * the #GtkFileChooser interface, so you can use all of the
 * #GtkFileChooser functions on the file chooser dialog as well as
 * those for #GtkDialog.
 * Note that #GtkFileChooserDialog does not have any methods of its
 * own.  Instead, you should use the functions that work on a
 * #GtkFileChooser.
 * If you want to integrate well with the platform you should use the
 * #GtkFileChooserNative API, which will use a platform-specific
 * dialog if available and fall back to GtkFileChooserDialog
 * otherwise.
 * ## Typical usage ## {#gtkfilechooser-typical-usage}
 * In the simplest of cases, you can the following code to use
 * #GtkFileChooserDialog to select a file for opening:
 * |[
 * GtkWidget *dialog;
 * GtkFileChooserAction action \= GTK_FILE_CHOOSER_ACTION_OPEN;
 * gint res;
 * dialog \= gtk_file_chooser_dialog_new $(LPAREN)"Open File",
 * parent_window,
 * action,
 * _$(LPAREN)"_Cancel"$(RPAREN),
 * GTK_RESPONSE_CANCEL,
 * _$(LPAREN)"_Open"$(RPAREN),
 * GTK_RESPONSE_ACCEPT,
 * NULL$(RPAREN);
 * res \= gtk_dialog_run $(LPAREN)GTK_DIALOG $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * if $(LPAREN)res \=\= GTK_RESPONSE_ACCEPT$(RPAREN)
 * {
 * char *filename;
 * GtkFileChooser *chooser \= GTK_FILE_CHOOSER $(LPAREN)dialog$(RPAREN);
 * filename \= gtk_file_chooser_get_filename $(LPAREN)chooser$(RPAREN);
 * open_file $(LPAREN)filename$(RPAREN);
 * g_free $(LPAREN)filename$(RPAREN);
 * }
 * gtk_widget_destroy $(LPAREN)dialog$(RPAREN);
 * ]|
 * To use a dialog for saving, you can use this:
 * |[
 * GtkWidget *dialog;
 * GtkFileChooser *chooser;
 * GtkFileChooserAction action \= GTK_FILE_CHOOSER_ACTION_SAVE;
 * gint res;
 * dialog \= gtk_file_chooser_dialog_new $(LPAREN)"Save File",
 * parent_window,
 * action,
 * _$(LPAREN)"_Cancel"$(RPAREN),
 * GTK_RESPONSE_CANCEL,
 * _$(LPAREN)"_Save"$(RPAREN),
 * GTK_RESPONSE_ACCEPT,
 * NULL$(RPAREN);
 * chooser \= GTK_FILE_CHOOSER $(LPAREN)dialog$(RPAREN);
 * gtk_file_chooser_set_do_overwrite_confirmation $(LPAREN)chooser, TRUE$(RPAREN);
 * if $(LPAREN)user_edited_a_new_document$(RPAREN)
 * gtk_file_chooser_set_current_name $(LPAREN)chooser,
 * _$(LPAREN)"Untitled document"$(RPAREN)$(RPAREN);
 * else
 * gtk_file_chooser_set_filename $(LPAREN)chooser,
 * existing_filename$(RPAREN);
 * res \= gtk_dialog_run $(LPAREN)GTK_DIALOG $(LPAREN)dialog$(RPAREN)$(RPAREN);
 * if $(LPAREN)res \=\= GTK_RESPONSE_ACCEPT$(RPAREN)
 * {
 * char *filename;
 * filename \= gtk_file_chooser_get_filename $(LPAREN)chooser$(RPAREN);
 * save_to_file $(LPAREN)filename$(RPAREN);
 * g_free $(LPAREN)filename$(RPAREN);
 * }
 * gtk_widget_destroy $(LPAREN)dialog$(RPAREN);
 * ]|
 * ## Setting up a file chooser dialog ## {#gtkfilechooserdialog-setting-up}
 * There are various cases in which you may need to use a #GtkFileChooserDialog:
 * - To select a file for opening. Use #GTK_FILE_CHOOSER_ACTION_OPEN.
 * - To save a file for the first time. Use #GTK_FILE_CHOOSER_ACTION_SAVE,
 * and suggest a name such as “Untitled” with [gtk.file_chooser.FileChooser.setCurrentName].
 * - To save a file under a different name. Use #GTK_FILE_CHOOSER_ACTION_SAVE,
 * and set the existing filename with [gtk.file_chooser.FileChooser.setFilename].
 * - To choose a folder instead of a file. Use #GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER.
 * Note that old versions of the file chooser’s documentation suggested
 * using [gtk.file_chooser.FileChooser.setCurrentFolder] in various
 * situations, with the intention of letting the application
 * suggest a reasonable default folder.  This is no longer
 * considered to be a good policy, as now the file chooser is
 * able to make good suggestions on its own.  In general, you
 * should only cause the file chooser to show a specific folder
 * when it is appropriate to use [gtk.file_chooser.FileChooser.setFilename],
 * i.e. when you are doing a Save As command and you already
 * have a file saved somewhere.
 * ## Response Codes ## {#gtkfilechooserdialog-responses}
 * #GtkFileChooserDialog inherits from #GtkDialog, so buttons that
 * go in its action area have response codes such as
 * #GTK_RESPONSE_ACCEPT and #GTK_RESPONSE_CANCEL.  For example, you
 * could call [gtk.file_chooser_dialog.FileChooserDialog.new_] as follows:
 * |[
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
 * ]|
 * This will create buttons for “Cancel” and “Open” that use stock
 * response identifiers from #GtkResponseType.  For most dialog
 * boxes you can use your own custom response codes rather than the
 * ones in #GtkResponseType, but #GtkFileChooserDialog assumes that
 * its “accept”-type action, e.g. an “Open” or “Save” button,
 * will have one of the following response codes:
 * - #GTK_RESPONSE_ACCEPT
 * - #GTK_RESPONSE_OK
 * - #GTK_RESPONSE_YES
 * - #GTK_RESPONSE_APPLY
 * This is because #GtkFileChooserDialog must intercept responses
 * and switch to folders if appropriate, rather than letting the
 * dialog terminate — the implementation uses these known
 * response codes to know which responses can be blocked if
 * appropriate.
 * To summarize, make sure you use a
 * [stock response code][gtkfilechooserdialog-responses]
 * when you use #GtkFileChooserDialog to ensure proper operation.
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
