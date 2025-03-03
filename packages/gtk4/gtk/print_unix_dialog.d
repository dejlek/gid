module gtk.print_unix_dialog;

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
import gtk.printer;
import gtk.root;
import gtk.root_mixin;
import gtk.settings;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
 * `GtkPrintUnixDialog` implements a print dialog for platforms
 * which don’t provide a native print dialog, like Unix.
 * ![An example GtkPrintUnixDialog](printdialog.png)
 * It can be used very much like any other GTK dialog, at the cost of
 * the portability offered by the high-level printing API with
 * [gtk.print_operation.PrintOperation].
 * In order to print something with `GtkPrintUnixDialog`, you need to
 * use [gtk.print_unix_dialog.PrintUnixDialog.getSelectedPrinter] to obtain a
 * [gtk.printer.Printer] object and use it to construct a [gtk.print_job.PrintJob]
 * using [gtk.print_job.PrintJob.new_].
 * `GtkPrintUnixDialog` uses the following response values:
 * - %GTK_RESPONSE_OK: for the “Print” button
 * - %GTK_RESPONSE_APPLY: for the “Preview” button
 * - %GTK_RESPONSE_CANCEL: for the “Cancel” button
 * # GtkPrintUnixDialog as GtkBuildable
 * The `GtkPrintUnixDialog` implementation of the `GtkBuildable` interface
 * exposes its @notebook internal children with the name “notebook”.
 * An example of a `GtkPrintUnixDialog` UI definition fragment:
 * ```xml
 * <object class\="GtkPrintUnixDialog" id\="dialog1">
 * <child internal-child\="notebook">
 * <object class\="GtkNotebook" id\="notebook">
 * <child>
 * <object type\="GtkNotebookPage">
 * <property name\="tab_expand">False</property>
 * <property name\="tab_fill">False</property>
 * <property name\="tab">
 * <object class\="GtkLabel" id\="tablabel">
 * <property name\="label">Tab label</property>
 * </object>
 * </property>
 * <property name\="child">
 * <object class\="GtkLabel" id\="tabcontent">
 * <property name\="label">Content on notebook tab</property>
 * </object>
 * </property>
 * </object>
 * </child>
 * </object>
 * </child>
 * </object>
 * ```
 * # CSS nodes
 * `GtkPrintUnixDialog` has a single CSS node with name window. The style classes
 * dialog and print are added.
 */
