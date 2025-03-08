module gtk.drop_target;

import gdk.content_formats;
import gdk.drop;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.drop_target.DropTarget] is an event controller to receive Drag-and-Drop operations.
  
  The most basic way to use a [gtk.drop_target.DropTarget] to receive drops on a
  widget is to create it via [gtk.drop_target.DropTarget.new_], passing in the
  [gobject.types.TYPE_FLAG_RESERVED_ID_BIT] of the data you want to receive and connect to the
  [gtk.drop_target.DropTarget.drop] signal to receive the data:
  
  ```c
  static gboolean
  on_drop (GtkDropTarget *target,
           const GValue  *value,
           double         x,
           double         y,
           gpointer       data)
  {
    MyWidget *self = data;
  
    // Call the appropriate setter depending on the type of data
    // that we received
    if (G_VALUE_HOLDS (value, G_TYPE_FILE))
      my_widget_set_file (self, g_value_get_object (value));
    else if (G_VALUE_HOLDS (value, GDK_TYPE_PIXBUF))
      my_widget_set_pixbuf (self, g_value_get_object (value));
    else
      return FALSE;
  
    return TRUE;
  }
  
  static void
  my_widget_init (MyWidget *self)
  {
    GtkDropTarget *target =
      gtk_drop_target_new (G_TYPE_INVALID, GDK_ACTION_COPY);
  
    // This widget accepts two types of drop types: GFile objects
    // and GdkPixbuf objects
    gtk_drop_target_set_gtypes (target, (GType [2]) {
      G_TYPE_FILE,
      GDK_TYPE_PIXBUF,
    }, 2);
  
    g_signal_connect (target, "drop", G_CALLBACK (on_drop), self);
    gtk_widget_add_controller (GTK_WIDGET (self), GTK_EVENT_CONTROLLER (target));
  }
  ```
  
  [gtk.drop_target.DropTarget] supports more options, such as:
  
   $(LIST
      * rejecting potential drops via the [gtk.drop_target.DropTarget.accept] signal
        and the [gtk.drop_target.DropTarget.reject] function to let other drop
        targets handle the drop
      * tracking an ongoing drag operation before the drop via the
        [gtk.drop_target.DropTarget.enter], [gtk.drop_target.DropTarget.motion] and
        [gtk.drop_target.DropTarget.leave] signals
      * configuring how to receive data by setting the
        [gtk.drop_target.DropTarget.gboolean] property and listening for its
        availability via the [gtk.drop_target.DropTarget.GObject.Value] property
   )
     
  However, [gtk.drop_target.DropTarget] is ultimately modeled in a synchronous way
  and only supports data transferred via [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]. If you want full control
  over an ongoing drop, the [gtk.drop_target_async.DropTargetAsync] object gives you
  this ability.
  
  While a pointer is dragged over the drop target's widget and the drop
  has not been rejected, that widget will receive the
  [gtk.types.StateFlags.DropActive] state, which can be used to style the widget.
  
  If you are not interested in receiving the drop, but just want to update
  UI state during a Drag-and-Drop operation (e.g. switching tabs), you can
  use [gtk.drop_controller_motion.DropControllerMotion].
