module Gtk.PrintOperationPreview;

public import Gtk.PrintOperationPreviewIfaceProxy;
import GObject.DClosure;
import Gid.gid;
import Gtk.PageSetup;
import Gtk.PrintContext;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkPrintOperationPreview` is the interface that is used to
 * implement print preview.
 * A `GtkPrintOperationPreview` object is passed to the
 * [Gtk.PrintOperation.preview] signal by
 * [Gtk.PrintOperation].
 */
interface PrintOperationPreview
{

  static GType getType()
  {
    return gtk_print_operation_preview_get_type();
  }

  /**
   * Ends a preview.
   * This function must be called to finish a custom print preview.
   */
  void endPreview();

  /**
   * Returns whether the given page is included in the set of pages that
   * have been selected for printing.
   * Params:
   *   pageNr = a page number
   * Returns: %TRUE if the page has been selected for printing
   */
  bool isSelected(int pageNr);

  /**
   * Renders a page to the preview.
   * This is using the print context that was passed to the
   * [Gtk.PrintOperation.preview] handler together
   * with preview.
   * A custom print preview should use this function to render
   * the currently selected page.
   * Note that this function requires a suitable cairo context to
   * be associated with the print context.
   * Params:
   *   pageNr = the page to render
   */
  void renderPage(int pageNr);

  /**
   * Emitted once for each page that gets rendered to the preview.
   * A handler for this signal should update the context
   * according to page_setup and set up a suitable cairo
   * context, using [Gtk.PrintContext.setCairoContext].
   * Params
   *   context = the current `GtkPrintContext`
   *   pageSetup = the `GtkPageSetup` for the current page
   *   printOperationPreview = the instance the signal is connected to
   */
  alias GotPageSizeCallbackDlg = void delegate(PrintContext context, PageSetup pageSetup, PrintOperationPreview printOperationPreview);
  alias GotPageSizeCallbackFunc = void function(PrintContext context, PageSetup pageSetup, PrintOperationPreview printOperationPreview);

  /**
   * Connect to GotPageSize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotPageSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T == GotPageSizeCallbackDlg) || is(T == GotPageSizeCallbackFunc));

  /**
   * The ::ready signal gets emitted once per preview operation,
   * before the first page is rendered.
   * A handler for this signal can be used for setup tasks.
   * Params
   *   context = the current `GtkPrintContext`
   *   printOperationPreview = the instance the signal is connected to
   */
  alias ReadyCallbackDlg = void delegate(PrintContext context, PrintOperationPreview printOperationPreview);
  alias ReadyCallbackFunc = void function(PrintContext context, PrintOperationPreview printOperationPreview);

  /**
   * Connect to Ready signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectReady(T)(T callback, Flag!"After" after = No.After)
  if (is(T == ReadyCallbackDlg) || is(T == ReadyCallbackFunc));
  }