class PrintUnixDialog : gtk.dialog.Dialog
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_unix_dialog_get_type != &gidSymbolNotFound ? gtk_print_unix_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkPrintUnixDialog`.
   * Params:
   *   title = Title of the dialog
   *   parent = Transient parent of the dialog
   * Returns: a new `GtkPrintUnixDialog`
   */
  this(string title, gtk.window.Window parent)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_print_unix_dialog_new(_title, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Adds a custom tab to the print dialog.
   * Params:
   *   child = the widget to put in the custom tab
   *   tabLabel = the widget to use as tab label
   */
  void addCustomTab(gtk.widget.Widget child, gtk.widget.Widget tabLabel)
  {
    gtk_print_unix_dialog_add_custom_tab(cast(GtkPrintUnixDialog*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, tabLabel ? cast(GtkWidget*)tabLabel.cPtr(No.Dup) : null);
  }

  /**
   * Gets the current page of the `GtkPrintUnixDialog`.
   * Returns: the current page of dialog
   */
  int getCurrentPage()
  {
    int _retval;
    _retval = gtk_print_unix_dialog_get_current_page(cast(GtkPrintUnixDialog*)cPtr);
    return _retval;
  }

  /**
   * Gets whether to embed the page setup.
   * Returns: whether to embed the page setup
   */
  bool getEmbedPageSetup()
  {
    bool _retval;
    _retval = gtk_print_unix_dialog_get_embed_page_setup(cast(GtkPrintUnixDialog*)cPtr);
    return _retval;
  }

  /**
   * Gets whether there is a selection.
   * Returns: whether there is a selection
   */
  bool getHasSelection()
  {
    bool _retval;
    _retval = gtk_print_unix_dialog_get_has_selection(cast(GtkPrintUnixDialog*)cPtr);
    return _retval;
  }

  /**
   * Gets the capabilities that have been set on this `GtkPrintUnixDialog`.
   * Returns: the printing capabilities
   */
  gtk.types.PrintCapabilities getManualCapabilities()
  {
    GtkPrintCapabilities _cretval;
    _cretval = gtk_print_unix_dialog_get_manual_capabilities(cast(GtkPrintUnixDialog*)cPtr);
    gtk.types.PrintCapabilities _retval = cast(gtk.types.PrintCapabilities)_cretval;
    return _retval;
  }

  /**
   * Gets the page setup that is used by the `GtkPrintUnixDialog`.
   * Returns: the page setup of dialog.
   */
  gtk.page_setup.PageSetup getPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_unix_dialog_get_page_setup(cast(GtkPrintUnixDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets whether a page setup was set by the user.
   * Returns: whether a page setup was set by user.
   */
  bool getPageSetupSet()
  {
    bool _retval;
    _retval = gtk_print_unix_dialog_get_page_setup_set(cast(GtkPrintUnixDialog*)cPtr);
    return _retval;
  }

  /**
   * Gets the currently selected printer.
   * Returns: the currently selected printer
   */
  gtk.printer.Printer getSelectedPrinter()
  {
    GtkPrinter* _cretval;
    _cretval = gtk_print_unix_dialog_get_selected_printer(cast(GtkPrintUnixDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.printer.Printer)(cast(GtkPrinter*)_cretval, No.Take);
    return _retval;
  }

  alias getSettings = gtk.widget.Widget.getSettings;

  /**
   * Gets a new `GtkPrintSettings` object that represents the
   * current values in the print dialog.
   * Note that this creates a new object, and you need to unref
   * it if don’t want to keep it.
   * Returns: a new `GtkPrintSettings` object with the values from dialog
   */
  gtk.print_settings.PrintSettings getSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_unix_dialog_get_settings(cast(GtkPrintUnixDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets whether the print dialog allows user to print a selection.
   * Returns: whether the application supports print of selection
   */
  bool getSupportSelection()
  {
    bool _retval;
    _retval = gtk_print_unix_dialog_get_support_selection(cast(GtkPrintUnixDialog*)cPtr);
    return _retval;
  }

  /**
   * Sets the current page number.
   * If current_page is not -1, this enables the current page choice
   * for the range of pages to print.
   * Params:
   *   currentPage = the current page number.
   */
  void setCurrentPage(int currentPage)
  {
    gtk_print_unix_dialog_set_current_page(cast(GtkPrintUnixDialog*)cPtr, currentPage);
  }

  /**
   * Embed page size combo box and orientation combo box into page setup page.
   * Params:
   *   embed = embed page setup selection
   */
  void setEmbedPageSetup(bool embed)
  {
    gtk_print_unix_dialog_set_embed_page_setup(cast(GtkPrintUnixDialog*)cPtr, embed);
  }

  /**
   * Sets whether a selection exists.
   * Params:
   *   hasSelection = %TRUE indicates that a selection exists
   */
  void setHasSelection(bool hasSelection)
  {
    gtk_print_unix_dialog_set_has_selection(cast(GtkPrintUnixDialog*)cPtr, hasSelection);
  }

  /**
   * This lets you specify the printing capabilities your application
   * supports.
   * For instance, if you can handle scaling the output then you pass
   * %GTK_PRINT_CAPABILITY_SCALE. If you don’t pass that, then the dialog
   * will only let you select the scale if the printing system automatically
   * handles scaling.
   * Params:
   *   capabilities = the printing capabilities of your application
   */
  void setManualCapabilities(gtk.types.PrintCapabilities capabilities)
  {
    gtk_print_unix_dialog_set_manual_capabilities(cast(GtkPrintUnixDialog*)cPtr, capabilities);
  }

  /**
   * Sets the page setup of the `GtkPrintUnixDialog`.
   * Params:
   *   pageSetup = a `GtkPageSetup`
   */
  void setPageSetup(gtk.page_setup.PageSetup pageSetup)
  {
    gtk_print_unix_dialog_set_page_setup(cast(GtkPrintUnixDialog*)cPtr, pageSetup ? cast(GtkPageSetup*)pageSetup.cPtr(No.Dup) : null);
  }

  /**
   * Sets the `GtkPrintSettings` for the `GtkPrintUnixDialog`.
   * Typically, this is used to restore saved print settings
   * from a previous print operation before the print dialog
   * is shown.
   * Params:
   *   settings = a `GtkPrintSettings`
   */
  void setSettings(gtk.print_settings.PrintSettings settings)
  {
    gtk_print_unix_dialog_set_settings(cast(GtkPrintUnixDialog*)cPtr, settings ? cast(GtkPrintSettings*)settings.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether the print dialog allows user to print a selection.
   * Params:
   *   supportSelection = %TRUE to allow print selection
   */
  void setSupportSelection(bool supportSelection)
  {
    gtk_print_unix_dialog_set_support_selection(cast(GtkPrintUnixDialog*)cPtr, supportSelection);
  }
}
