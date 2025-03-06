module gdk.drag_surface_mixin;

public import gdk.drag_surface_iface_proxy;
public import gdk.c.functions;
public import gdk.c.types;
public import gdk.drag_surface_size;
public import gdk.types;
public import gid.gid;
public import gobject.dclosure;

/**
    A [gdk.drag_surface.DragSurface] is an interface for surfaces used during DND.
*/
template DragSurfaceT()
{

  /**
      Present drag_surface.
    Params:
      width =       the unconstrained drag_surface width to layout
      height =       the unconstrained drag_surface height to layout
    Returns:     false if it failed to be presented, otherwise true.
  */
  override bool present(int width, int height)
  {
    bool _retval;
    _retval = gdk_drag_surface_present(cast(GdkDragSurface*)cPtr, width, height);
    return _retval;
  }

  /**
      Emitted when the size for the surface needs to be computed, when it is
    present.
    
    This signal will normally be emitted during the native surface layout
    cycle when the surface size needs to be recomputed.
    
    It is the responsibility of the drag surface user to handle this signal
    and compute the desired size of the surface, storing the computed size
    in the [gdk.drag_surface_size.DragSurfaceSize] object that is passed to the signal
    handler, using [gdk.drag_surface_size.DragSurfaceSize.setSize].
    
    Failing to set a size so will result in an arbitrary size being used as
    a result.
  
    ## Parameters
    $(LIST
      * $(B size)       the size of the drag surface
      * $(B dragSurface) the instance the signal is connected to
    )
  */
  alias ComputeSizeCallbackDlg = void delegate(gdk.drag_surface_size.DragSurfaceSize size, gdk.drag_surface.DragSurface dragSurface);

  /** ditto */
  alias ComputeSizeCallbackFunc = void function(gdk.drag_surface_size.DragSurfaceSize size, gdk.drag_surface.DragSurface dragSurface);

  /**
    Connect to ComputeSize signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectComputeSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ComputeSizeCallbackDlg) || is(T : ComputeSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dragSurface = getVal!(gdk.drag_surface.DragSurface)(_paramVals);
      auto size = getVal!(gdk.drag_surface_size.DragSurfaceSize)(&_paramVals[1]);
      _dClosure.dlg(size, dragSurface);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("compute-size", closure, after);
  }
}
