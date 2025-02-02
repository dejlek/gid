module Gio.FilenameCompleter;

import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Completes partial file and directory names given a partial string by
 * looking in the file system for clues. Can return a list of possible
 * completion strings for widget implementations.
 */
class FilenameCompleter : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_filename_completer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new filename completer.
   * Returns: a #GFilenameCompleter.
   */
  this()
  {
    GFilenameCompleter* _cretval;
    _cretval = g_filename_completer_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Obtains a completion for initial_text from completer.
   * Params:
   *   initialText = text to be completed.
   * Returns: a completed string, or %NULL if no
   *   completion exists. This string is not owned by GIO, so remember to [GLib.Global.gfree]
   *   it when finished.
   */
  string getCompletionSuffix(string initialText)
  {
    char* _cretval;
    const(char)* _initialText = initialText.toCString(No.Alloc);
    _cretval = g_filename_completer_get_completion_suffix(cast(GFilenameCompleter*)cPtr, _initialText);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets an array of completion strings for a given initial text.
   * Params:
   *   initialText = text to be completed.
   * Returns: array of strings with possible completions for initial_text.
   *   This array must be freed by [GLib.Global.strfreev] when finished.
   */
  string[] getCompletions(string initialText)
  {
    char** _cretval;
    const(char)* _initialText = initialText.toCString(No.Alloc);
    _cretval = g_filename_completer_get_completions(cast(GFilenameCompleter*)cPtr, _initialText);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * If dirs_only is %TRUE, completer will only
   * complete directory names, and not file names.
   * Params:
   *   dirsOnly = a #gboolean.
   */
  void setDirsOnly(bool dirsOnly)
  {
    g_filename_completer_set_dirs_only(cast(GFilenameCompleter*)cPtr, dirsOnly);
  }

  /**
   * Emitted when the file name completion information comes available.
   *   filenameCompleter = the instance the signal is connected to
   */
  alias GotCompletionDataCallbackDlg = void delegate(FilenameCompleter filenameCompleter);
  alias GotCompletionDataCallbackFunc = void function(FilenameCompleter filenameCompleter);

  /**
   * Connect to GotCompletionData signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotCompletionData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotCompletionDataCallbackDlg) || is(T : GotCompletionDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto filenameCompleter = getVal!FilenameCompleter(_paramVals);
      _dClosure.dlg(filenameCompleter);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-completion-data", closure, after);
  }
}
