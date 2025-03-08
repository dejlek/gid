module gtk.print_operation_preview;

public import gtk.print_operation_preview_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_context;
import gtk.types;

/** */
interface PrintOperationPreview
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_operation_preview_get_type != &gidSymbolNotFound ? gtk_print_operation_preview_get_type() : cast(GType)0;
  }

  /**
      Ends a preview.
    
    This function must be called to finish a custom print preview.
  */
  void endPreview();

  /**
      Returns whether the given page is included in the set of pages that
    have been selected for printing.
    Params:
      pageNr =       a page number
    Returns:     true if the page has been selected for printing
  */
  bool isSelected(int pageNr);

  /**
      Renders a page to the preview, using the print context that
    was passed to the #GtkPrintOperation::preview handler together
    with preview.
    
    A custom iprint preview should use this function in its ::expose
    handler to render the currently selected page.
    
    Note that this function requires a suitable cairo context to
    be associated with the print context.
    Params:
      pageNr =       the page to render
  */
  void renderPage(int pageNr);

  /**
      The ::got-page-size signal is emitted once for each page
    that gets rendered to the preview.
    
    A handler for this signal should update the context
    according to page_setup and set up a suitable cairo
    context, using [gtk.print_context.PrintContext.setCairoContext].
  
    ## Parameters
    $(LIST
      * $(B context)       the current #GtkPrintContext
      * $(B pageSetup)       the #GtkPageSetup for the current page
      * $(B printOperationPreview) the instance the signal is connected to
    )
  */
  alias GotPageSizeCallbackDlg = void delegate(gtk.print_context.PrintContext context, gtk.page_setup.PageSetup pageSetup, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);

  /** ditto */
  alias GotPageSizeCallbackFunc = void function(gtk.print_context.PrintContext context, gtk.page_setup.PageSetup pageSetup, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);

  /**
    Connect to GotPageSize signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectGotPageSize(T)(T callback, Flag!"after" after = No.after)
  if (is(T : GotPageSizeCallbackDlg) || is(T : GotPageSizeCallbackFunc));

  /**
      The ::ready signal gets emitted once per preview operation,
    before the first page is rendered.
    
    A handler for this signal can be used for setup tasks.
  
    ## Parameters
    $(LIST
      * $(B context)       the current #GtkPrintContext
      * $(B printOperationPreview) the instance the signal is connected to
    )
  */
  alias ReadyCallbackDlg = void delegate(gtk.print_context.PrintContext context, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);

  /** ditto */
  alias ReadyCallbackFunc = void function(gtk.print_context.PrintContext context, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);

  /**
    Connect to Ready signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectReady(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ReadyCallbackDlg) || is(T : ReadyCallbackFunc));
  }
