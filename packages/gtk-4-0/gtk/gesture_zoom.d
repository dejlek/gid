module gtk.gesture_zoom;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture;
import gtk.types;

/**
 * `GtkGestureZoom` is a `GtkGesture` for 2-finger pinch/zoom gestures.
 * Whenever the distance between both tracked sequences changes, the
 * signal@Gtk.GestureZoom::scale-changed signal is emitted to report
 * the scale factor.
 */
class GestureZoom : Gesture
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_zoom_get_type != &gidSymbolNotFound ? gtk_gesture_zoom_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a newly created `GtkGesture` that recognizes
   * pinch/zoom gestures.
   * Returns: a newly created `GtkGestureZoom`
   */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_zoom_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the scale delta.
   * If gesture is active, this function returns the zooming
   * difference since the gesture was recognized $(LPAREN)hence the
   * starting point is considered 1:1$(RPAREN). If gesture is not
   * active, 1 is returned.
   * Returns: the scale delta
   */
  double getScaleDelta()
  {
    double _retval;
    _retval = gtk_gesture_zoom_get_scale_delta(cast(GtkGestureZoom*)cPtr);
    return _retval;
  }

  /**
   * Emitted whenever the distance between both tracked sequences changes.
   * Params
   *   scale = Scale delta, taking the initial state as 1:1
   *   gestureZoom = the instance the signal is connected to
   */
  alias ScaleChangedCallbackDlg = void delegate(double scale, GestureZoom gestureZoom);
  alias ScaleChangedCallbackFunc = void function(double scale, GestureZoom gestureZoom);

  /**
   * Connect to ScaleChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectScaleChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ScaleChangedCallbackDlg) || is(T : ScaleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureZoom = getVal!GestureZoom(_paramVals);
      auto scale = getVal!double(&_paramVals[1]);
      _dClosure.dlg(scale, gestureZoom);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scale-changed", closure, after);
  }
}
