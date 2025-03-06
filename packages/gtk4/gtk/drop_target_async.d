module gtk.drop_target_async;

import gdk.content_formats;
import gdk.drop;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.drop_target_async.DropTargetAsync] is an event controller to receive Drag-and-Drop
  operations, asynchronously.
  
  It is the more complete but also more complex method of handling drop
  operations compared to [gtk.drop_target.DropTarget], and you should only use
  it if [gtk.drop_target.DropTarget] doesn't provide all the features you need.
  
  To use a [gtk.drop_target_async.DropTargetAsync] to receive drops on a widget, you create
  a [gtk.drop_target_async.DropTargetAsync] object, configure which data formats and actions
  you support, connect to its signals, and then attach it to the widget
  with [gtk.widget.Widget.addController].
  
  During a drag operation, the first signal that a [gtk.drop_target_async.DropTargetAsync]
  emits is [gtk.drop_target_async.DropTargetAsync.accept], which is meant to determine
  whether the target is a possible drop site for the ongoing drop. The
  default handler for the ::accept signal accepts the drop if it finds
  a compatible data format and an action that is supported on both sides.
  
  If it is, and the widget becomes a target, you will receive a
  `signal@Gtk.DropTargetAsync::drag-enter` signal, followed by
  `signal@Gtk.DropTargetAsync::drag-motion` signals as the pointer moves,
  optionally a [gtk.drop_target_async.DropTargetAsync.drop] signal when a drop happens,
  and finally a `signal@Gtk.DropTargetAsync::drag-leave` signal when the
  pointer moves off the widget.
  
  The ::drag-enter and ::drag-motion handler return a [gdk.types.DragAction]
  to update the status of the ongoing operation. The ::drop handler
  should decide if it ultimately accepts the drop and if it does, it
  should initiate the data transfer and finish the operation by calling
  [gdk.drop.Drop.finish].
  
  Between the ::drag-enter and ::drag-leave signals the widget is a
  current drop target, and will receive the [gtk.types.StateFlags.DropActive]
  state, which can be used by themes to style the widget as a drop target.
