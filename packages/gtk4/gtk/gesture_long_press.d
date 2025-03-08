module gtk.gesture_long_press;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
    [gtk.gesture_long_press.GestureLongPress] is a [gtk.gesture.Gesture] for long presses.
  
  This gesture is also known as “Press and Hold”.
  
  When the timeout is exceeded, the gesture is triggering the
  [gtk.gesture_long_press.GestureLongPress.pressed] signal.
  
  If the touchpoint is lifted before the timeout passes, or if
  it drifts too far of the initial press point, the
  [gtk.gesture_long_press.GestureLongPress.cancelled] signal will be emitted.
  
  How long the timeout is before the ::pressed signal gets emitted is
  determined by the `property@Gtk.Settings:gtk-long-press-time` setting.
  It can be modified by the `property@Gtk.GestureLongPress:delay-factor`
  property.
*/
class GestureLongPress : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_long_press_get_type != &gidSymbolNotFound ? gtk_gesture_long_press_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns a newly created [gtk.gesture.Gesture] that recognizes long presses.
    Returns:     a newly created [gtk.gesture_long_press.GestureLongPress].
  */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_long_press_new();
    this(_cretval, Yes.take);
  }

  /**
      Returns the delay factor.
    Returns:     the delay factor
  */
  double getDelayFactor()
  {
    double _retval;
    _retval = gtk_gesture_long_press_get_delay_factor(cast(GtkGestureLongPress*)cPtr);
    return _retval;
  }

  /**
      Applies the given delay factor.
    
    The default long press time will be multiplied by this value.
    Valid values are in the range [0.5..2.0].
    Params:
      delayFactor =       The delay factor to apply
  */
  void setDelayFactor(double delayFactor)
  {
    gtk_gesture_long_press_set_delay_factor(cast(GtkGestureLongPress*)cPtr, delayFactor);
  }

  /**
      Emitted whenever a press moved too far, or was released
    before [gtk.gesture_long_press.GestureLongPress.pressed] happened.
  
    ## Parameters
    $(LIST
      * $(B gestureLongPress) the instance the signal is connected to
    )
  */
  alias CancelledCallbackDlg = void delegate(gtk.gesture_long_press.GestureLongPress gestureLongPress);

  /** ditto */
  alias CancelledCallbackFunc = void function(gtk.gesture_long_press.GestureLongPress gestureLongPress);

  /**
    Connect to Cancelled signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectCancelled(T)(T callback, Flag!"after" after = No.after)
  if (is(T : CancelledCallbackDlg) || is(T : CancelledCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureLongPress = getVal!(gtk.gesture_long_press.GestureLongPress)(_paramVals);
      _dClosure.dlg(gestureLongPress);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancelled", closure, after);
  }

  /**
      Emitted whenever a press goes unmoved/unreleased longer than
    what the GTK defaults tell.
  
    ## Parameters
    $(LIST
      * $(B x)       the X coordinate where the press happened, relative to the widget allocation
      * $(B y)       the Y coordinate where the press happened, relative to the widget allocation
      * $(B gestureLongPress) the instance the signal is connected to
    )
  */
  alias PressedCallbackDlg = void delegate(double x, double y, gtk.gesture_long_press.GestureLongPress gestureLongPress);

  /** ditto */
  alias PressedCallbackFunc = void function(double x, double y, gtk.gesture_long_press.GestureLongPress gestureLongPress);

  /**
    Connect to Pressed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPressed(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PressedCallbackDlg) || is(T : PressedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureLongPress = getVal!(gtk.gesture_long_press.GestureLongPress)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(x, y, gestureLongPress);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }
}
