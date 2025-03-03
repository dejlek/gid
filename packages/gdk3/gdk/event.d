module gdk.event;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.device_tool;
import gdk.event_any;
import gdk.event_button;
import gdk.event_configure;
import gdk.event_crossing;
import gdk.event_dnd;
import gdk.event_expose;
import gdk.event_focus;
import gdk.event_grab_broken;
import gdk.event_key;
import gdk.event_motion;
import gdk.event_owner_change;
import gdk.event_pad_axis;
import gdk.event_pad_button;
import gdk.event_pad_group_mode;
import gdk.event_property;
import gdk.event_proximity;
import gdk.event_scroll;
import gdk.event_selection;
import gdk.event_sequence;
import gdk.event_setting;
import gdk.event_touch;
import gdk.event_touchpad_pinch;
import gdk.event_touchpad_swipe;
import gdk.event_visibility;
import gdk.event_window_state;
import gdk.screen;
import gdk.seat;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.object;

/**
 * A #GdkEvent contains a union of all of the event types,
 * and allows access to the data fields in a number of ways.
 * The event type is always the first field in all of the event types, and
 * can always be accessed with the following code, no matter what type of
 * event it is:
 * |[<!-- language\="C" -->
 * GdkEvent *event;
 * GdkEventType type;
 * type \= event->type;
 * ]|
 * To access other fields of the event, the pointer to the event
 * can be cast to the appropriate event type, or the union member
 * name can be used. For example if the event type is %GDK_BUTTON_PRESS
 * then the x coordinate of the button press can be accessed with:
 * |[<!-- language\="C" -->
 * GdkEvent *event;
 * gdouble x;
 * x \= $(LPAREN)$(LPAREN)GdkEventButton*$(RPAREN)event$(RPAREN)->x;
 * ]|
 * or:
 * |[<!-- language\="C" -->
 * GdkEvent *event;
 * gdouble x;
 * x \= event->button.x;
 * ]|
 */
class Event
{
  GdkEvent cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.Event");

