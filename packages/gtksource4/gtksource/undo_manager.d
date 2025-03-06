module gtksource.undo_manager;

public import gtksource.undo_manager_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
interface UndoManager
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_undo_manager_get_type != &gidSymbolNotFound ? gtk_source_undo_manager_get_type() : cast(GType)0;
  }

  /**
      Begin a not undoable action on the buffer. All changes between this call
    and the call to [gtksource.undo_manager.UndoManager.endNotUndoableAction] cannot
    be undone. This function should be re-entrant.
  */
  void beginNotUndoableAction();

  /**
      Get whether there are redo operations available.
    Returns:     true if there are redo operations available, false otherwise
  */
  bool canRedo();

  /**
      Emits the #GtkSourceUndoManager::can-redo-changed signal.
  */
  void canRedoChanged();

  /**
      Get whether there are undo operations available.
    Returns:     true if there are undo operations available, false otherwise
  */
  bool canUndo();

  /**
      Emits the #GtkSourceUndoManager::can-undo-changed signal.
  */
  void canUndoChanged();

  /**
      Ends a not undoable action on the buffer.
  */
  void endNotUndoableAction();

  /**
      Perform a single redo. Calling this function when there are no redo operations
    available is an error. Use [gtksource.undo_manager.UndoManager.canRedo] to find out
    if there are redo operations available.
  */
  void redo();

  /**
      Perform a single undo. Calling this function when there are no undo operations
    available is an error. Use [gtksource.undo_manager.UndoManager.canUndo] to find out
    if there are undo operations available.
  */
  void undo();

  /**
      Emitted when the ability to redo has changed.
  
    ## Parameters
    $(LIST
      * $(B undoManager) the instance the signal is connected to
    )
  */
  alias CanRedoChangedCallbackDlg = void delegate(gtksource.undo_manager.UndoManager undoManager);

  /** ditto */
  alias CanRedoChangedCallbackFunc = void function(gtksource.undo_manager.UndoManager undoManager);

  /**
    Connect to CanRedoChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCanRedoChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CanRedoChangedCallbackDlg) || is(T : CanRedoChangedCallbackFunc));

  /**
      Emitted when the ability to undo has changed.
  
    ## Parameters
    $(LIST
      * $(B undoManager) the instance the signal is connected to
    )
  */
  alias CanUndoChangedCallbackDlg = void delegate(gtksource.undo_manager.UndoManager undoManager);

  /** ditto */
  alias CanUndoChangedCallbackFunc = void function(gtksource.undo_manager.UndoManager undoManager);

  /**
    Connect to CanUndoChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCanUndoChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CanUndoChangedCallbackDlg) || is(T : CanUndoChangedCallbackFunc));
  }
