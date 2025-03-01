module gtksource.vim_imcontext;

import gid.global;
import gobject.dclosure;
import gtk.imcontext;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
 * Vim emulation.
 * The `GtkSourceVimIMContext` is a [gtk.imcontext.IMContext] implementation that can
 * be used to provide Vim-like editing controls within a class@View.
 * The `GtkSourceViMIMContext` will process incoming [gdk.key_event.KeyEvent] as the
 * user types. It should be used in conjunction with a [gtk.event_controller_key.EventControllerKey].
 * Various features supported by `GtkSourceVimIMContext` include:
 * - Normal, Insert, Replace, Visual, and Visual Line modes
 * - Support for an integrated command bar and current command preview
 * - Search and replace
 * - Motions and Text Objects
 * - History replay
 * - Jumplists within the current file
 * - Registers including the system and primary clipboards
 * - Creation and motion to marks
 * - Some commonly used Vim commands
 * It is recommended that applications display the contents of
 * property@VimIMContext:command-bar-text and
 * property@VimIMContext:command-text to the user as they represent the
 * command-bar and current command preview found in Vim.
 * `GtkSourceVimIMContext` attempts to work with additional [gtk.imcontext.IMContext]
 * implementations such as IBus by querying the [gtk.text_view.TextView] before processing
 * the command in states which support it $(LPAREN)notably Insert and Replace modes$(RPAREN).
 * ```c
 * GtkEventController *key;
 * GtkIMContext *im_context;
 * GtkWidget *view;
 * view \= gtk_source_view_new $(LPAREN)$(RPAREN);
 * im_context \= gtk_source_vim_im_context_new $(LPAREN)$(RPAREN);
 * key \= gtk_event_controller_key_new $(LPAREN)$(RPAREN);
 * gtk_event_controller_key_set_im_context $(LPAREN)GTK_EVENT_CONTROLLER_KEY $(LPAREN)key$(RPAREN), im_context$(RPAREN);
 * gtk_event_controller_set_propagation_phase $(LPAREN)key, GTK_PHASE_CAPTURE$(RPAREN);
 * gtk_widget_add_controller $(LPAREN)view, key$(RPAREN);
 * gtk_im_context_set_client_widget $(LPAREN)im_context, view$(RPAREN);
 * g_object_bind_property $(LPAREN)im_context, "command-bar-text", command_bar_label, "label", 0$(RPAREN);
 * g_object_bind_property $(LPAREN)im_context, "command-text", command_label, "label", 0$(RPAREN);
 * ```
 */
class VimIMContext : IMContext
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_vim_im_context_get_type != &gidSymbolNotFound ? gtk_source_vim_im_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GtkIMContext* _cretval;
    _cretval = gtk_source_vim_im_context_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Executes command as if it was typed into the command bar by the
   * user except that this does not emit the
   * signalVimIMContext::execute-command signal.
   * Params:
   *   command = the command text
   */
  void executeCommand(string command)
  {
    const(char)* _command = command.toCString(No.Alloc);
    gtk_source_vim_im_context_execute_command(cast(GtkSourceVimIMContext*)cPtr, _command);
  }

  /**
   * Gets the current command-bar text as it is entered by the user.
   * Returns: A string containing the command-bar text
   */
  string getCommandBarText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_vim_im_context_get_command_bar_text(cast(GtkSourceVimIMContext*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the current command text as it is entered by the user.
   * Returns: A string containing the command text
   */
  string getCommandText()
  {
    const(char)* _cretval;
    _cretval = gtk_source_vim_im_context_get_command_text(cast(GtkSourceVimIMContext*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Requests the application open the file found at path.
   * If path is %NULL, then the current file should be reloaded from storage.
   * This may be executed in relation to the user running the
   * `:edit` or `:e` commands.
   * Params
   *   view = the #GtkSourceView
   *   path = the path if provided, otherwise %NULL
   *   vimIMContext = the instance the signal is connected to
   */
  alias EditCallbackDlg = void delegate(View view, string path, VimIMContext vimIMContext);
  alias EditCallbackFunc = void function(View view, string path, VimIMContext vimIMContext);

  /**
   * Connect to Edit signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEdit(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EditCallbackDlg) || is(T : EditCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto vimIMContext = getVal!VimIMContext(_paramVals);
      auto view = getVal!View(&_paramVals[1]);
      auto path = getVal!string(&_paramVals[2]);
      _dClosure.dlg(view, path, vimIMContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("edit", closure, after);
  }

  /**
   * The signal is emitted when a command should be
   * executed. This might be something like `:wq` or `:e <path>`.
   * If the application chooses to implement this, it should return
   * %TRUE from this signal to indicate the command has been handled.
   * Params
   *   command = the command to execute
   *   vimIMContext = the instance the signal is connected to
   * Returns: %TRUE if handled; otherwise %FALSE.
   */
  alias ExecuteCommandCallbackDlg = bool delegate(string command, VimIMContext vimIMContext);
  alias ExecuteCommandCallbackFunc = bool function(string command, VimIMContext vimIMContext);

  /**
   * Connect to ExecuteCommand signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectExecuteCommand(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ExecuteCommandCallbackDlg) || is(T : ExecuteCommandCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto vimIMContext = getVal!VimIMContext(_paramVals);
      auto command = getVal!string(&_paramVals[1]);
      _retval = _dClosure.dlg(command, vimIMContext);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("execute-command", closure, after);
  }

  /**
   * Requests that the application format the text between
   * begin and end.
   * Params
   *   begin = the start location
   *   end = the end location
   *   vimIMContext = the instance the signal is connected to
   */
  alias FormatTextCallbackDlg = void delegate(TextIter begin, TextIter end, VimIMContext vimIMContext);
  alias FormatTextCallbackFunc = void function(TextIter begin, TextIter end, VimIMContext vimIMContext);

  /**
   * Connect to FormatText signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectFormatText(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FormatTextCallbackDlg) || is(T : FormatTextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto vimIMContext = getVal!VimIMContext(_paramVals);
      auto begin = getVal!TextIter(&_paramVals[1]);
      auto end = getVal!TextIter(&_paramVals[2]);
      _dClosure.dlg(begin, end, vimIMContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("format-text", closure, after);
  }

  /**
   * Requests the application save the file.
   * If a filename was provided, it will be available to the signal handler as path.
   * This may be executed in relation to the user running the `:write` or `:w` commands.
   * Params
   *   view = the #GtkSourceView
   *   path = the path if provided, otherwise %NULL
   *   vimIMContext = the instance the signal is connected to
   */
  alias WriteCallbackDlg = void delegate(View view, string path, VimIMContext vimIMContext);
  alias WriteCallbackFunc = void function(View view, string path, VimIMContext vimIMContext);

  /**
   * Connect to Write signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWrite(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WriteCallbackDlg) || is(T : WriteCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto vimIMContext = getVal!VimIMContext(_paramVals);
      auto view = getVal!View(&_paramVals[1]);
      auto path = getVal!string(&_paramVals[2]);
      _dClosure.dlg(view, path, vimIMContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("write", closure, after);
  }
}
