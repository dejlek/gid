module gtk.gesture_multi_press;

import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureMultiPress is a #GtkGesture implementation able to recognize
  multiple clicks on a nearby zone, which can be listened for through the
  #GtkGestureMultiPress::pressed signal. Whenever time or distance between
  clicks exceed the GTK+ defaults, #GtkGestureMultiPress::stopped is emitted,
  and the click counter is reset.
  
  Callers may also restrict the area that is considered valid for a >1
  touch/button press through [gtk.gesture_multi_press.GestureMultiPress.setArea], so any
  click happening outside that area is considered to be a first click of
  its own.
*/
class GestureMultiPress : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_multi_press_get_type != &gidSymbolNotFound ? gtk_gesture_multi_press_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override GestureMultiPress self()
  {
    return this;
  }

  /**
      Returns a newly created #GtkGesture that recognizes single and multiple
    presses.
    Params:
      widget =       a #GtkWidget
    Returns:     a newly created #GtkGestureMultiPress
  */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_multi_press_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      If an area was set through [gtk.gesture_multi_press.GestureMultiPress.setArea],
    this function will return true and fill in rect with the
    press area. See [gtk.gesture_multi_press.GestureMultiPress.setArea] for more
    details on what the press area represents.
    Params:
      rect =       return location for the press area
    Returns:     true if rect was filled with the press area
  */
  bool getArea(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    GdkRectangle _rect;
    _retval = gtk_gesture_multi_press_get_area(cast(GtkGestureMultiPress*)cPtr, &_rect);
    rect = new gdk.rectangle.Rectangle(cast(void*)&_rect, No.Take);
    return _retval;
  }

  /**
      If rect is non-null, the press area will be checked to be
    confined within the rectangle, otherwise the button count
    will be reset so the press is seen as being the first one.
    If rect is null, the area will be reset to an unrestricted
    state.
    
    Note: The rectangle is only used to determine whether any
    non-first click falls within the expected area. This is not
    akin to an input shape.
    Params:
      rect =       rectangle to receive coordinates on
  */
  void setArea(gdk.rectangle.Rectangle rect = null)
  {
    gtk_gesture_multi_press_set_area(cast(GtkGestureMultiPress*)cPtr, rect ? cast(const(GdkRectangle)*)rect.cPtr(No.Dup) : null);
  }

  /**
      This signal is emitted whenever a button or touch press happens.
  
    ## Parameters
    $(LIST
      * $(B nPress)       how many touch/button presses happened with this one
      * $(B x)       The X coordinate, in widget allocation coordinates
      * $(B y)       The Y coordinate, in widget allocation coordinates
      * $(B gestureMultiPress) the instance the signal is connected to
    )
  */
  alias PressedCallbackDlg = void delegate(int nPress, double x, double y, gtk.gesture_multi_press.GestureMultiPress gestureMultiPress);

  /** ditto */
  alias PressedCallbackFunc = void function(int nPress, double x, double y, gtk.gesture_multi_press.GestureMultiPress gestureMultiPress);

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
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureMultiPress = getVal!(gtk.gesture_multi_press.GestureMultiPress)(_paramVals);
      auto nPress = getVal!(int)(&_paramVals[1]);
      auto x = getVal!(double)(&_paramVals[2]);
      auto y = getVal!(double)(&_paramVals[3]);
      _dClosure.dlg(nPress, x, y, gestureMultiPress);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }

  /**
      This signal is emitted when a button or touch is released. n_press
    will report the number of press that is paired to this event, note
    that #GtkGestureMultiPress::stopped may have been emitted between the
    press and its release, n_press will only start over at the next press.
  
    ## Parameters
    $(LIST
      * $(B nPress)       number of press that is paired with this release
      * $(B x)       The X coordinate, in widget allocation coordinates
      * $(B y)       The Y coordinate, in widget allocation coordinates
      * $(B gestureMultiPress) the instance the signal is connected to
    )
  */
  alias ReleasedCallbackDlg = void delegate(int nPress, double x, double y, gtk.gesture_multi_press.GestureMultiPress gestureMultiPress);

  /** ditto */
  alias ReleasedCallbackFunc = void function(int nPress, double x, double y, gtk.gesture_multi_press.GestureMultiPress gestureMultiPress);

  /**
    Connect to Released signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectReleased(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ReleasedCallbackDlg) || is(T : ReleasedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureMultiPress = getVal!(gtk.gesture_multi_press.GestureMultiPress)(_paramVals);
      auto nPress = getVal!(int)(&_paramVals[1]);
      auto x = getVal!(double)(&_paramVals[2]);
      auto y = getVal!(double)(&_paramVals[3]);
      _dClosure.dlg(nPress, x, y, gestureMultiPress);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("released", closure, after);
  }

  /**
      This signal is emitted whenever any time/distance threshold has
    been exceeded.
  
    ## Parameters
    $(LIST
      * $(B gestureMultiPress) the instance the signal is connected to
    )
  */
  alias StoppedCallbackDlg = void delegate(gtk.gesture_multi_press.GestureMultiPress gestureMultiPress);

  /** ditto */
  alias StoppedCallbackFunc = void function(gtk.gesture_multi_press.GestureMultiPress gestureMultiPress);

  /**
    Connect to Stopped signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectStopped(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StoppedCallbackDlg) || is(T : StoppedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureMultiPress = getVal!(gtk.gesture_multi_press.GestureMultiPress)(_paramVals);
      _dClosure.dlg(gestureMultiPress);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stopped", closure, after);
  }
}
