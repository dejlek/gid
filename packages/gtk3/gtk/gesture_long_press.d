module gtk.gesture_long_press;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureLongPress is a #GtkGesture implementation able to recognize
  long presses, triggering the #GtkGestureLongPress::pressed after the
  timeout is exceeded.
  
  If the touchpoint is lifted before the timeout passes, or if it drifts
  too far of the initial press point, the #GtkGestureLongPress::cancelled
  signal will be emitted.
*/
class GestureLongPress : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
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
      Returns a newly created #GtkGesture that recognizes long presses.
    Params:
      widget =       a #GtkWidget
    Returns:     a newly created #GtkGestureLongPress
  */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_long_press_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      This signal is emitted whenever a press moved too far, or was released
    before #GtkGestureLongPress::pressed happened.
  
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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCancelled(T)(T callback, Flag!"After" after = No.After)
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
      This signal is emitted whenever a press goes unmoved/unreleased longer than
    what the GTK+ defaults tell.
  
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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPressed(T)(T callback, Flag!"After" after = No.After)
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
