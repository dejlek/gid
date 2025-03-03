module gdk.drag_context;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;

class DragContext : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_drag_context_get_type != &gidSymbolNotFound ? gdk_drag_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Determines the bitmask of actions proposed by the source if
   * [gdk.drag_context.DragContext.getSuggestedAction] returns %GDK_ACTION_ASK.
   * Returns: the #GdkDragAction flags
   */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_context_get_actions(cast(GdkDragContext*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
   * Returns the destination window for the DND operation.
   * Returns: a #GdkWindow
   */
  gdk.window.Window getDestWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drag_context_get_dest_window(cast(GdkDragContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the #GdkDevice associated to the drag context.
   * Returns: The #GdkDevice associated to context.
   */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_drag_context_get_device(cast(GdkDragContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the window on which the drag icon should be rendered
   * during the drag operation. Note that the window may not be
   * available until the drag operation has begun. GDK will move
   * the window in accordance with the ongoing drag operation.
   * The window is owned by context and will be destroyed when
   * the drag operation is over.
   * Returns: the drag window, or %NULL
   */
  gdk.window.Window getDragWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drag_context_get_drag_window(cast(GdkDragContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the drag protocol that is used by this context.
   * Returns: the drag protocol
   */
  gdk.types.DragProtocol getProtocol()
  {
    GdkDragProtocol _cretval;
    _cretval = gdk_drag_context_get_protocol(cast(GdkDragContext*)cPtr);
    gdk.types.DragProtocol _retval = cast(gdk.types.DragProtocol)_cretval;
    return _retval;
  }

  /**
   * Determines the action chosen by the drag destination.
   * Returns: a #GdkDragAction value
   */
  gdk.types.DragAction getSelectedAction()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_context_get_selected_action(cast(GdkDragContext*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
   * Returns the #GdkWindow where the DND operation started.
   * Returns: a #GdkWindow
   */
  gdk.window.Window getSourceWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_drag_context_get_source_window(cast(GdkDragContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Determines the suggested drag action of the context.
   * Returns: a #GdkDragAction value
   */
  gdk.types.DragAction getSuggestedAction()
  {
    GdkDragAction _cretval;
    _cretval = gdk_drag_context_get_suggested_action(cast(GdkDragContext*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
   * Requests the drag and drop operation to be managed by context.
   * When a drag and drop operation becomes managed, the #GdkDragContext
   * will internally handle all input and source-side #GdkEventDND events
   * as required by the windowing system.
   * Once the drag and drop operation is managed, the drag context will
   * emit the following signals:
   * - The #GdkDragContext::action-changed signal whenever the final action
   * to be performed by the drag and drop operation changes.
   * - The #GdkDragContext::drop-performed signal after the user performs
   * the drag and drop gesture $(LPAREN)typically by releasing the mouse button$(RPAREN).
   * - The #GdkDragContext::dnd-finished signal after the drag and drop
   * operation concludes $(LPAREN)after all #GdkSelection transfers happen$(RPAREN).
   * - The #GdkDragContext::cancel signal if the drag and drop operation is
   * finished but doesn't happen over an accepting destination, or is
   * cancelled through other means.
   * Params:
   *   ipcWindow = Window to use for IPC messaging/events
   *   actions = the actions supported by the drag source
   * Returns: #TRUE if the drag and drop operation is managed.
   */
  bool manageDnd(gdk.window.Window ipcWindow, gdk.types.DragAction actions)
  {
    bool _retval;
    _retval = gdk_drag_context_manage_dnd(cast(GdkDragContext*)cPtr, ipcWindow ? cast(GdkWindow*)ipcWindow.cPtr(No.Dup) : null, actions);
    return _retval;
  }

  /**
   * Associates a #GdkDevice to context, so all Drag and Drop events
   * for context are emitted as if they came from this device.
   * Params:
   *   device = a #GdkDevice
   */
  void setDevice(gdk.device.Device device)
  {
    gdk_drag_context_set_device(cast(GdkDragContext*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null);
  }

  /**
   * Sets the position of the drag window that will be kept
   * under the cursor hotspot. Initially, the hotspot is at the
   * top left corner of the drag window.
   * Params:
   *   hotX = x coordinate of the drag window hotspot
   *   hotY = y coordinate of the drag window hotspot
   */
  void setHotspot(int hotX, int hotY)
  {
    gdk_drag_context_set_hotspot(cast(GdkDragContext*)cPtr, hotX, hotY);
  }

  /**
   * A new action is being chosen for the drag and drop operation.
   * This signal will only be emitted if the #GdkDragContext manages
   * the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
   * for more information.
   * Params
   *   action = The action currently chosen
   *   dragContext = the instance the signal is connected to
   */
  alias ActionChangedCallbackDlg = void delegate(gdk.types.DragAction action, gdk.drag_context.DragContext dragContext);
  alias ActionChangedCallbackFunc = void function(gdk.types.DragAction action, gdk.drag_context.DragContext dragContext);

  /**
   * Connect to ActionChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActionChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActionChangedCallbackDlg) || is(T : ActionChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragContext = getVal!(gdk.drag_context.DragContext)(_paramVals);
      auto action = getVal!(gdk.types.DragAction)(&_paramVals[1]);
      _dClosure.dlg(action, dragContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("action-changed", closure, after);
  }

  /**
   * The drag and drop operation was cancelled.
   * This signal will only be emitted if the #GdkDragContext manages
   * the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
   * for more information.
   * Params
   *   reason = The reason the context was cancelled
   *   dragContext = the instance the signal is connected to
   */
  alias CancelCallbackDlg = void delegate(gdk.types.DragCancelReason reason, gdk.drag_context.DragContext dragContext);
  alias CancelCallbackFunc = void function(gdk.types.DragCancelReason reason, gdk.drag_context.DragContext dragContext);

  /**
   * Connect to Cancel signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCancel(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CancelCallbackDlg) || is(T : CancelCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragContext = getVal!(gdk.drag_context.DragContext)(_paramVals);
      auto reason = getVal!(gdk.types.DragCancelReason)(&_paramVals[1]);
      _dClosure.dlg(reason, dragContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancel", closure, after);
  }

  /**
   * The drag and drop operation was finished, the drag destination
   * finished reading all data. The drag source can now free all
   * miscellaneous data.
   * This signal will only be emitted if the #GdkDragContext manages
   * the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
   * for more information.
   *   dragContext = the instance the signal is connected to
   */
  alias DndFinishedCallbackDlg = void delegate(gdk.drag_context.DragContext dragContext);
  alias DndFinishedCallbackFunc = void function(gdk.drag_context.DragContext dragContext);

  /**
   * Connect to DndFinished signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDndFinished(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DndFinishedCallbackDlg) || is(T : DndFinishedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragContext = getVal!(gdk.drag_context.DragContext)(_paramVals);
      _dClosure.dlg(dragContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("dnd-finished", closure, after);
  }

  /**
   * The drag and drop operation was performed on an accepting client.
   * This signal will only be emitted if the #GdkDragContext manages
   * the drag and drop operation. See [gdk.drag_context.DragContext.manageDnd]
   * for more information.
   * Params
   *   time = the time at which the drop happened.
   *   dragContext = the instance the signal is connected to
   */
  alias DropPerformedCallbackDlg = void delegate(int time, gdk.drag_context.DragContext dragContext);
  alias DropPerformedCallbackFunc = void function(int time, gdk.drag_context.DragContext dragContext);

  /**
   * Connect to DropPerformed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDropPerformed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DropPerformedCallbackDlg) || is(T : DropPerformedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragContext = getVal!(gdk.drag_context.DragContext)(_paramVals);
      auto time = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(time, dragContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop-performed", closure, after);
  }
}
