module gtk.print_operation_preview_mixin;

public import gtk.print_operation_preview_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.page_setup;
public import gtk.print_context;
public import gtk.types;

template PrintOperationPreviewT()
{

  /**
   * Ends a preview.
   * This function must be called to finish a custom print preview.
   */
  override void endPreview()
  {
    gtk_print_operation_preview_end_preview(cast(GtkPrintOperationPreview*)cPtr);
  }

  /**
   * Returns whether the given page is included in the set of pages that
   * have been selected for printing.
   * Params:
   *   pageNr = a page number
   * Returns: %TRUE if the page has been selected for printing
   */
  override bool isSelected(int pageNr)
  {
    bool _retval;
    _retval = gtk_print_operation_preview_is_selected(cast(GtkPrintOperationPreview*)cPtr, pageNr);
    return _retval;
  }

  /**
   * Renders a page to the preview, using the print context that
   * was passed to the #GtkPrintOperation::preview handler together
   * with preview.
   * A custom iprint preview should use this function in its ::expose
   * handler to render the currently selected page.
   * Note that this function requires a suitable cairo context to
   * be associated with the print context.
   * Params:
   *   pageNr = the page to render
   */
  override void renderPage(int pageNr)
  {
    gtk_print_operation_preview_render_page(cast(GtkPrintOperationPreview*)cPtr, pageNr);
  }

  /**
   * The ::got-page-size signal is emitted once for each page
   * that gets rendered to the preview.
   * A handler for this signal should update the context
   * according to page_setup and set up a suitable cairo
   * context, using [gtk.print_context.PrintContext.setCairoContext].
   * Params
   *   context = the current #GtkPrintContext
   *   pageSetup = the #GtkPageSetup for the current page
   *   printOperationPreview = the instance the signal is connected to
   */
  alias GotPageSizeCallbackDlg = void delegate(gtk.print_context.PrintContext context, gtk.page_setup.PageSetup pageSetup, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);
  alias GotPageSizeCallbackFunc = void function(gtk.print_context.PrintContext context, gtk.page_setup.PageSetup pageSetup, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);

  /**
   * Connect to GotPageSize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotPageSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotPageSizeCallbackDlg) || is(T : GotPageSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperationPreview = getVal!(gtk.print_operation_preview.PrintOperationPreview)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      auto pageSetup = getVal!(gtk.page_setup.PageSetup)(&_paramVals[2]);
      _dClosure.dlg(context, pageSetup, printOperationPreview);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-page-size", closure, after);
  }

  /**
   * The ::ready signal gets emitted once per preview operation,
   * before the first page is rendered.
   * A handler for this signal can be used for setup tasks.
   * Params
   *   context = the current #GtkPrintContext
   *   printOperationPreview = the instance the signal is connected to
   */
  alias ReadyCallbackDlg = void delegate(gtk.print_context.PrintContext context, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);
  alias ReadyCallbackFunc = void function(gtk.print_context.PrintContext context, gtk.print_operation_preview.PrintOperationPreview printOperationPreview);

  /**
   * Connect to Ready signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectReady(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ReadyCallbackDlg) || is(T : ReadyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperationPreview = getVal!(gtk.print_operation_preview.PrintOperationPreview)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      _dClosure.dlg(context, printOperationPreview);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("ready", closure, after);
  }
}