    cInstance = *cast(GdkEvent*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.types.EventType type()
  {
    return cast(gdk.types.EventType)(cast(GdkEvent*)cPtr).type;
  }

  @property void type(gdk.types.EventType propval)
  {
    (cast(GdkEvent*)cPtr).type = cast(GdkEventType)propval;
  }

  @property gdk.event_any.EventAny any()
  {
    return new gdk.event_any.EventAny(cast(GdkEventAny*)&(cast(GdkEvent*)cPtr).any);
  }

  @property gdk.event_expose.EventExpose expose()
  {
    return new gdk.event_expose.EventExpose(cast(GdkEventExpose*)&(cast(GdkEvent*)cPtr).expose);
  }

  @property gdk.event_visibility.EventVisibility visibility()
  {
    return new gdk.event_visibility.EventVisibility(cast(GdkEventVisibility*)&(cast(GdkEvent*)cPtr).visibility);
  }

  @property gdk.event_motion.EventMotion motion()
  {
    return new gdk.event_motion.EventMotion(cast(GdkEventMotion*)&(cast(GdkEvent*)cPtr).motion);
  }

  @property gdk.event_button.EventButton button()
  {
    return new gdk.event_button.EventButton(cast(GdkEventButton*)&(cast(GdkEvent*)cPtr).button);
  }

  @property gdk.event_touch.EventTouch touch()
  {
    return new gdk.event_touch.EventTouch(cast(GdkEventTouch*)&(cast(GdkEvent*)cPtr).touch);
  }

  @property gdk.event_scroll.EventScroll scroll()
  {
    return new gdk.event_scroll.EventScroll(cast(GdkEventScroll*)&(cast(GdkEvent*)cPtr).scroll);
  }

  @property gdk.event_key.EventKey key()
  {
    return new gdk.event_key.EventKey(cast(GdkEventKey*)&(cast(GdkEvent*)cPtr).key);
  }

  @property gdk.event_crossing.EventCrossing crossing()
  {
    return new gdk.event_crossing.EventCrossing(cast(GdkEventCrossing*)&(cast(GdkEvent*)cPtr).crossing);
  }

  @property gdk.event_focus.EventFocus focusChange()
  {
    return new gdk.event_focus.EventFocus(cast(GdkEventFocus*)&(cast(GdkEvent*)cPtr).focusChange);
  }

  @property gdk.event_configure.EventConfigure configure()
  {
    return new gdk.event_configure.EventConfigure(cast(GdkEventConfigure*)&(cast(GdkEvent*)cPtr).configure);
  }

  @property gdk.event_property.EventProperty property()
  {
    return new gdk.event_property.EventProperty(cast(GdkEventProperty*)&(cast(GdkEvent*)cPtr).property);
  }

  @property gdk.event_selection.EventSelection selection()
  {
    return new gdk.event_selection.EventSelection(cast(GdkEventSelection*)&(cast(GdkEvent*)cPtr).selection);
  }

  @property gdk.event_owner_change.EventOwnerChange ownerChange()
  {
    return new gdk.event_owner_change.EventOwnerChange(cast(GdkEventOwnerChange*)&(cast(GdkEvent*)cPtr).ownerChange);
  }

  @property gdk.event_proximity.EventProximity proximity()
  {
    return new gdk.event_proximity.EventProximity(cast(GdkEventProximity*)&(cast(GdkEvent*)cPtr).proximity);
  }

  @property gdk.event_dnd.EventDND dnd()
  {
    return new gdk.event_dnd.EventDND(cast(GdkEventDND*)&(cast(GdkEvent*)cPtr).dnd);
  }

  @property gdk.event_window_state.EventWindowState windowState()
  {
    return new gdk.event_window_state.EventWindowState(cast(GdkEventWindowState*)&(cast(GdkEvent*)cPtr).windowState);
  }

  @property gdk.event_setting.EventSetting setting()
  {
    return new gdk.event_setting.EventSetting(cast(GdkEventSetting*)&(cast(GdkEvent*)cPtr).setting);
  }

  @property gdk.event_grab_broken.EventGrabBroken grabBroken()
  {
    return new gdk.event_grab_broken.EventGrabBroken(cast(GdkEventGrabBroken*)&(cast(GdkEvent*)cPtr).grabBroken);
  }

  @property gdk.event_touchpad_swipe.EventTouchpadSwipe touchpadSwipe()
  {
    return new gdk.event_touchpad_swipe.EventTouchpadSwipe(cast(GdkEventTouchpadSwipe*)&(cast(GdkEvent*)cPtr).touchpadSwipe);
  }

  @property gdk.event_touchpad_pinch.EventTouchpadPinch touchpadPinch()
  {
    return new gdk.event_touchpad_pinch.EventTouchpadPinch(cast(GdkEventTouchpadPinch*)&(cast(GdkEvent*)cPtr).touchpadPinch);
  }

  @property gdk.event_pad_button.EventPadButton padButton()
  {
    return new gdk.event_pad_button.EventPadButton(cast(GdkEventPadButton*)&(cast(GdkEvent*)cPtr).padButton);
  }

  @property gdk.event_pad_axis.EventPadAxis padAxis()
  {
    return new gdk.event_pad_axis.EventPadAxis(cast(GdkEventPadAxis*)&(cast(GdkEvent*)cPtr).padAxis);
  }

  @property gdk.event_pad_group_mode.EventPadGroupMode padGroupMode()
  {
    return new gdk.event_pad_group_mode.EventPadGroupMode(cast(GdkEventPadGroupMode*)&(cast(GdkEvent*)cPtr).padGroupMode);
  }

  /**
   * Creates a new event of the given type. All fields are set to 0.
   * Params:
   *   type = a #GdkEventType
   * Returns: a newly-allocated #GdkEvent. The returned #GdkEvent
   *   should be freed with [gdk.event.Event.free].
   */
  this(gdk.types.EventType type)
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_new(type);
    this(_cretval);
  }