*/
class DropTargetAsync : gtk.event_controller.EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drop_target_async_get_type != &gidSymbolNotFound ? gtk_drop_target_async_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a new [gtk.drop_target_async.DropTargetAsync] object.
    Params:
      formats =       the supported data formats
      actions =       the supported actions
    Returns:     the new [gtk.drop_target_async.DropTargetAsync]
  */
  this(gdk.content_formats.ContentFormats formats, gdk.types.DragAction actions)
  {
    GtkDropTargetAsync* _cretval;
    _cretval = gtk_drop_target_async_new(formats ? cast(GdkContentFormats*)formats.cPtr(Yes.Dup) : null, actions);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the actions that this drop target supports.
    Returns:     the actions that this drop target supports
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gtk_drop_target_async_get_actions(cast(GtkDropTargetAsync*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets the data formats that this drop target accepts.
    
    If the result is null, all formats are expected to be supported.
    Returns:     the supported data formats
  */
  gdk.content_formats.ContentFormats getFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gtk_drop_target_async_get_formats(cast(GtkDropTargetAsync*)cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets the drop as not accepted on this drag site.
    
    This function should be used when delaying the decision
    on whether to accept a drag or not until after reading
    the data.
    Params:
      drop =       the [gdk.drop.Drop] of an ongoing drag operation
  */
  void rejectDrop(gdk.drop.Drop drop)
  {
    gtk_drop_target_async_reject_drop(cast(GtkDropTargetAsync*)cPtr, drop ? cast(GdkDrop*)drop.cPtr(No.Dup) : null);
  }

  /**
      Sets the actions that this drop target supports.
    Params:
      actions =       the supported actions
  */
  void setActions(gdk.types.DragAction actions)
  {
    gtk_drop_target_async_set_actions(cast(GtkDropTargetAsync*)cPtr, actions);
  }

  /**
      Sets the data formats that this drop target will accept.
    Params:
      formats =       the supported data formats or null for any format
  */
  void setFormats(gdk.content_formats.ContentFormats formats = null)
  {
    gtk_drop_target_async_set_formats(cast(GtkDropTargetAsync*)cPtr, formats ? cast(GdkContentFormats*)formats.cPtr(No.Dup) : null);
  }

  /**
      Emitted on the drop site when a drop operation is about to begin.
    
    If the drop is not accepted, false will be returned and the drop target
    will ignore the drop. If true is returned, the drop is accepted for now
    but may be rejected later via a call to [gtk.drop_target_async.DropTargetAsync.rejectDrop]
    or ultimately by returning false from a [gtk.drop_target_async.DropTargetAsync.drop]
    handler.
    
    The default handler for this signal decides whether to accept the drop
    based on the formats provided by the drop.
    
    If the decision whether the drop will be accepted or rejected needs
    further processing, such as inspecting the data, this function should
    return true and proceed as is drop was accepted and if it decides to
    reject the drop later, it should call [gtk.drop_target_async.DropTargetAsync.rejectDrop].
  
    ## Parameters
    $(LIST
      * $(B drop)       the [gdk.drop.Drop]
      * $(B dropTargetAsync) the instance the signal is connected to
    )
    Returns:     true if drop is accepted
  */
  alias AcceptCallbackDlg = bool delegate(gdk.drop.Drop drop, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /** ditto */
  alias AcceptCallbackFunc = bool function(gdk.drop.Drop drop, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /**
    Connect to Accept signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAccept(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AcceptCallbackDlg) || is(T : AcceptCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto dropTargetAsync = getVal!(gtk.drop_target_async.DropTargetAsync)(_paramVals);
      auto drop = getVal!(gdk.drop.Drop)(&_paramVals[1]);
      _retval = _dClosure.dlg(drop, dropTargetAsync);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept", closure, after);
  }

  /**
      Emitted on the drop site when the pointer enters the widget.
    
    It can be used to set up custom highlighting.
  
    ## Parameters
    $(LIST
      * $(B drop)       the [gdk.drop.Drop]
      * $(B x)       the x coordinate of the current pointer position
      * $(B y)       the y coordinate of the current pointer position
      * $(B dropTargetAsync) the instance the signal is connected to
    )
    Returns:     Preferred action for this drag operation.
  */
  alias DragEnterCallbackDlg = gdk.types.DragAction delegate(gdk.drop.Drop drop, double x, double y, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /** ditto */
  alias DragEnterCallbackFunc = gdk.types.DragAction function(gdk.drop.Drop drop, double x, double y, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /**
    Connect to DragEnter signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragEnter(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragEnterCallbackDlg) || is(T : DragEnterCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropTargetAsync = getVal!(gtk.drop_target_async.DropTargetAsync)(_paramVals);
      auto drop = getVal!(gdk.drop.Drop)(&_paramVals[1]);
      auto x = getVal!(double)(&_paramVals[2]);
      auto y = getVal!(double)(&_paramVals[3]);
      auto _dretval = _dClosure.dlg(drop, x, y, dropTargetAsync);
      GdkDragAction _retval = cast(GdkDragAction)_dretval;
      setVal!gdk.types.DragAction(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-enter", closure, after);
  }

  /**
      Emitted on the drop site when the pointer leaves the widget.
    
    Its main purpose it to undo things done in
    [gtk.drop_target_async.DropTargetAsync]::drag-enter.
  
    ## Parameters
    $(LIST
      * $(B drop)       the [gdk.drop.Drop]
      * $(B dropTargetAsync) the instance the signal is connected to
    )
  */
  alias DragLeaveCallbackDlg = void delegate(gdk.drop.Drop drop, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /** ditto */
  alias DragLeaveCallbackFunc = void function(gdk.drop.Drop drop, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /**
    Connect to DragLeave signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragLeave(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragLeaveCallbackDlg) || is(T : DragLeaveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropTargetAsync = getVal!(gtk.drop_target_async.DropTargetAsync)(_paramVals);
      auto drop = getVal!(gdk.drop.Drop)(&_paramVals[1]);
      _dClosure.dlg(drop, dropTargetAsync);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-leave", closure, after);
  }

  /**
      Emitted while the pointer is moving over the drop target.
  
    ## Parameters
    $(LIST
      * $(B drop)       the [gdk.drop.Drop]
      * $(B x)       the x coordinate of the current pointer position
      * $(B y)       the y coordinate of the current pointer position
      * $(B dropTargetAsync) the instance the signal is connected to
    )
    Returns:     Preferred action for this drag operation.
  */
  alias DragMotionCallbackDlg = gdk.types.DragAction delegate(gdk.drop.Drop drop, double x, double y, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /** ditto */
  alias DragMotionCallbackFunc = gdk.types.DragAction function(gdk.drop.Drop drop, double x, double y, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /**
    Connect to DragMotion signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragMotion(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragMotionCallbackDlg) || is(T : DragMotionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropTargetAsync = getVal!(gtk.drop_target_async.DropTargetAsync)(_paramVals);
      auto drop = getVal!(gdk.drop.Drop)(&_paramVals[1]);
      auto x = getVal!(double)(&_paramVals[2]);
      auto y = getVal!(double)(&_paramVals[3]);
      auto _dretval = _dClosure.dlg(drop, x, y, dropTargetAsync);
      GdkDragAction _retval = cast(GdkDragAction)_dretval;
      setVal!gdk.types.DragAction(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-motion", closure, after);
  }

  /**
      Emitted on the drop site when the user drops the data onto the widget.
    
    The signal handler must determine whether the pointer position is in a
    drop zone or not. If it is not in a drop zone, it returns false and no
    further processing is necessary.
    
    Otherwise, the handler returns true. In this case, this handler will
    accept the drop. The handler must ensure that [gdk.drop.Drop.finish]
    is called to let the source know that the drop is done. The call to
    [gdk.drop.Drop.finish] must only be done when all data has been received.
    
    To receive the data, use one of the read functions provided by
    [gdk.drop.Drop] such as [gdk.drop.Drop.readAsync] or
    [gdk.drop.Drop.readValueAsync].
  
    ## Parameters
    $(LIST
      * $(B drop)       the [gdk.drop.Drop]
      * $(B x)       the x coordinate of the current pointer position
      * $(B y)       the y coordinate of the current pointer position
      * $(B dropTargetAsync) the instance the signal is connected to
    )
    Returns:     whether the drop is accepted at the given pointer position
  */
  alias DropCallbackDlg = bool delegate(gdk.drop.Drop drop, double x, double y, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /** ditto */
  alias DropCallbackFunc = bool function(gdk.drop.Drop drop, double x, double y, gtk.drop_target_async.DropTargetAsync dropTargetAsync);

  /**
    Connect to Drop signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDrop(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DropCallbackDlg) || is(T : DropCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto dropTargetAsync = getVal!(gtk.drop_target_async.DropTargetAsync)(_paramVals);
      auto drop = getVal!(gdk.drop.Drop)(&_paramVals[1]);
      auto x = getVal!(double)(&_paramVals[2]);
      auto y = getVal!(double)(&_paramVals[3]);
      _retval = _dClosure.dlg(drop, x, y, dropTargetAsync);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop", closure, after);
  }
}
