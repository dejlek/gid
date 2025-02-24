module gtk.page_setup_unix_dialog;

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
import gtk.page_setup;
import gtk.print_settings;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
 * `GtkPageSetupUnixDialog` implements a page setup dialog for platforms
 * which don’t provide a native page setup dialog, like Unix.
 * ![An example GtkPageSetupUnixDialog](pagesetupdialog.png)
 * It can be used very much like any other GTK dialog, at the
 * cost of the portability offered by the high-level printing
 * API in [Gtk.PrintOperation].
 * ## CSS nodes
 * `GtkPageSetupUnixDialog` has a single CSS node with the name `window` and
 * style class `.pagesetup`.
 */
class PageSetupUnixDialog : Dialog
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_page_setup_unix_dialog_get_type != &gidSymbolNotFound ? gtk_page_setup_unix_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new page setup dialog.
   * Params:
   *   title = the title of the dialog
   *   parent = transient parent of the dialog
   * Returns: the new `GtkPageSetupUnixDialog`
   */
  this(string title, Window parent)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_page_setup_unix_dialog_new(_title, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Gets the currently selected page setup from the dialog.
   * Returns: the current page setup
   */
  PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_page_setup_unix_dialog_get_page_setup(cast(GtkPageSetupUnixDialog*)cPtr);
    auto _retval = ObjectG.getDObject!PageSetup(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the current print settings from the dialog.
   * Returns: the current print settings
   */
  PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_page_setup_unix_dialog_get_print_settings(cast(GtkPageSetupUnixDialog*)cPtr);
    auto _retval = ObjectG.getDObject!PrintSettings(cast(GtkPrintSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the `GtkPageSetup` from which the page setup
   * dialog takes its values.
   * Params:
   *   pageSetup = a `GtkPageSetup`
   */
  void setPageSetup(PageSetup pageSetup)
  {
    gtk_page_setup_unix_dialog_set_page_setup(cast(GtkPageSetupUnixDialog*)cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup.cPtr(No.Dup) : null);
  }

  /**
   * Sets the `GtkPrintSettings` from which the page setup dialog
   * takes its values.
   * Params:
   *   printSettings = a `GtkPrintSettings`
   */
  void setPrintSettings(PrintSettings printSettings)
  {
    gtk_page_setup_unix_dialog_set_print_settings(cast(GtkPageSetupUnixDialog*)cPtr, printSettings ? cast(GtkPrintSettings*)printSettings.cPtr(No.Dup) : null);
  }
}
