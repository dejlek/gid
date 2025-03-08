module gtk.gesture_rotate;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureRotate is a #GtkGesture implementation able to recognize
  2-finger rotations, whenever the angle between both handled sequences
  changes, the #GtkGestureRotate::angle-changed signal is emitted.
*/
class GestureRotate : gtk.gesture.Gesture
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_rotate_get_type != &gidSymbolNotFound ? gtk_gesture_rotate_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns a newly created #GtkGesture that recognizes 2-touch
    rotation gestures.
    Params:
      widget =       a #GtkWidget
    Returns:     a newly created #GtkGestureRotate
  */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_rotate_new(widget ? cast(GtkWidget*)widget.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      If gesture is active, this function returns the angle difference
    in radians since the gesture was first recognized. If gesture is
    not active, 0 is returned.
    Returns:     the angle delta in radians
  */
  double getAngleDelta()
  {
    double _retval;
    _retval = gtk_gesture_rotate_get_angle_delta(cast(GtkGestureRotate*)cPtr);
    return _retval;
  }

  /**
      This signal is emitted when the angle between both tracked points
    changes.
  
    ## Parameters
    $(LIST
      * $(B angle)       Current angle in radians
      * $(B angleDelta)       Difference with the starting angle, in radians
      * $(B gestureRotate) the instance the signal is connected to
    )
  */
  alias AngleChangedCallbackDlg = void delegate(double angle, double angleDelta, gtk.gesture_rotate.GestureRotate gestureRotate);

  /** ditto */
  alias AngleChangedCallbackFunc = void function(double angle, double angleDelta, gtk.gesture_rotate.GestureRotate gestureRotate);

  /**
    Connect to AngleChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectAngleChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : AngleChangedCallbackDlg) || is(T : AngleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureRotate = getVal!(gtk.gesture_rotate.GestureRotate)(_paramVals);
      auto angle = getVal!(double)(&_paramVals[1]);
      auto angleDelta = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(angle, angleDelta, gestureRotate);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("angle-changed", closure, after);
  }
}
