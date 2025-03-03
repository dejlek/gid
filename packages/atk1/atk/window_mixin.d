module atk.window_mixin;

public import atk.window_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.types;
public import gid.gid;
public import gobject.dclosure;

/**
 * The ATK Interface provided by UI components that represent a top-level window.
 * #AtkWindow should be implemented by the UI elements that represent
 * a top-level window, such as the main window of an application or
 * dialog.
 * See class@AtkObject
 */
template WindowT()
{

  /**
   * The signal #AtkWindow::activate is emitted when a window
   * becomes the active window of the application or session.
   *   window = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(atk.window.Window window);
  alias ActivateCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
   * The signal #AtkWindow::create is emitted when a new window
   * is created.
   *   window = the instance the signal is connected to
   */
  alias CreateCallbackDlg = void delegate(atk.window.Window window);
  alias CreateCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Create signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCreate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CreateCallbackDlg) || is(T : CreateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create", closure, after);
  }

  /**
   * The signal #AtkWindow::deactivate is emitted when a window is
   * no longer the active window of the application or session.
   *   window = the instance the signal is connected to
   */
  alias DeactivateCallbackDlg = void delegate(atk.window.Window window);
  alias DeactivateCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Deactivate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDeactivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeactivateCallbackDlg) || is(T : DeactivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deactivate", closure, after);
  }

  /**
   * The signal #AtkWindow::destroy is emitted when a window is
   * destroyed.
   *   window = the instance the signal is connected to
   */
  alias DestroyCallbackDlg = void delegate(atk.window.Window window);
  alias DestroyCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Destroy signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDestroy(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DestroyCallbackDlg) || is(T : DestroyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("destroy", closure, after);
  }

  /**
   * The signal #AtkWindow::maximize is emitted when a window
   * is maximized.
   *   window = the instance the signal is connected to
   */
  alias MaximizeCallbackDlg = void delegate(atk.window.Window window);
  alias MaximizeCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Maximize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMaximize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MaximizeCallbackDlg) || is(T : MaximizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("maximize", closure, after);
  }

  /**
   * The signal #AtkWindow::minimize is emitted when a window
   * is minimized.
   *   window = the instance the signal is connected to
   */
  alias MinimizeCallbackDlg = void delegate(atk.window.Window window);
  alias MinimizeCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Minimize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMinimize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MinimizeCallbackDlg) || is(T : MinimizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("minimize", closure, after);
  }

  /**
   * The signal #AtkWindow::move is emitted when a window
   * is moved.
   *   window = the instance the signal is connected to
   */
  alias MoveCallbackDlg = void delegate(atk.window.Window window);
  alias MoveCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Move signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMove(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveCallbackDlg) || is(T : MoveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move", closure, after);
  }

  /**
   * The signal #AtkWindow::resize is emitted when a window
   * is resized.
   *   window = the instance the signal is connected to
   */
  alias ResizeCallbackDlg = void delegate(atk.window.Window window);
  alias ResizeCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Resize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectResize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ResizeCallbackDlg) || is(T : ResizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize", closure, after);
  }

  /**
   * The signal #AtkWindow::restore is emitted when a window
   * is restored.
   *   window = the instance the signal is connected to
   */
  alias RestoreCallbackDlg = void delegate(atk.window.Window window);
  alias RestoreCallbackFunc = void function(atk.window.Window window);

  /**
   * Connect to Restore signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRestore(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RestoreCallbackDlg) || is(T : RestoreCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto window = getVal!(atk.window.Window)(_paramVals);
      _dClosure.dlg(window);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("restore", closure, after);
  }
}
