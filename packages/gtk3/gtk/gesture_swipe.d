module gtk.gesture_swipe;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
 * #GtkGestureSwipe is a #GtkGesture implementation able to recognize
 * swipes, after a press/move/.../move/release sequence happens, the
 * #GtkGestureSwipe::swipe signal will be emitted, providing the velocity
 * and directionality of the sequence at the time it was lifted.
 * If the velocity is desired in intermediate points,
 * [gtk.gesture_swipe.GestureSwipe.getVelocity] can be called on eg. a
 * #GtkGesture::update handler.
 * All velocities are reported in pixels/sec units.
 */
class GestureSwipe : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_swipe_get_type != &gidSymbolNotFound ? gtk_gesture_swipe_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a newly created #GtkGesture that recognizes swipes.
   * Params:
   *   widget = a #GtkWidget
   * Returns: a newly created #GtkGestureSwipe
   */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_swipe_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * If the gesture is recognized, this function returns %TRUE and fill in
   * velocity_x and velocity_y with the recorded velocity, as per the
   * last event$(LPAREN)s$(RPAREN) processed.
   * Params:
   *   velocityX = return value for the velocity in the X axis, in pixels/sec
   *   velocityY = return value for the velocity in the Y axis, in pixels/sec
   * Returns: whether velocity could be calculated
   */
  bool getVelocity(out double velocityX, out double velocityY)
  {
    bool _retval;
    _retval = gtk_gesture_swipe_get_velocity(cast(GtkGestureSwipe*)cPtr, cast(double*)&velocityX, cast(double*)&velocityY);
    return _retval;
  }

  /**
   * This signal is emitted when the recognized gesture is finished, velocity
   * and direction are a product of previously recorded events.
   * Params
   *   velocityX = velocity in the X axis, in pixels/sec
   *   velocityY = velocity in the Y axis, in pixels/sec
   *   gestureSwipe = the instance the signal is connected to
   */
  alias SwipeCallbackDlg = void delegate(double velocityX, double velocityY, gtk.gesture_swipe.GestureSwipe gestureSwipe);
  alias SwipeCallbackFunc = void function(double velocityX, double velocityY, gtk.gesture_swipe.GestureSwipe gestureSwipe);

  /**
   * Connect to Swipe signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSwipe(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SwipeCallbackDlg) || is(T : SwipeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureSwipe = getVal!(gtk.gesture_swipe.GestureSwipe)(_paramVals);
      auto velocityX = getVal!(double)(&_paramVals[1]);
      auto velocityY = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(velocityX, velocityY, gestureSwipe);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("swipe", closure, after);
  }
}
