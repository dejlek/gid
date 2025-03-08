module gtk.print_operation;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.page_setup;
import gtk.print_context;
import gtk.print_operation_preview;
import gtk.print_operation_preview_mixin;
import gtk.print_settings;
import gtk.types;
import gtk.widget;
import gtk.window;

/**
    GtkPrintOperation is the high-level, portable printing API.
  It looks a bit different than other GTK+ dialogs such as the
  #GtkFileChooser, since some platforms don’t expose enough
  infrastructure to implement a good print dialog. On such
  platforms, GtkPrintOperation uses the native print dialog.
  On platforms which do not provide a native print dialog, GTK+
  uses its own, see #GtkPrintUnixDialog.
  
  The typical way to use the high-level printing API is to create
  a GtkPrintOperation object with [gtk.print_operation.PrintOperation.new_] when
  the user selects to print. Then you set some properties on it,
  e.g. the page size, any #GtkPrintSettings from previous print
  operations, the number of pages, the current page, etc.
  
  Then you start the print operation by calling [gtk.print_operation.PrintOperation.run].
  It will then show a dialog, let the user select a printer and
  options. When the user finished the dialog various signals will
  be emitted on the #GtkPrintOperation, the main one being
  #GtkPrintOperation::draw-page, which you are supposed to catch
  and render the page on the provided #GtkPrintContext using Cairo.
  
  # The high-level printing API
  
  ```c
  static GtkPrintSettings *settings = NULL;
  
  static void
  do_print (void)
  {
    GtkPrintOperation *print;
    GtkPrintOperationResult res;
  
    print = gtk_print_operation_new ();
  
    if (settings != NULL)
      gtk_print_operation_set_print_settings (print, settings);
  
    g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
    g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
  
    res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                                   GTK_WINDOW (main_window), NULL);
  
    if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
      {
        if (settings != NULL)
          g_object_unref (settings);
        settings = g_object_ref (gtk_print_operation_get_print_settings (print));
      }
  
    g_object_unref (print);
  }
  ```
  
  By default GtkPrintOperation uses an external application to do
  print preview. To implement a custom print preview, an application
  must connect to the preview signal. The functions
  [gtk.print_operation_preview.PrintOperationPreview.renderPage],
  [gtk.print_operation_preview.PrintOperationPreview.endPreview] and
  [gtk.print_operation_preview.PrintOperationPreview.isSelected]
  are useful when implementing a print preview.
*/
class PrintOperation : gobject.object.ObjectG, gtk.print_operation_preview.PrintOperationPreview
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_print_operation_get_type != &gidSymbolNotFound ? gtk_print_operation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin PrintOperationPreviewT!();

  /**
      Creates a new #GtkPrintOperation.
    Returns:     a new #GtkPrintOperation
  */
  this()
  {
    GtkPrintOperation* _cretval;
    _cretval = gtk_print_operation_new();
    this(_cretval, Yes.take);
  }

  /**
      Cancels a running print operation. This function may
    be called from a #GtkPrintOperation::begin-print,
    #GtkPrintOperation::paginate or #GtkPrintOperation::draw-page
    signal handler to stop the currently running print
    operation.
  */
  void cancel()
  {
    gtk_print_operation_cancel(cast(GtkPrintOperation*)cPtr);
  }

  /**
      Signalize that drawing of particular page is complete.
    
    It is called after completion of page drawing (e.g. drawing in another
    thread).
    If [gtk.print_operation.PrintOperation.setDeferDrawing] was called before, then this function
    has to be called by application. In another case it is called by the library
    itself.
  */
  void drawPageFinish()
  {
    gtk_print_operation_draw_page_finish(cast(GtkPrintOperation*)cPtr);
  }

  /**
      Returns the default page setup, see
    [gtk.print_operation.PrintOperation.setDefaultPageSetup].
    Returns:     the default page setup
  */
  gtk.page_setup.PageSetup getDefaultPageSetup()
  {
    GtkPageSetup* _cretval;
    _cretval = gtk_print_operation_get_default_page_setup(cast(GtkPrintOperation*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.page_setup.PageSetup)(cast(GtkPageSetup*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the value of #GtkPrintOperation:embed-page-setup property.
    Returns:     whether page setup selection combos are embedded
  */
  bool getEmbedPageSetup()
  {
    bool _retval;
    _retval = gtk_print_operation_get_embed_page_setup(cast(GtkPrintOperation*)cPtr);
    return _retval;
  }

  /**
      Call this when the result of a print operation is
    [gtk.types.PrintOperationResult.error], either as returned by
    [gtk.print_operation.PrintOperation.run], or in the #GtkPrintOperation::done signal
    handler. The returned #GError will contain more details on what went wrong.
  */
  void getError()
  {
    GError *_err;
    gtk_print_operation_get_error(cast(GtkPrintOperation*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
  }

  /**
      Gets the value of #GtkPrintOperation:has-selection property.
    Returns:     whether there is a selection
  */
  bool getHasSelection()
  {
    bool _retval;
    _retval = gtk_print_operation_get_has_selection(cast(GtkPrintOperation*)cPtr);
    return _retval;
  }

  /**
      Returns the number of pages that will be printed.
    
    Note that this value is set during print preparation phase
    ([gtk.types.PrintStatus.preparing]), so this function should never be
    called before the data generation phase ([gtk.types.PrintStatus.generatingData]).
    You can connect to the #GtkPrintOperation::status-changed signal
    and call [gtk.print_operation.PrintOperation.getNPagesToPrint] when
    print status is [gtk.types.PrintStatus.generatingData].
    This is typically used to track the progress of print operation.
    Returns:     the number of pages that will be printed
  */
  int getNPagesToPrint()
  {
    int _retval;
    _retval = gtk_print_operation_get_n_pages_to_print(cast(GtkPrintOperation*)cPtr);
    return _retval;
  }

  /**
      Returns the current print settings.
    
    Note that the return value is null until either
    [gtk.print_operation.PrintOperation.setPrintSettings] or
    [gtk.print_operation.PrintOperation.run] have been called.
    Returns:     the current print settings of op.
  */
  gtk.print_settings.PrintSettings getPrintSettings()
  {
    GtkPrintSettings* _cretval;
    _cretval = gtk_print_operation_get_print_settings(cast(GtkPrintOperation*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.print_settings.PrintSettings)(cast(GtkPrintSettings*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the status of the print operation.
    Also see [gtk.print_operation.PrintOperation.getStatusString].
    Returns:     the status of the print operation
  */
  gtk.types.PrintStatus getStatus()
  {
    GtkPrintStatus _cretval;
    _cretval = gtk_print_operation_get_status(cast(GtkPrintOperation*)cPtr);
    gtk.types.PrintStatus _retval = cast(gtk.types.PrintStatus)_cretval;
    return _retval;
  }

  /**
      Returns a string representation of the status of the
    print operation. The string is translated and suitable
    for displaying the print status e.g. in a #GtkStatusbar.
    
    Use [gtk.print_operation.PrintOperation.getStatus] to obtain a status
    value that is suitable for programmatic use.
    Returns:     a string representation of the status
         of the print operation
  */
  string getStatusString()
  {
    const(char)* _cretval;
    _cretval = gtk_print_operation_get_status_string(cast(GtkPrintOperation*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the value of #GtkPrintOperation:support-selection property.
    Returns:     whether the application supports print of selection
  */
  bool getSupportSelection()
  {
    bool _retval;
    _retval = gtk_print_operation_get_support_selection(cast(GtkPrintOperation*)cPtr);
    return _retval;
  }

  /**
      A convenience function to find out if the print operation
    is finished, either successfully ([gtk.types.PrintStatus.finished])
    or unsuccessfully ([gtk.types.PrintStatus.finishedAborted]).
    
    Note: when you enable print status tracking the print operation
    can be in a non-finished state even after done has been called, as
    the operation status then tracks the print job status on the printer.
    Returns:     true, if the print operation is finished.
  */
  bool isFinished()
  {
    bool _retval;
    _retval = gtk_print_operation_is_finished(cast(GtkPrintOperation*)cPtr);
    return _retval;
  }

  /**
      Runs the print operation, by first letting the user modify
    print settings in the print dialog, and then print the document.
    
    Normally that this function does not return until the rendering of all
    pages is complete. You can connect to the
    #GtkPrintOperation::status-changed signal on op to obtain some
    information about the progress of the print operation.
    Furthermore, it may use a recursive mainloop to show the print dialog.
    
    If you call [gtk.print_operation.PrintOperation.setAllowAsync] or set the
    #GtkPrintOperation:allow-async property the operation will run
    asynchronously if this is supported on the platform. The
    #GtkPrintOperation::done signal will be emitted with the result of the
    operation when the it is done (i.e. when the dialog is canceled, or when
    the print succeeds or fails).
    ```c
    if (settings != NULL)
      gtk_print_operation_set_print_settings (print, settings);
      
    if (page_setup != NULL)
      gtk_print_operation_set_default_page_setup (print, page_setup);
      
    g_signal_connect (print, "begin-print",
                      G_CALLBACK (begin_print), &data);
    g_signal_connect (print, "draw-page",
                      G_CALLBACK (draw_page), &data);
     
    res = gtk_print_operation_run (print,
                                   GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
                                   parent,
                                   &error);
     
    if (res == GTK_PRINT_OPERATION_RESULT_ERROR)
     {
       error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),
      			                     GTK_DIALOG_DESTROY_WITH_PARENT,
    					     GTK_MESSAGE_ERROR,
    					     GTK_BUTTONS_CLOSE,
    					     "Error printing file:\n%s",
    					     error->message);
       g_signal_connect (error_dialog, "response",
                         G_CALLBACK (gtk_widget_destroy), NULL);
       gtk_widget_show (error_dialog);
       g_error_free (error);
     }
    else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
     {
       if (settings != NULL)
    g_object_unref (settings);
       settings = g_object_ref (gtk_print_operation_get_print_settings (print));
     }
    ```
    
    Note that [gtk.print_operation.PrintOperation.run] can only be called once on a
    given #GtkPrintOperation.
    Params:
      action =       the action to start
      parent =       Transient parent of the dialog
    Returns:     the result of the print operation. A return value of
        [gtk.types.PrintOperationResult.apply] indicates that the printing was
        completed successfully. In this case, it is a good idea to obtain
        the used print settings with [gtk.print_operation.PrintOperation.getPrintSettings]
        and store them for reuse with the next print operation. A value of
        [gtk.types.PrintOperationResult.inProgress] means the operation is running
        asynchronously, and will emit the #GtkPrintOperation::done signal when
        done.
  */
  gtk.types.PrintOperationResult run(gtk.types.PrintOperationAction action, gtk.window.Window parent = null)
  {
    GtkPrintOperationResult _cretval;
    GError *_err;
    _cretval = gtk_print_operation_run(cast(GtkPrintOperation*)cPtr, action, parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    gtk.types.PrintOperationResult _retval = cast(gtk.types.PrintOperationResult)_cretval;
    return _retval;
  }

  /**
      Sets whether the [gtk.print_operation.PrintOperation.run] may return
    before the print operation is completed. Note that
    some platforms may not allow asynchronous operation.
    Params:
      allowAsync =       true to allow asynchronous operation
  */
  void setAllowAsync(bool allowAsync)
  {
    gtk_print_operation_set_allow_async(cast(GtkPrintOperation*)cPtr, allowAsync);
  }

  /**
      Sets the current page.
    
    If this is called before [gtk.print_operation.PrintOperation.run],
    the user will be able to select to print only the current page.
    
    Note that this only makes sense for pre-paginated documents.
    Params:
      currentPage =       the current page, 0-based
  */
  void setCurrentPage(int currentPage)
  {
    gtk_print_operation_set_current_page(cast(GtkPrintOperation*)cPtr, currentPage);
  }

  /**
      Sets the label for the tab holding custom widgets.
    Params:
      label =       the label to use, or null to use the default label
  */
  void setCustomTabLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.alloc);
    gtk_print_operation_set_custom_tab_label(cast(GtkPrintOperation*)cPtr, _label);
  }

  /**
      Makes default_page_setup the default page setup for op.
    
    This page setup will be used by [gtk.print_operation.PrintOperation.run],
    but it can be overridden on a per-page basis by connecting
    to the #GtkPrintOperation::request-page-setup signal.
    Params:
      defaultPageSetup =       a #GtkPageSetup, or null
  */
  void setDefaultPageSetup(gtk.page_setup.PageSetup defaultPageSetup = null)
  {
    gtk_print_operation_set_default_page_setup(cast(GtkPrintOperation*)cPtr, defaultPageSetup ? cast(GtkPageSetup*)defaultPageSetup.cPtr(No.dup) : null);
  }

  /**
      Sets up the #GtkPrintOperation to wait for calling of
    [gtk.print_operation.PrintOperation.drawPageFinish] from application. It can
    be used for drawing page in another thread.
    
    This function must be called in the callback of “draw-page” signal.
  */
  void setDeferDrawing()
  {
    gtk_print_operation_set_defer_drawing(cast(GtkPrintOperation*)cPtr);
  }

  /**
      Embed page size combo box and orientation combo box into page setup page.
    Selected page setup is stored as default page setup in #GtkPrintOperation.
    Params:
      embed =       true to embed page setup selection in the #GtkPrintUnixDialog
  */
  void setEmbedPageSetup(bool embed)
  {
    gtk_print_operation_set_embed_page_setup(cast(GtkPrintOperation*)cPtr, embed);
  }

  /**
      Sets up the #GtkPrintOperation to generate a file instead
    of showing the print dialog. The indended use of this function
    is for implementing “Export to PDF” actions. Currently, PDF
    is the only supported format.
    
    “Print to PDF” support is independent of this and is done
    by letting the user pick the “Print to PDF” item from the list
    of printers in the print dialog.
    Params:
      filename =       the filename for the exported file
  */
  void setExportFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.alloc);
    gtk_print_operation_set_export_filename(cast(GtkPrintOperation*)cPtr, _filename);
  }

  /**
      Sets whether there is a selection to print.
    
    Application has to set number of pages to which the selection
    will draw by [gtk.print_operation.PrintOperation.setNPages] in a callback of
    #GtkPrintOperation::begin-print.
    Params:
      hasSelection =       true indicates that a selection exists
  */
  void setHasSelection(bool hasSelection)
  {
    gtk_print_operation_set_has_selection(cast(GtkPrintOperation*)cPtr, hasSelection);
  }

  /**
      Sets the name of the print job. The name is used to identify
    the job (e.g. in monitoring applications like eggcups).
    
    If you don’t set a job name, GTK+ picks a default one by
    numbering successive print jobs.
    Params:
      jobName =       a string that identifies the print job
  */
  void setJobName(string jobName)
  {
    const(char)* _jobName = jobName.toCString(No.alloc);
    gtk_print_operation_set_job_name(cast(GtkPrintOperation*)cPtr, _jobName);
  }

  /**
      Sets the number of pages in the document.
    
    This must be set to a positive number
    before the rendering starts. It may be set in a
    #GtkPrintOperation::begin-print signal hander.
    
    Note that the page numbers passed to the
    #GtkPrintOperation::request-page-setup
    and #GtkPrintOperation::draw-page signals are 0-based, i.e. if
    the user chooses to print all pages, the last ::draw-page signal
    will be for page n_pages - 1.
    Params:
      nPages =       the number of pages
  */
  void setNPages(int nPages)
  {
    gtk_print_operation_set_n_pages(cast(GtkPrintOperation*)cPtr, nPages);
  }

  /**
      Sets the print settings for op. This is typically used to
    re-establish print settings from a previous print operation,
    see [gtk.print_operation.PrintOperation.run].
    Params:
      printSettings =       #GtkPrintSettings
  */
  void setPrintSettings(gtk.print_settings.PrintSettings printSettings = null)
  {
    gtk_print_operation_set_print_settings(cast(GtkPrintOperation*)cPtr, printSettings ? cast(GtkPrintSettings*)printSettings.cPtr(No.dup) : null);
  }

  /**
      If show_progress is true, the print operation will show a
    progress dialog during the print operation.
    Params:
      showProgress =       true to show a progress dialog
  */
  void setShowProgress(bool showProgress)
  {
    gtk_print_operation_set_show_progress(cast(GtkPrintOperation*)cPtr, showProgress);
  }

  /**
      Sets whether selection is supported by #GtkPrintOperation.
    Params:
      supportSelection =       true to support selection
  */
  void setSupportSelection(bool supportSelection)
  {
    gtk_print_operation_set_support_selection(cast(GtkPrintOperation*)cPtr, supportSelection);
  }

  /**
      If track_status is true, the print operation will try to continue report
    on the status of the print job in the printer queues and printer. This
    can allow your application to show things like “out of paper” issues,
    and when the print job actually reaches the printer.
    
    This function is often implemented using some form of polling, so it should
    not be enabled unless needed.
    Params:
      trackStatus =       true to track status after printing
  */
  void setTrackPrintStatus(bool trackStatus)
  {
    gtk_print_operation_set_track_print_status(cast(GtkPrintOperation*)cPtr, trackStatus);
  }

  /**
      Sets up the transformation for the cairo context obtained from
    #GtkPrintContext in such a way that distances are measured in
    units of unit.
    Params:
      unit =       the unit to use
  */
  void setUnit(gtk.types.Unit unit)
  {
    gtk_print_operation_set_unit(cast(GtkPrintOperation*)cPtr, unit);
  }

  /**
      If full_page is true, the transformation for the cairo context
    obtained from #GtkPrintContext puts the origin at the top left
    corner of the page (which may not be the top left corner of the
    sheet, depending on page orientation and the number of pages per
    sheet). Otherwise, the origin is at the top left corner of the
    imageable area (i.e. inside the margins).
    Params:
      fullPage =       true to set up the #GtkPrintContext for the full page
  */
  void setUseFullPage(bool fullPage)
  {
    gtk_print_operation_set_use_full_page(cast(GtkPrintOperation*)cPtr, fullPage);
  }

  /**
      Emitted after the user has finished changing print settings
    in the dialog, before the actual rendering starts.
    
    A typical use for ::begin-print is to use the parameters from the
    #GtkPrintContext and paginate the document accordingly, and then
    set the number of pages with [gtk.print_operation.PrintOperation.setNPages].
  
    ## Parameters
    $(LIST
      * $(B context)       the #GtkPrintContext for the current operation
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias BeginPrintCallbackDlg = void delegate(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias BeginPrintCallbackFunc = void function(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to BeginPrint signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectBeginPrint(T)(T callback, Flag!"after" after = No.after)
  if (is(T : BeginPrintCallbackDlg) || is(T : BeginPrintCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      _dClosure.dlg(context, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("begin-print", closure, after);
  }

  /**
      Emitted when displaying the print dialog. If you return a
    widget in a handler for this signal it will be added to a custom
    tab in the print dialog. You typically return a container widget
    with multiple widgets in it.
    
    The print dialog owns the returned widget, and its lifetime is not
    controlled by the application. However, the widget is guaranteed
    to stay around until the #GtkPrintOperation::custom-widget-apply
    signal is emitted on the operation. Then you can read out any
    information you need from the widgets.
  
    ## Parameters
    $(LIST
      * $(B printOperation) the instance the signal is connected to
    )
    Returns:     A custom widget that gets embedded in
               the print dialog, or null
  */
  alias CreateCustomWidgetCallbackDlg = gobject.object.ObjectG delegate(gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias CreateCustomWidgetCallbackFunc = gobject.object.ObjectG function(gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to CreateCustomWidget signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectCreateCustomWidget(T)(T callback, Flag!"after" after = No.after)
  if (is(T : CreateCustomWidgetCallbackDlg) || is(T : CreateCustomWidgetCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto _retval = _dClosure.dlg(printOperation);
      setVal!gobject.object.ObjectG(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-custom-widget", closure, after);
  }

  /**
      Emitted right before #GtkPrintOperation::begin-print if you added
    a custom widget in the #GtkPrintOperation::create-custom-widget handler.
    When you get this signal you should read the information from the
    custom widgets, as the widgets are not guaraneed to be around at a
    later time.
  
    ## Parameters
    $(LIST
      * $(B widget)       the custom widget added in create-custom-widget
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias CustomWidgetApplyCallbackDlg = void delegate(gtk.widget.Widget widget, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias CustomWidgetApplyCallbackFunc = void function(gtk.widget.Widget widget, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to CustomWidgetApply signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectCustomWidgetApply(T)(T callback, Flag!"after" after = No.after)
  if (is(T : CustomWidgetApplyCallbackDlg) || is(T : CustomWidgetApplyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto widget = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      _dClosure.dlg(widget, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("custom-widget-apply", closure, after);
  }

  /**
      Emitted when the print operation run has finished doing
    everything required for printing.
    
    result gives you information about what happened during the run.
    If result is [gtk.types.PrintOperationResult.error] then you can call
    [gtk.print_operation.PrintOperation.getError] for more information.
    
    If you enabled print status tracking then
    [gtk.print_operation.PrintOperation.isFinished] may still return false
    after #GtkPrintOperation::done was emitted.
  
    ## Parameters
    $(LIST
      * $(B result)       the result of the print operation
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias DoneCallbackDlg = void delegate(gtk.types.PrintOperationResult result, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias DoneCallbackFunc = void function(gtk.types.PrintOperationResult result, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to Done signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDone(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DoneCallbackDlg) || is(T : DoneCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto result = getVal!(gtk.types.PrintOperationResult)(&_paramVals[1]);
      _dClosure.dlg(result, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("done", closure, after);
  }

  /**
      Emitted for every page that is printed. The signal handler
    must render the page_nr's page onto the cairo context obtained
    from context using [gtk.print_context.PrintContext.getCairoContext].
    ```c
    static void
    draw_page (GtkPrintOperation *operation,
               GtkPrintContext   *context,
               gint               page_nr,
               gpointer           user_data)
    {
      cairo_t *cr;
      PangoLayout *layout;
      gdouble width, text_height;
      gint layout_height;
      PangoFontDescription *desc;
      
      cr = gtk_print_context_get_cairo_context (context);
      width = gtk_print_context_get_width (context);
      
      cairo_rectangle (cr, 0, 0, width, HEADER_HEIGHT);
      
      cairo_set_source_rgb (cr, 0.8, 0.8, 0.8);
      cairo_fill (cr);
      
      layout = gtk_print_context_create_pango_layout (context);
      
      desc = pango_font_description_from_string ("sans 14");
      pango_layout_set_font_description (layout, desc);
      pango_font_description_free (desc);
      
      pango_layout_set_text (layout, "some text", -1);
      pango_layout_set_width (layout, width * PANGO_SCALE);
      pango_layout_set_alignment (layout, PANGO_ALIGN_CENTER);
         		      
      pango_layout_get_size (layout, NULL, &layout_height);
      text_height = (gdouble)layout_height / PANGO_SCALE;
      
      cairo_move_to (cr, width / 2,  (HEADER_HEIGHT - text_height) / 2);
      pango_cairo_show_layout (cr, layout);
      
      g_object_unref (layout);
    }
    ```
    
    Use [gtk.print_operation.PrintOperation.setUseFullPage] and
    [gtk.print_operation.PrintOperation.setUnit] before starting the print operation
    to set up the transformation of the cairo context according to your
    needs.
  
    ## Parameters
    $(LIST
      * $(B context)       the #GtkPrintContext for the current operation
      * $(B pageNr)       the number of the currently printed page (0-based)
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias DrawPageCallbackDlg = void delegate(gtk.print_context.PrintContext context, int pageNr, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias DrawPageCallbackFunc = void function(gtk.print_context.PrintContext context, int pageNr, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to DrawPage signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDrawPage(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DrawPageCallbackDlg) || is(T : DrawPageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      auto pageNr = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(context, pageNr, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("draw-page", closure, after);
  }

  /**
      Emitted after all pages have been rendered.
    A handler for this signal can clean up any resources that have
    been allocated in the #GtkPrintOperation::begin-print handler.
  
    ## Parameters
    $(LIST
      * $(B context)       the #GtkPrintContext for the current operation
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias EndPrintCallbackDlg = void delegate(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias EndPrintCallbackFunc = void function(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to EndPrint signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectEndPrint(T)(T callback, Flag!"after" after = No.after)
  if (is(T : EndPrintCallbackDlg) || is(T : EndPrintCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      _dClosure.dlg(context, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end-print", closure, after);
  }

  /**
      Emitted after the #GtkPrintOperation::begin-print signal, but before
    the actual rendering starts. It keeps getting emitted until a connected
    signal handler returns true.
    
    The ::paginate signal is intended to be used for paginating a document
    in small chunks, to avoid blocking the user interface for a long
    time. The signal handler should update the number of pages using
    [gtk.print_operation.PrintOperation.setNPages], and return true if the document
    has been completely paginated.
    
    If you don't need to do pagination in chunks, you can simply do
    it all in the ::begin-print handler, and set the number of pages
    from there.
  
    ## Parameters
    $(LIST
      * $(B context)       the #GtkPrintContext for the current operation
      * $(B printOperation) the instance the signal is connected to
    )
    Returns:     true if pagination is complete
  */
  alias PaginateCallbackDlg = bool delegate(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias PaginateCallbackFunc = bool function(gtk.print_context.PrintContext context, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to Paginate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPaginate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PaginateCallbackDlg) || is(T : PaginateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      _retval = _dClosure.dlg(context, printOperation);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paginate", closure, after);
  }

  /**
      Gets emitted when a preview is requested from the native dialog.
    
    The default handler for this signal uses an external viewer
    application to preview.
    
    To implement a custom print preview, an application must return
    true from its handler for this signal. In order to use the
    provided context for the preview implementation, it must be
    given a suitable cairo context with [gtk.print_context.PrintContext.setCairoContext].
    
    The custom preview implementation can use
    [gtk.print_operation_preview.PrintOperationPreview.isSelected] and
    [gtk.print_operation_preview.PrintOperationPreview.renderPage] to find pages which
    are selected for print and render them. The preview must be
    finished by calling [gtk.print_operation_preview.PrintOperationPreview.endPreview]
    (typically in response to the user clicking a close button).
  
    ## Parameters
    $(LIST
      * $(B preview)       the #GtkPrintOperationPreview for the current operation
      * $(B context)       the #GtkPrintContext that will be used
      * $(B parent)       the #GtkWindow to use as window parent, or null
      * $(B printOperation) the instance the signal is connected to
    )
    Returns:     true if the listener wants to take over control of the preview
  */
  alias PreviewCallbackDlg = bool delegate(gtk.print_operation_preview.PrintOperationPreview preview, gtk.print_context.PrintContext context, gtk.window.Window parent, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias PreviewCallbackFunc = bool function(gtk.print_operation_preview.PrintOperationPreview preview, gtk.print_context.PrintContext context, gtk.window.Window parent, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to Preview signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPreview(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PreviewCallbackDlg) || is(T : PreviewCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto preview = getVal!(gtk.print_operation_preview.PrintOperationPreview)(&_paramVals[1]);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[2]);
      auto parent = getVal!(gtk.window.Window)(&_paramVals[3]);
      _retval = _dClosure.dlg(preview, context, parent, printOperation);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preview", closure, after);
  }

  /**
      Emitted once for every page that is printed, to give
    the application a chance to modify the page setup. Any changes
    done to setup will be in force only for printing this page.
  
    ## Parameters
    $(LIST
      * $(B context)       the #GtkPrintContext for the current operation
      * $(B pageNr)       the number of the currently printed page (0-based)
      * $(B setup)       the #GtkPageSetup
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias RequestPageSetupCallbackDlg = void delegate(gtk.print_context.PrintContext context, int pageNr, gtk.page_setup.PageSetup setup, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias RequestPageSetupCallbackFunc = void function(gtk.print_context.PrintContext context, int pageNr, gtk.page_setup.PageSetup setup, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to RequestPageSetup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectRequestPageSetup(T)(T callback, Flag!"after" after = No.after)
  if (is(T : RequestPageSetupCallbackDlg) || is(T : RequestPageSetupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto context = getVal!(gtk.print_context.PrintContext)(&_paramVals[1]);
      auto pageNr = getVal!(int)(&_paramVals[2]);
      auto setup = getVal!(gtk.page_setup.PageSetup)(&_paramVals[3]);
      _dClosure.dlg(context, pageNr, setup, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-page-setup", closure, after);
  }

  /**
      Emitted at between the various phases of the print operation.
    See #GtkPrintStatus for the phases that are being discriminated.
    Use [gtk.print_operation.PrintOperation.getStatus] to find out the current
    status.
  
    ## Parameters
    $(LIST
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias StatusChangedCallbackDlg = void delegate(gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias StatusChangedCallbackFunc = void function(gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to StatusChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectStatusChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : StatusChangedCallbackDlg) || is(T : StatusChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      _dClosure.dlg(printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("status-changed", closure, after);
  }

  /**
      Emitted after change of selected printer. The actual page setup and
    print settings are passed to the custom widget, which can actualize
    itself according to this change.
  
    ## Parameters
    $(LIST
      * $(B widget)       the custom widget added in create-custom-widget
      * $(B setup)       actual page setup
      * $(B settings)       actual print settings
      * $(B printOperation) the instance the signal is connected to
    )
  */
  alias UpdateCustomWidgetCallbackDlg = void delegate(gtk.widget.Widget widget, gtk.page_setup.PageSetup setup, gtk.print_settings.PrintSettings settings, gtk.print_operation.PrintOperation printOperation);

  /** ditto */
  alias UpdateCustomWidgetCallbackFunc = void function(gtk.widget.Widget widget, gtk.page_setup.PageSetup setup, gtk.print_settings.PrintSettings settings, gtk.print_operation.PrintOperation printOperation);

  /**
    Connect to UpdateCustomWidget signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectUpdateCustomWidget(T)(T callback, Flag!"after" after = No.after)
  if (is(T : UpdateCustomWidgetCallbackDlg) || is(T : UpdateCustomWidgetCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto printOperation = getVal!(gtk.print_operation.PrintOperation)(_paramVals);
      auto widget = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      auto setup = getVal!(gtk.page_setup.PageSetup)(&_paramVals[2]);
      auto settings = getVal!(gtk.print_settings.PrintSettings)(&_paramVals[3]);
      _dClosure.dlg(widget, setup, settings, printOperation);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update-custom-widget", closure, after);
  }
}