  /**
   * Copies a #GdkEvent, copying or incrementing the reference count of the
   * resources associated with it $(LPAREN)e.g. #GdkWindow’s and strings$(RPAREN).
   * Returns: a copy of event. The returned #GdkEvent should be freed with
   *   [gdk.event.Event.free].
   */
  gdk.event.Event copy()
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_copy(cast(const(GdkEvent)*)cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval) : null;
    return _retval;
  }

  /**
   * Extract the axis value for a particular axis use from
   * an event structure.
   * Params:
   *   axisUse = the axis use to look for
   *   value = location to store the value found
   * Returns: %TRUE if the specified axis was found, otherwise %FALSE
   */
  bool getAxis(gdk.types.AxisUse axisUse, out double value)
  {
    bool _retval;
    _retval = gdk_event_get_axis(cast(const(GdkEvent)*)cPtr, axisUse, cast(double*)&value);
    return _retval;
  }

  /**
   * Extract the button number from an event.
   * Params:
   *   button = location to store mouse button number
   * Returns: %TRUE if the event delivered a button number
   */
  bool getButton(out uint button)
  {
    bool _retval;
    _retval = gdk_event_get_button(cast(const(GdkEvent)*)cPtr, cast(uint*)&button);
    return _retval;
  }

  /**
   * Extracts the click count from an event.
   * Params:
   *   clickCount = location to store click count
   * Returns: %TRUE if the event delivered a click count
   */
  bool getClickCount(out uint clickCount)
  {
    bool _retval;
    _retval = gdk_event_get_click_count(cast(const(GdkEvent)*)cPtr, cast(uint*)&clickCount);
    return _retval;
  }

  /**
   * Extract the event window relative x/y coordinates from an event.
   * Params:
   *   xWin = location to put event window x coordinate
   *   yWin = location to put event window y coordinate
   * Returns: %TRUE if the event delivered event window coordinates
   */
  bool getCoords(out double xWin, out double yWin)
  {
    bool _retval;
    _retval = gdk_event_get_coords(cast(const(GdkEvent)*)cPtr, cast(double*)&xWin, cast(double*)&yWin);
    return _retval;
  }

  /**
   * If the event contains a “device” field, this function will return
   * it, else it will return %NULL.
   * Returns: a #GdkDevice, or %NULL.
   */
  gdk.device.Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_event_get_device(cast(const(GdkEvent)*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
   * If the event was generated by a device that supports
   * different tools $(LPAREN)eg. a tablet$(RPAREN), this function will
   * return a #GdkDeviceTool representing the tool that
   * caused the event. Otherwise, %NULL will be returned.
   * Note: the #GdkDeviceTool<!-- -->s will be constant during
   * the application lifetime, if settings must be stored
   * persistently across runs, see [gdk.device_tool.DeviceTool.getSerial]
   * Returns: The current device tool, or %NULL
   */
  gdk.device_tool.DeviceTool getDeviceTool()
  {
    GdkDeviceTool* _cretval;
    _cretval = gdk_event_get_device_tool(cast(const(GdkEvent)*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
   * If event if of type %GDK_TOUCH_BEGIN, %GDK_TOUCH_UPDATE,
   * %GDK_TOUCH_END or %GDK_TOUCH_CANCEL, returns the #GdkEventSequence
   * to which the event belongs. Otherwise, return %NULL.
   * Returns: the event sequence that the event belongs to
   */
  gdk.event_sequence.EventSequence getEventSequence()
  {
    GdkEventSequence* _cretval;
    _cretval = gdk_event_get_event_sequence(cast(const(GdkEvent)*)cPtr);
    auto _retval = _cretval ? new gdk.event_sequence.EventSequence(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the type of the event.
   * Returns: a #GdkEventType
   */
  gdk.types.EventType getEventType()
  {
    GdkEventType _cretval;
    _cretval = gdk_event_get_event_type(cast(const(GdkEvent)*)cPtr);
    gdk.types.EventType _retval = cast(gdk.types.EventType)_cretval;
    return _retval;
  }

  /**
   * Extracts the hardware keycode from an event.
   * Also see [gdk.event.Event.getScancode].
   * Params:
   *   keycode = location to store the keycode
   * Returns: %TRUE if the event delivered a hardware keycode
   */
  bool getKeycode(out ushort keycode)
  {
    bool _retval;
    _retval = gdk_event_get_keycode(cast(const(GdkEvent)*)cPtr, cast(ushort*)&keycode);
    return _retval;
  }

  /**
   * Extracts the keyval from an event.
   * Params:
   *   keyval = location to store the keyval
   * Returns: %TRUE if the event delivered a key symbol
   */
  bool getKeyval(out uint keyval)
  {
    bool _retval;
    _retval = gdk_event_get_keyval(cast(const(GdkEvent)*)cPtr, cast(uint*)&keyval);
    return _retval;
  }

  /**
   * #event: a #GdkEvent
   * Returns whether this event is an 'emulated' pointer event $(LPAREN)typically
   * from a touch event$(RPAREN), as opposed to a real one.
   * Returns: %TRUE if this event is emulated
   */
  bool getPointerEmulated()
  {
    bool _retval;
    _retval = gdk_event_get_pointer_emulated(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
   * Extract the root window relative x/y coordinates from an event.
   * Params:
   *   xRoot = location to put root window x coordinate
   *   yRoot = location to put root window y coordinate
   * Returns: %TRUE if the event delivered root window coordinates
   */
  bool getRootCoords(out double xRoot, out double yRoot)
  {
    bool _retval;
    _retval = gdk_event_get_root_coords(cast(const(GdkEvent)*)cPtr, cast(double*)&xRoot, cast(double*)&yRoot);
    return _retval;
  }

  /**
   * Gets the keyboard low-level scancode of a key event.
   * This is usually hardware_keycode. On Windows this is the high
   * word of WM_KEY{DOWN,UP} lParam which contains the scancode and
   * some extended flags.
   * Returns: The associated keyboard scancode or 0
   */
  int getScancode()
  {
    int _retval;
    _retval = gdk_event_get_scancode(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
   * Returns the screen for the event. The screen is
   * typically the screen for `event->any.window`, but
   * for events such as mouse events, it is the screen
   * where the pointer was when the event occurs -
   * that is, the screen which has the root window
   * to which `event->motion.x_root` and
   * `event->motion.y_root` are relative.
   * Returns: the screen for the event
   */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gdk_event_get_screen(cast(const(GdkEvent)*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the scroll deltas from a #GdkEvent
   * See also: [gdk.event.Event.getScrollDirection]
   * Params:
   *   deltaX = return location for X delta
   *   deltaY = return location for Y delta
   * Returns: %TRUE if the event contains smooth scroll information
   *   and %FALSE otherwise
   */
  bool getScrollDeltas(out double deltaX, out double deltaY)
  {
    bool _retval;
    _retval = gdk_event_get_scroll_deltas(cast(const(GdkEvent)*)cPtr, cast(double*)&deltaX, cast(double*)&deltaY);
    return _retval;
  }

  /**
   * Extracts the scroll direction from an event.
   * If event is not of type %GDK_SCROLL, the contents of direction
   * are undefined.
   * If you wish to handle both discrete and smooth scrolling, you
   * should check the return value of this function, or of
   * [gdk.event.Event.getScrollDeltas]; for instance:
   * |[<!-- language\="C" -->
   * GdkScrollDirection direction;
   * double vscroll_factor \= 0.0;
   * double x_scroll, y_scroll;
   * if $(LPAREN)gdk_event_get_scroll_direction $(LPAREN)event, &direction$(RPAREN)$(RPAREN)
   * {
   * // Handle discrete scrolling with a known constant delta;
   * const double delta \= 12.0;
   * switch $(LPAREN)direction$(RPAREN)
   * {
   * case GDK_SCROLL_UP:
   * vscroll_factor \= -delta;
   * break;
   * case GDK_SCROLL_DOWN:
   * vscroll_factor \= delta;
   * break;
   * default:
   * // no scrolling
   * break;
   * }
   * }
   * else if $(LPAREN)gdk_event_get_scroll_deltas $(LPAREN)event, &x_scroll, &y_scroll$(RPAREN)$(RPAREN)
   * {
   * // Handle smooth scrolling directly
   * vscroll_factor \= y_scroll;
   * }
   * ]|
   * Params:
   *   direction = location to store the scroll direction
   * Returns: %TRUE if the event delivered a scroll direction
   *   and %FALSE otherwise
   */
  bool getScrollDirection(out gdk.types.ScrollDirection direction)
  {
    bool _retval;
    _retval = gdk_event_get_scroll_direction(cast(const(GdkEvent)*)cPtr, &direction);
    return _retval;
  }

  /**
   * Returns the #GdkSeat this event was generated for.
   * Returns: The #GdkSeat of this event
   */
  gdk.seat.Seat getSeat()
  {
    GdkSeat* _cretval;
    _cretval = gdk_event_get_seat(cast(const(GdkEvent)*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
   * This function returns the hardware $(LPAREN)slave$(RPAREN) #GdkDevice that has
   * triggered the event, falling back to the virtual $(LPAREN)master$(RPAREN) device
   * $(LPAREN)as in [gdk.event.Event.getDevice]$(RPAREN) if the event wasn’t caused by
   * interaction with a hardware device. This may happen for example
   * in synthesized crossing events after a #GdkWindow updates its
   * geometry or a grab is acquired/released.
   * If the event does not contain a device field, this function will
   * return %NULL.
   * Returns: a #GdkDevice, or %NULL.
   */
  gdk.device.Device getSourceDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_event_get_source_device(cast(const(GdkEvent)*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
   * If the event contains a “state” field, puts that field in state. Otherwise
   * stores an empty state $(LPAREN)0$(RPAREN). Returns %TRUE if there was a state field
   * in the event. event may be %NULL, in which case it’s treated
   * as if the event had no state field.
   * Params:
   *   state = return location for state
   * Returns: %TRUE if there was a state field in the event
   */
  bool getState(out gdk.types.ModifierType state)
  {
    bool _retval;
    _retval = gdk_event_get_state(cast(const(GdkEvent)*)cPtr, &state);
    return _retval;
  }

  /**
   * Returns the time stamp from event, if there is one; otherwise
   * returns #GDK_CURRENT_TIME. If event is %NULL, returns #GDK_CURRENT_TIME.
   * Returns: time stamp field from event
   */
  uint getTime()
  {
    uint _retval;
    _retval = gdk_event_get_time(cast(const(GdkEvent)*)cPtr);
    return _retval;
  }

  /**
   * Extracts the #GdkWindow associated with an event.
   * Returns: The #GdkWindow associated with the event
   */
  gdk.window.Window getWindow()
  {
    GdkWindow* _cretval;
    _cretval = gdk_event_get_window(cast(const(GdkEvent)*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Check whether a scroll event is a stop scroll event. Scroll sequences
   * with smooth scroll information may provide a stop scroll event once the
   * interaction with the device finishes, e.g. by lifting a finger. This
   * stop scroll event is the signal that a widget may trigger kinetic
   * scrolling based on the current velocity.
   * Stop scroll events always have a a delta of 0/0.
   * Returns: %TRUE if the event is a scroll stop event
   */
  bool isScrollStopEvent()
  {
    bool _retval;
    _retval = gdk_event_is_scroll_stop_event(cast(const(GdkEvent)*)cPtr);
    return _retval;
  }

  /**
   * Appends a copy of the given event onto the front of the event
   * queue for event->any.window’s display, or the default event
   * queue if event->any.window is %NULL. See [gdk.display.Display.putEvent].
   */
  void put()
  {
    gdk_event_put(cast(const(GdkEvent)*)cPtr);
  }

  /**
   * Sets the device for event to device. The event must
   * have been allocated by GTK+, for instance, by
   * [gdk.event.Event.copy].
   * Params:
   *   device = a #GdkDevice
   */
  void setDevice(gdk.device.Device device)
  {
    gdk_event_set_device(cast(GdkEvent*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null);
  }

  /**
   * Sets the device tool for this event, should be rarely used.
   * Params:
   *   tool = tool to set on the event, or %NULL
   */
  void setDeviceTool(gdk.device_tool.DeviceTool tool)
  {
    gdk_event_set_device_tool(cast(GdkEvent*)cPtr, tool ? cast(GdkDeviceTool*)tool.cPtr(No.Dup) : null);
  }

  /**
   * Sets the screen for event to screen. The event must
   * have been allocated by GTK+, for instance, by
   * [gdk.event.Event.copy].
   * Params:
   *   screen = a #GdkScreen
   */
  void setScreen(gdk.screen.Screen screen)
  {
    gdk_event_set_screen(cast(GdkEvent*)cPtr, screen ? cast(GdkScreen*)screen.cPtr(No.Dup) : null);
  }

  /**
   * Sets the slave device for event to device.
   * The event must have been allocated by GTK+,
   * for instance by [gdk.event.Event.copy].
   * Params:
   *   device = a #GdkDevice
   */
  void setSourceDevice(gdk.device.Device device)
  {
    gdk_event_set_source_device(cast(GdkEvent*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.Dup) : null);
  }

  /**
   * This function returns whether a #GdkEventButton should trigger a
   * context menu, according to platform conventions. The right mouse
   * button always triggers context menus. Additionally, if
   * [gdk.keymap.Keymap.getModifierMask] returns a non-0 mask for
   * %GDK_MODIFIER_INTENT_CONTEXT_MENU, then the left mouse button will
   * also trigger a context menu if this modifier is pressed.
   * This function should always be used instead of simply checking for
   * event->button \=\= %GDK_BUTTON_SECONDARY.
   * Returns: %TRUE if the event should trigger a context menu.
   */
  bool triggersContextMenu()
  {
    bool _retval;
    _retval = gdk_event_triggers_context_menu(cast(const(GdkEvent)*)cPtr);
    return _retval;
  }

  /**
   * Checks all open displays for a #GdkEvent to process,to be processed
   * on, fetching events from the windowing system if necessary.
   * See [gdk.display.Display.getEvent].
   * Returns: the next #GdkEvent to be processed, or %NULL
   *   if no events are pending. The returned #GdkEvent should be freed
   *   with [gdk.event.Event.free].
   */
  static gdk.event.Event get()
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_get();
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval) : null;
    return _retval;
  }

  /**
   * Sets the function to call to handle all events from GDK.
   * Note that GTK+ uses this to install its own event handler, so it is
   * usually not useful for GTK+ applications. $(LPAREN)Although an application
   * can call this function then call [gtk.global.mainDoEvent] to pass
   * events to GTK+.$(RPAREN)
   * Params:
   *   func = the function to call to handle events from GDK.
   */
  static void handlerSet(gdk.types.EventFunc func)
  {
    extern(C) void _funcCallback(GdkEvent* event, void* data)
    {
      auto _dlg = cast(gdk.types.EventFunc*)data;

      (*_dlg)(event ? new gdk.event.Event(cast(void*)event, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gdk_event_handler_set(_funcCB, _func, _funcDestroyCB);
  }

  /**
   * If there is an event waiting in the event queue of some open
   * display, returns a copy of it. See [gdk.display.Display.peekEvent].
   * Returns: a copy of the first #GdkEvent on some event
   *   queue, or %NULL if no events are in any queues. The returned
   *   #GdkEvent should be freed with [gdk.event.Event.free].
   */
  static gdk.event.Event peek()
  {
    GdkEvent* _cretval;
    _cretval = gdk_event_peek();
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval) : null;
    return _retval;
  }

  /**
   * Request more motion notifies if event is a motion notify hint event.
   * This function should be used instead of [gdk.window.Window.getPointer] to
   * request further motion notifies, because it also works for extension
   * events where motion notifies are provided for devices other than the
   * core pointer. Coordinate extraction, processing and requesting more
   * motion events from a %GDK_MOTION_NOTIFY event usually works like this:
   * |[<!-- language\="C" -->
   * {
   * // motion_event handler
   * x \= motion_event->x;
   * y \= motion_event->y;
   * // handle $(LPAREN)x,y$(RPAREN) motion
   * gdk_event_request_motions $(LPAREN)motion_event$(RPAREN); // handles is_hint events
   * }
   * ]|
   * Params:
   *   event = a valid #GdkEvent
   */
  static void requestMotions(gdk.event_motion.EventMotion event)
  {
    gdk_event_request_motions(event ? cast(const(GdkEventMotion)*)event.cPtr : null);
  }
}