*/
class DropTarget : gtk.event_controller.EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drop_target_get_type != &gidSymbolNotFound ? gtk_drop_target_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.drop_target.DropTarget] object.
    
    If the drop target should support more than 1 type, pass
    `G_TYPE_INVALID` for type and then call
    [gtk.drop_target.DropTarget.setGtypes].
    Params:
      type =       The supported type or `G_TYPE_INVALID`
      actions =       the supported actions
    Returns:     the new [gtk.drop_target.DropTarget]
  */
  this(gobject.types.GType type, gdk.types.DragAction actions)
  {
    GtkDropTarget* _cretval;
    _cretval = gtk_drop_target_new(type, actions);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the actions that this drop target supports.
    Returns:     the actions that this drop target supports
  */
  gdk.types.DragAction getActions()
  {
    GdkDragAction _cretval;
    _cretval = gtk_drop_target_get_actions(cast(GtkDropTarget*)cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets the currently handled drop operation.
    
    If no drop operation is going on, null is returned.
    Returns:     The current drop
  */
  gdk.drop.Drop getCurrentDrop()
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_target_get_current_drop(cast(GtkDropTarget*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently handled drop operation.
    
    If no drop operation is going on, null is returned.
    Returns:     The current drop
  
    Deprecated:     Use [gtk.drop_target.DropTarget.getCurrentDrop] instead
  */
  gdk.drop.Drop getDrop()
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_target_get_drop(cast(GtkDropTarget*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.drop.Drop)(cast(GdkDrop*)_cretval, No.Take);
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
    _cretval = gtk_drop_target_get_formats(cast(GtkDropTarget*)cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the list of supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s that can be dropped on the target.
    
    If no types have been set, `NULL` will be returned.
    Returns:     the `G_TYPE_INVALID`-terminated array of types included in
        formats
  */
  gobject.types.GType[] getGtypes()
  {
    const(GType)* _cretval;
    size_t _cretlength;
    _cretval = gtk_drop_target_get_gtypes(cast(GtkDropTarget*)cPtr, &_cretlength);
    gobject.types.GType[] _retval;

    if (_cretval)
    {
      _retval = cast(gobject.types.GType[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /**
      Gets whether data should be preloaded on hover.
    Returns:     true if drop data should be preloaded
  */
  bool getPreload()
  {
    bool _retval;
    _retval = gtk_drop_target_get_preload(cast(GtkDropTarget*)cPtr);
    return _retval;
  }

  /**
      Gets the current drop data, as a [gobject.value.Value].
    Returns:     The current drop data
  */
  gobject.value.Value getValue()
  {
    const(GValue)* _cretval;
    _cretval = gtk_drop_target_get_value(cast(GtkDropTarget*)cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Rejects the ongoing drop operation.
    
    If no drop operation is ongoing, i.e when `propertyGtk.DropTarget:current-drop`
    is null, this function does nothing.
    
    This function should be used when delaying the decision
    on whether to accept a drag or not until after reading
    the data.
  */
  void reject()
  {
    gtk_drop_target_reject(cast(GtkDropTarget*)cPtr);
  }

  /**
      Sets the actions that this drop target supports.
    Params:
      actions =       the supported actions
  */
  void setActions(gdk.types.DragAction actions)
  {
    gtk_drop_target_set_actions(cast(GtkDropTarget*)cPtr, actions);
  }

  /**
      Sets the supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s for this drop target.
    Params:
      types =       all supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s
          that can be dropped on the target
  */
  void setGtypes(gobject.types.GType[] types = null)
  {
    size_t _nTypes;
    if (types)
      _nTypes = cast(size_t)types.length;

    auto _types = cast(GType*)types.ptr;
    gtk_drop_target_set_gtypes(cast(GtkDropTarget*)cPtr, _types, _nTypes);
  }

  /**
      Sets whether data should be preloaded on hover.
    Params:
      preload =       true to preload drop data
  */
  void setPreload(bool preload)
  {
    gtk_drop_target_set_preload(cast(GtkDropTarget*)cPtr, preload);
  }

  /**
      Emitted on the drop site when a drop operation is about to begin.
    
    If the drop is not accepted, false will be returned and the drop target
    will ignore the drop. If true is returned, the drop is accepted for now
    but may be rejected later via a call to [gtk.drop_target.DropTarget.reject]
    or ultimately by returning false from a [gtk.drop_target.DropTarget.drop]
    handler.
    
    The default handler for this signal decides whether to accept the drop
    based on the formats provided by the drop.
    
    If the decision whether the drop will be accepted or rejected depends
    on the data, this function should return true, the
    [gtk.drop_target.DropTarget.gboolean] property should be set and the value
    should be inspected via the ::notify:value signal, calling
    [gtk.drop_target.DropTarget.reject] if required.
  
    ## Parameters
    $(LIST
      * $(B drop)       the [gdk.drop.Drop]
      * $(B dropTarget) the instance the signal is connected to
    )
    Returns:     true if drop is accepted
  */
  alias AcceptCallbackDlg = bool delegate(gdk.drop.Drop drop, gtk.drop_target.DropTarget dropTarget);

  /** ditto */
  alias AcceptCallbackFunc = bool function(gdk.drop.Drop drop, gtk.drop_target.DropTarget dropTarget);

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
      auto dropTarget = getVal!(gtk.drop_target.DropTarget)(_paramVals);
      auto drop = getVal!(gdk.drop.Drop)(&_paramVals[1]);
      _retval = _dClosure.dlg(drop, dropTarget);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept", closure, after);
  }

  /**
      Emitted on the drop site when the user drops the data onto the widget.
    
    The signal handler must determine whether the pointer position is in
    a drop zone or not. If it is not in a drop zone, it returns false
    and no further processing is necessary.
    
    Otherwise, the handler returns true. In this case, this handler will
    accept the drop. The handler is responsible for using the given value
    and performing the drop operation.
  
    ## Parameters
    $(LIST
      * $(B value)       the [gobject.value.Value] being dropped
      * $(B x)       the x coordinate of the current pointer position
      * $(B y)       the y coordinate of the current pointer position
      * $(B dropTarget) the instance the signal is connected to
    )
    Returns:     whether the drop was accepted at the given pointer position
  */
  alias DropCallbackDlg = bool delegate(gobject.value.Value value, double x, double y, gtk.drop_target.DropTarget dropTarget);

  /** ditto */
  alias DropCallbackFunc = bool function(gobject.value.Value value, double x, double y, gtk.drop_target.DropTarget dropTarget);

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
      auto dropTarget = getVal!(gtk.drop_target.DropTarget)(_paramVals);
      auto value = getVal!(gobject.value.Value)(&_paramVals[1]);
      auto x = getVal!(double)(&_paramVals[2]);
      auto y = getVal!(double)(&_paramVals[3]);
      _retval = _dClosure.dlg(value, x, y, dropTarget);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop", closure, after);
  }

  /**
      Emitted on the drop site when the pointer enters the widget.
    
    It can be used to set up custom highlighting.
  
    ## Parameters
    $(LIST
      * $(B x)       the x coordinate of the current pointer position
      * $(B y)       the y coordinate of the current pointer position
      * $(B dropTarget) the instance the signal is connected to
    )
    Returns:     Preferred action for this drag operation or 0 if
        dropping is not supported at the current x,y location.
  */
  alias EnterCallbackDlg = gdk.types.DragAction delegate(double x, double y, gtk.drop_target.DropTarget dropTarget);

  /** ditto */
  alias EnterCallbackFunc = gdk.types.DragAction function(double x, double y, gtk.drop_target.DropTarget dropTarget);

  /**
    Connect to Enter signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EnterCallbackDlg) || is(T : EnterCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropTarget = getVal!(gtk.drop_target.DropTarget)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      auto _dretval = _dClosure.dlg(x, y, dropTarget);
      GdkDragAction _retval = cast(GdkDragAction)_dretval;
      setVal!gdk.types.DragAction(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Emitted on the drop site when the pointer leaves the widget.
    
    Its main purpose it to undo things done in
    [gtk.drop_target.DropTarget.enter].
  
    ## Parameters
    $(LIST
      * $(B dropTarget) the instance the signal is connected to
    )
  */
  alias LeaveCallbackDlg = void delegate(gtk.drop_target.DropTarget dropTarget);

  /** ditto */
  alias LeaveCallbackFunc = void function(gtk.drop_target.DropTarget dropTarget);

  /**
    Connect to Leave signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LeaveCallbackDlg) || is(T : LeaveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropTarget = getVal!(gtk.drop_target.DropTarget)(_paramVals);
      _dClosure.dlg(dropTarget);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Emitted while the pointer is moving over the drop target.
  
    ## Parameters
    $(LIST
      * $(B x)       the x coordinate of the current pointer position
      * $(B y)       the y coordinate of the current pointer position
      * $(B dropTarget) the instance the signal is connected to
    )
    Returns:     Preferred action for this drag operation or 0 if
        dropping is not supported at the current x,y location.
  */
  alias MotionCallbackDlg = gdk.types.DragAction delegate(double x, double y, gtk.drop_target.DropTarget dropTarget);

  /** ditto */
  alias MotionCallbackFunc = gdk.types.DragAction function(double x, double y, gtk.drop_target.DropTarget dropTarget);

  /**
    Connect to Motion signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMotion(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MotionCallbackDlg) || is(T : MotionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropTarget = getVal!(gtk.drop_target.DropTarget)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      auto _dretval = _dClosure.dlg(x, y, dropTarget);
      GdkDragAction _retval = cast(GdkDragAction)_dretval;
      setVal!gdk.types.DragAction(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}
