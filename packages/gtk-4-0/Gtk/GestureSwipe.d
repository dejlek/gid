module Gtk.GestureSwipe;

import GObject.DClosure;
import Gid.gid;
import Gtk.GestureSingle;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkGestureSwipe` is a `GtkGesture` for swipe gestures.
 * After a press/move/.../move/release sequence happens, the
 * [Gtk.GestureSwipe.swipe] signal will be emitted,
 * providing the velocity and directionality of the sequence
 * at the time it was lifted.
 * If the velocity is desired in intermediate points,
 * [Gtk.GestureSwipe.getVelocity] can be called in a
 * [Gtk.Gesture.update] handler.
 * All velocities are reported in pixels/sec units.
 */
class GestureSwipe : GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_swipe_get_type != &gidSymbolNotFound ? gtk_gesture_swipe_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a newly created `GtkGesture` that recognizes swipes.
   * Returns: a newly created `GtkGestureSwipe`
   */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_swipe_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the current velocity.
   * If the gesture is recognized, this function returns %TRUE and fills
   * in velocity_x and velocity_y with the recorded velocity, as per the
   * last events processed.
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
   * Emitted when the recognized gesture is finished.
   * Velocity and direction are a product of previously recorded events.
   * Params
   *   velocityX = velocity in the X axis, in pixels/sec
   *   velocityY = velocity in the Y axis, in pixels/sec
   *   gestureSwipe = the instance the signal is connected to
   */
  alias SwipeCallbackDlg = void delegate(double velocityX, double velocityY, GestureSwipe gestureSwipe);
  alias SwipeCallbackFunc = void function(double velocityX, double velocityY, GestureSwipe gestureSwipe);

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
      auto gestureSwipe = getVal!GestureSwipe(_paramVals);
      auto velocityX = getVal!double(&_paramVals[1]);
      auto velocityY = getVal!double(&_paramVals[2]);
      _dClosure.dlg(velocityX, velocityY, gestureSwipe);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("swipe", closure, after);
  }
}
