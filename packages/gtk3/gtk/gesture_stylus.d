module gtk.gesture_stylus;

import gdk.device_tool;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureStylus is a #GtkGesture implementation specific to stylus
  input. The provided signals just provide the basic information
*/
class GestureStylus : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_stylus_get_type != &gidSymbolNotFound ? gtk_gesture_stylus_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override GestureStylus self()
  {
    return this;
  }

  /**
      Creates a new #GtkGestureStylus.
    Params:
      widget =       a #GtkWidget
    Returns:     a newly created stylus gesture
  */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_stylus_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the current values for the requested axes. This function
    must be called from either the #GtkGestureStylus:down,
    #GtkGestureStylus:motion, #GtkGestureStylus:up or #GtkGestureStylus:proximity
    signals.
    Params:
      axes =       array of requested axes, terminated with #GDK_AXIS_IGNORE
      values =       return location for the axis values
    Returns:     #TRUE if there is a current value for the axes
  */
  bool getAxes(gdk.types.AxisUse[] axes, out double[] values)
  {
    bool _retval;
    auto _axes = cast(GdkAxisUse*)(axes ~ GdkAxisUse.init).ptr;
    double* _values;
    _retval = gtk_gesture_stylus_get_axes(cast(GtkGestureStylus*)cPtr, _axes, &_values);
    values.length = axes.length;
    values[0 .. $] = (cast(double*)_values)[0 .. axes.length];
    gFree(cast(void*)_values);
    return _retval;
  }

  /**
      Returns the current value for the requested axis. This function
    must be called from either the #GtkGestureStylus:down,
    #GtkGestureStylus:motion, #GtkGestureStylus:up or #GtkGestureStylus:proximity
    signals.
    Params:
      axis =       requested device axis
      value =       return location for the axis value
    Returns:     #TRUE if there is a current value for the axis
  */
  bool getAxis(gdk.types.AxisUse axis, out double value)
  {
    bool _retval;
    _retval = gtk_gesture_stylus_get_axis(cast(GtkGestureStylus*)cPtr, axis, cast(double*)&value);
    return _retval;
  }

  /**
      Returns the #GdkDeviceTool currently driving input through this gesture.
    This function must be called from either the #GtkGestureStylus::down,
    #GtkGestureStylus::motion, #GtkGestureStylus::up or #GtkGestureStylus::proximity
    signal handlers.
    Returns:     The current stylus tool
  */
  gdk.device_tool.DeviceTool getDeviceTool()
  {
    GdkDeviceTool* _cretval;
    _cretval = gtk_gesture_stylus_get_device_tool(cast(GtkGestureStylus*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /** */
  alias DownCallbackDlg = void delegate(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /** ditto */
  alias DownCallbackFunc = void function(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /**
    Connect to Down signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDown(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DownCallbackDlg) || is(T : DownCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureStylus = getVal!(gtk.gesture_stylus.GestureStylus)(_paramVals);
      auto object = getVal!(double)(&_paramVals[1]);
      auto p0 = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(object, p0, gestureStylus);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("down", closure, after);
  }

  /** */
  alias MotionCallbackDlg = void delegate(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /** ditto */
  alias MotionCallbackFunc = void function(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

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
      auto gestureStylus = getVal!(gtk.gesture_stylus.GestureStylus)(_paramVals);
      auto object = getVal!(double)(&_paramVals[1]);
      auto p0 = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(object, p0, gestureStylus);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }

  /** */
  alias ProximityCallbackDlg = void delegate(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /** ditto */
  alias ProximityCallbackFunc = void function(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /**
    Connect to Proximity signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectProximity(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ProximityCallbackDlg) || is(T : ProximityCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureStylus = getVal!(gtk.gesture_stylus.GestureStylus)(_paramVals);
      auto object = getVal!(double)(&_paramVals[1]);
      auto p0 = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(object, p0, gestureStylus);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("proximity", closure, after);
  }

  /** */
  alias UpCallbackDlg = void delegate(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /** ditto */
  alias UpCallbackFunc = void function(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus);

  /**
    Connect to Up signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectUp(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UpCallbackDlg) || is(T : UpCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureStylus = getVal!(gtk.gesture_stylus.GestureStylus)(_paramVals);
      auto object = getVal!(double)(&_paramVals[1]);
      auto p0 = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(object, p0, gestureStylus);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("up", closure, after);
  }
}
