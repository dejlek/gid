module atk.window;

public import atk.window_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.dclosure;

/**
 * The ATK Interface provided by UI components that represent a top-level window.
 * #AtkWindow should be implemented by the UI elements that represent
 * a top-level window, such as the main window of an application or
 * dialog.
 * See class@AtkObject
 */
interface Window
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_window_get_type != &gidSymbolNotFound ? atk_window_get_type() : cast(GType)0;
  }

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
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc));

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
  if (is(T : CreateCallbackDlg) || is(T : CreateCallbackFunc));

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
  if (is(T : DeactivateCallbackDlg) || is(T : DeactivateCallbackFunc));

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
  if (is(T : DestroyCallbackDlg) || is(T : DestroyCallbackFunc));

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
  if (is(T : MaximizeCallbackDlg) || is(T : MaximizeCallbackFunc));

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
  if (is(T : MinimizeCallbackDlg) || is(T : MinimizeCallbackFunc));

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
  if (is(T : MoveCallbackDlg) || is(T : MoveCallbackFunc));

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
  if (is(T : ResizeCallbackDlg) || is(T : ResizeCallbackFunc));

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
  if (is(T : RestoreCallbackDlg) || is(T : RestoreCallbackFunc));
  }
