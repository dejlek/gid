module adw.swipe_tracker;

import adw.c.functions;
import adw.c.types;
import adw.swipeable;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.orientable;
import gtk.orientable_mixin;

/**
    A swipe tracker used in `class@Carousel`, `class@NavigationView` and
  `class@OverlaySplitView`.
  
  The [adw.swipe_tracker.SwipeTracker] object can be used for implementing widgets with swipe
  gestures. It supports touch-based swipes, pointer dragging, and touchpad
  scrolling.
  
  The widgets will probably want to expose the `property@SwipeTracker:enabled`
  property. If they expect to use horizontal orientation,
  `property@SwipeTracker:reversed` can be used for supporting RTL text
  direction.
*/
class SwipeTracker : gobject.object.ObjectG, gtk.orientable.Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_swipe_tracker_get_type != &gidSymbolNotFound ? adw_swipe_tracker_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SwipeTracker self()
  {
    return this;
  }

  mixin OrientableT!();

  /**
      Creates a new [adw.swipe_tracker.SwipeTracker] for widget.
    Params:
      swipeable =       a widget to add the tracker on
    Returns:     the newly created [adw.swipe_tracker.SwipeTracker]
  */
  this(adw.swipeable.Swipeable swipeable)
  {
    AdwSwipeTracker* _cretval;
    _cretval = adw_swipe_tracker_new(swipeable ? cast(AdwSwipeable*)(cast(ObjectG)swipeable).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets whether to allow swiping for more than one snap point at a time.
    Returns:     whether long swipes are allowed
  */
  bool getAllowLongSwipes()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_allow_long_swipes(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Gets whether self can be dragged with mouse pointer.
    Returns:     whether mouse dragging is allowed
  */
  bool getAllowMouseDrag()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_allow_mouse_drag(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Gets whether to allow touchscreen swiping from [gtk.window_handle.WindowHandle].
    Returns:     whether swiping from window handles is allowed
  */
  bool getAllowWindowHandle()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_allow_window_handle(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is enabled.
    Returns:     whether self is enabled
  */
  bool getEnabled()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_enabled(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Gets whether to allow swiping past the first available snap point.
    Returns:     whether to allow swiping past the first available snap point
  */
  bool getLowerOvershoot()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_lower_overshoot(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Gets whether self is reversing the swipe direction.
    Returns:     whether the direction is reversed
  */
  bool getReversed()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_reversed(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Get the widget self is attached to.
    Returns:     the swipeable widget
  */
  adw.swipeable.Swipeable getSwipeable()
  {
    AdwSwipeable* _cretval;
    _cretval = adw_swipe_tracker_get_swipeable(cast(AdwSwipeTracker*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.swipeable.Swipeable)(cast(AdwSwipeable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to allow swiping past the last available snap point.
    Returns:     whether to allow swiping past the last available snap point
  */
  bool getUpperOvershoot()
  {
    bool _retval;
    _retval = adw_swipe_tracker_get_upper_overshoot(cast(AdwSwipeTracker*)cPtr);
    return _retval;
  }

  /**
      Sets whether to allow swiping for more than one snap point at a time.
    
    If the value is `FALSE`, each swipe can only move to the adjacent snap
    points.
    Params:
      allowLongSwipes =       whether to allow long swipes
  */
  void setAllowLongSwipes(bool allowLongSwipes)
  {
    adw_swipe_tracker_set_allow_long_swipes(cast(AdwSwipeTracker*)cPtr, allowLongSwipes);
  }

  /**
      Sets whether self can be dragged with mouse pointer.
    Params:
      allowMouseDrag =       whether to allow mouse dragging
  */
  void setAllowMouseDrag(bool allowMouseDrag)
  {
    adw_swipe_tracker_set_allow_mouse_drag(cast(AdwSwipeTracker*)cPtr, allowMouseDrag);
  }

  /**
      Sets whether to allow touchscreen swiping from [gtk.window_handle.WindowHandle].
    
    Setting it to `TRUE` will make dragging the window impossible.
    Params:
      allowWindowHandle =       whether to allow swiping from window handles
  */
  void setAllowWindowHandle(bool allowWindowHandle)
  {
    adw_swipe_tracker_set_allow_window_handle(cast(AdwSwipeTracker*)cPtr, allowWindowHandle);
  }

  /**
      Sets whether self is enabled.
    
    When it's not enabled, no events will be processed. Usually widgets will want
    to expose this via a property.
    Params:
      enabled =       whether self is enabled
  */
  void setEnabled(bool enabled)
  {
    adw_swipe_tracker_set_enabled(cast(AdwSwipeTracker*)cPtr, enabled);
  }

  /**
      Sets whether to allow swiping past the first available snap point.
    Params:
      overshoot =       whether to allow swiping past the first available snap point
  */
  void setLowerOvershoot(bool overshoot)
  {
    adw_swipe_tracker_set_lower_overshoot(cast(AdwSwipeTracker*)cPtr, overshoot);
  }

  /**
      Sets whether to reverse the swipe direction.
    
    If the swipe tracker is horizontal, it can be used for supporting RTL text
    direction.
    Params:
      reversed =       whether to reverse the swipe direction
  */
  void setReversed(bool reversed)
  {
    adw_swipe_tracker_set_reversed(cast(AdwSwipeTracker*)cPtr, reversed);
  }

  /**
      Sets whether to allow swiping past the last available snap point.
    Params:
      overshoot =       whether to allow swiping past the last available snap point
  */
  void setUpperOvershoot(bool overshoot)
  {
    adw_swipe_tracker_set_upper_overshoot(cast(AdwSwipeTracker*)cPtr, overshoot);
  }

  /**
      Moves the current progress value by delta.
    
    This can be used to adjust the current position if snap points move during
    the gesture.
    Params:
      delta =       the position delta
  */
  void shiftPosition(double delta)
  {
    adw_swipe_tracker_shift_position(cast(AdwSwipeTracker*)cPtr, delta);
  }

  /**
      This signal is emitted right before a swipe will be started, after the
    drag threshold has been passed.
  
    ## Parameters
    $(LIST
      * $(B swipeTracker) the instance the signal is connected to
    )
  */
  alias BeginSwipeCallbackDlg = void delegate(adw.swipe_tracker.SwipeTracker swipeTracker);

  /** ditto */
  alias BeginSwipeCallbackFunc = void function(adw.swipe_tracker.SwipeTracker swipeTracker);

  /**
    Connect to BeginSwipe signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectBeginSwipe(T)(T callback, Flag!"After" after = No.After)
  if (is(T : BeginSwipeCallbackDlg) || is(T : BeginSwipeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto swipeTracker = getVal!(adw.swipe_tracker.SwipeTracker)(_paramVals);
      _dClosure.dlg(swipeTracker);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("begin-swipe", closure, after);
  }

  /**
      This signal is emitted as soon as the gesture has stopped.
    
    The user is expected to animate the deceleration from the current progress
    value to to with an animation using velocity as the initial velocity,
    provided in pixels per second. `classSpringAnimation` is usually a good
    fit for this.
  
    ## Parameters
    $(LIST
      * $(B velocity)       the velocity of the swipe
      * $(B to)       the progress value to animate to
      * $(B swipeTracker) the instance the signal is connected to
    )
  */
  alias EndSwipeCallbackDlg = void delegate(double velocity, double to, adw.swipe_tracker.SwipeTracker swipeTracker);

  /** ditto */
  alias EndSwipeCallbackFunc = void function(double velocity, double to, adw.swipe_tracker.SwipeTracker swipeTracker);

  /**
    Connect to EndSwipe signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEndSwipe(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EndSwipeCallbackDlg) || is(T : EndSwipeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto swipeTracker = getVal!(adw.swipe_tracker.SwipeTracker)(_paramVals);
      auto velocity = getVal!(double)(&_paramVals[1]);
      auto to = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(velocity, to, swipeTracker);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end-swipe", closure, after);
  }

  /**
      This signal is emitted when a possible swipe is detected.
    
    The direction value can be used to restrict the swipe to a certain
    direction.
  
    ## Parameters
    $(LIST
      * $(B direction)       the direction of the swipe
      * $(B swipeTracker) the instance the signal is connected to
    )
  */
  alias PrepareCallbackDlg = void delegate(adw.types.NavigationDirection direction, adw.swipe_tracker.SwipeTracker swipeTracker);

  /** ditto */
  alias PrepareCallbackFunc = void function(adw.types.NavigationDirection direction, adw.swipe_tracker.SwipeTracker swipeTracker);

  /**
    Connect to Prepare signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPrepare(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PrepareCallbackDlg) || is(T : PrepareCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto swipeTracker = getVal!(adw.swipe_tracker.SwipeTracker)(_paramVals);
      auto direction = getVal!(adw.types.NavigationDirection)(&_paramVals[1]);
      _dClosure.dlg(direction, swipeTracker);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("prepare", closure, after);
  }

  /**
      This signal is emitted every time the progress value changes.
  
    ## Parameters
    $(LIST
      * $(B progress)       the current animation progress value
      * $(B swipeTracker) the instance the signal is connected to
    )
  */
  alias UpdateSwipeCallbackDlg = void delegate(double progress, adw.swipe_tracker.SwipeTracker swipeTracker);

  /** ditto */
  alias UpdateSwipeCallbackFunc = void function(double progress, adw.swipe_tracker.SwipeTracker swipeTracker);

  /**
    Connect to UpdateSwipe signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectUpdateSwipe(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UpdateSwipeCallbackDlg) || is(T : UpdateSwipeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto swipeTracker = getVal!(adw.swipe_tracker.SwipeTracker)(_paramVals);
      auto progress = getVal!(double)(&_paramVals[1]);
      _dClosure.dlg(progress, swipeTracker);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("update-swipe", closure, after);
  }
}
