module gdk.display;

import gdk.app_launch_context;
import gdk.atom;
import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.device_manager;
import gdk.event;
import gdk.monitor;
import gdk.screen;
import gdk.seat;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    #GdkDisplay objects purpose are two fold:
  
  $(LIST
    * To manage and provide information about input devices (pointers and keyboards)
    
    * To manage and provide information about the available #GdkScreens
  )
    
  GdkDisplay objects are the GDK representation of an X Display,
  which can be described as a workstation consisting of
  a keyboard, a pointing device (such as a mouse) and one or more
  screens.
  It is used to open and keep track of various GdkScreen objects
  currently instantiated by the application. It is also used to
  access the keyboard(s) and mouse pointer(s) of the display.
  
  Most of the input device handling has been factored out into
  the separate #GdkDeviceManager object. Every display has a
  device manager, which you can obtain using
  [gdk.display.Display.getDeviceManager].
*/
class Display : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_display_get_type != &gidSymbolNotFound ? gdk_display_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Gets the default #GdkDisplay. This is a convenience
    function for:
    `gdk_display_manager_get_default_display (gdk_display_manager_get ())`.
    Returns:     a #GdkDisplay, or null if
        there is no default display.
  */
  static gdk.display.Display getDefault()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_display_get_default();
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.take);
    return _retval;
  }

  /**
      Opens a display.
    Params:
      displayName =       the name of the display to open
    Returns:     a #GdkDisplay, or null if the
          display could not be opened
  */
  static gdk.display.Display open(string displayName)
  {
    GdkDisplay* _cretval;
    const(char)* _displayName = displayName.toCString(No.alloc);
    _cretval = gdk_display_open(_displayName);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.take);
    return _retval;
  }

  /**
      Opens the default display specified by command line arguments or
    environment variables, sets it as the default display, and returns
    it. [gdk.global.parseArgs] must have been called first. If the default
    display has previously been set, simply returns that. An internal
    function that should not be used by applications.
    Returns:     the default display, if it
        could be opened, otherwise null.
  
    Deprecated:     This symbol was never meant to be used outside
        of GTK+
  */
  static gdk.display.Display openDefaultLibgtkOnly()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_display_open_default_libgtk_only();
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.take);
    return _retval;
  }

  /**
      Emits a short beep on display
  */
  void beep()
  {
    gdk_display_beep(cast(GdkDisplay*)cPtr);
  }

  /**
      Closes the connection to the windowing system for the given display,
    and cleans up associated resources.
  */
  void close()
  {
    gdk_display_close(cast(GdkDisplay*)cPtr);
  }

  /**
      Returns true if there is an ongoing grab on device for display.
    Params:
      device =       a #GdkDevice
    Returns:     true if there is a grab in effect for device.
  */
  bool deviceIsGrabbed(gdk.device.Device device)
  {
    bool _retval;
    _retval = gdk_display_device_is_grabbed(cast(GdkDisplay*)cPtr, device ? cast(GdkDevice*)device.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Flushes any requests queued for the windowing system; this happens automatically
    when the main loop blocks waiting for new events, but if your application
    is drawing without returning control to the main loop, you may need
    to call this function explicitly. A common case where this function
    needs to be called is when an application is executing drawing commands
    from a thread other than the thread where the main loop is running.
    
    This is most useful for X11. On windowing systems where requests are
    handled synchronously, this function will do nothing.
  */
  void flush()
  {
    gdk_display_flush(cast(GdkDisplay*)cPtr);
  }

  /**
      Returns a #GdkAppLaunchContext suitable for launching
    applications on the given display.
    Returns:     a new #GdkAppLaunchContext for display.
          Free with [gobject.object.ObjectG.unref] when done
  */
  gdk.app_launch_context.AppLaunchContext getAppLaunchContext()
  {
    GdkAppLaunchContext* _cretval;
    _cretval = gdk_display_get_app_launch_context(cast(GdkDisplay*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.app_launch_context.AppLaunchContext)(cast(GdkAppLaunchContext*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Returns the default size to use for cursors on display.
    Returns:     the default cursor size.
  */
  uint getDefaultCursorSize()
  {
    uint _retval;
    _retval = gdk_display_get_default_cursor_size(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns the default group leader window for all toplevel windows
    on display. This window is implicitly created by GDK.
    See [gdk.window.Window.setGroup].
    Returns:     The default group leader window
      for display
  */
  gdk.window.Window getDefaultGroup()
  {
    GdkWindow* _cretval;
    _cretval = gdk_display_get_default_group(cast(GdkDisplay*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.take);
    return _retval;
  }

  /**
      Get the default #GdkScreen for display.
    Returns:     the default #GdkScreen object for display
  */
  gdk.screen.Screen getDefaultScreen()
  {
    GdkScreen* _cretval;
    _cretval = gdk_display_get_default_screen(cast(GdkDisplay*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the default #GdkSeat for this display.
    Returns:     the default seat.
  */
  gdk.seat.Seat getDefaultSeat()
  {
    GdkSeat* _cretval;
    _cretval = gdk_display_get_default_seat(cast(GdkDisplay*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.seat.Seat)(cast(GdkSeat*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the #GdkDeviceManager associated to display.
    Returns:     A #GdkDeviceManager, or
               null. This memory is owned by GDK and must not be freed
               or unreferenced.
  
    Deprecated:     Use [gdk.display.Display.getDefaultSeat] and #GdkSeat operations.
  */
  gdk.device_manager.DeviceManager getDeviceManager()
  {
    GdkDeviceManager* _cretval;
    _cretval = gdk_display_get_device_manager(cast(GdkDisplay*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device_manager.DeviceManager)(cast(GdkDeviceManager*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the next #GdkEvent to be processed for display, fetching events from the
    windowing system if necessary.
    Returns:     the next #GdkEvent to be processed, or null
      if no events are pending. The returned #GdkEvent should be freed
      with [gdk.event.Event.free].
  */
  gdk.event.Event getEvent()
  {
    GdkEvent* _cretval;
    _cretval = gdk_display_get_event(cast(GdkDisplay*)cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval) : null;
    return _retval;
  }

  /**
      Gets the maximal size to use for cursors on display.
    Params:
      width =       the return location for the maximal cursor width
      height =       the return location for the maximal cursor height
  */
  void getMaximalCursorSize(out uint width, out uint height)
  {
    gdk_display_get_maximal_cursor_size(cast(GdkDisplay*)cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /**
      Gets a monitor associated with this display.
    Params:
      monitorNum =       number of the monitor
    Returns:     the #GdkMonitor, or null if
         monitor_num is not a valid monitor number
  */
  gdk.monitor.Monitor getMonitor(int monitorNum)
  {
    GdkMonitor* _cretval;
    _cretval = gdk_display_get_monitor(cast(GdkDisplay*)cPtr, monitorNum);
    auto _retval = ObjectG.getDObject!(gdk.monitor.Monitor)(cast(GdkMonitor*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the monitor in which the point (x, y) is located,
    or a nearby monitor if the point is not in any monitor.
    Params:
      x =       the x coordinate of the point
      y =       the y coordinate of the point
    Returns:     the monitor containing the point
  */
  gdk.monitor.Monitor getMonitorAtPoint(int x, int y)
  {
    GdkMonitor* _cretval;
    _cretval = gdk_display_get_monitor_at_point(cast(GdkDisplay*)cPtr, x, y);
    auto _retval = ObjectG.getDObject!(gdk.monitor.Monitor)(cast(GdkMonitor*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the monitor in which the largest area of window
    resides, or a monitor close to window if it is outside
    of all monitors.
    Params:
      window =       a #GdkWindow
    Returns:     the monitor with the largest overlap with window
  */
  gdk.monitor.Monitor getMonitorAtWindow(gdk.window.Window window)
  {
    GdkMonitor* _cretval;
    _cretval = gdk_display_get_monitor_at_window(cast(GdkDisplay*)cPtr, window ? cast(GdkWindow*)window.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gdk.monitor.Monitor)(cast(GdkMonitor*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the number of monitors that belong to display.
    
    The returned number is valid until the next emission of the
    #GdkDisplay::monitor-added or #GdkDisplay::monitor-removed signal.
    Returns:     the number of monitors
  */
  int getNMonitors()
  {
    int _retval;
    _retval = gdk_display_get_n_monitors(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Gets the number of screen managed by the display.
    Returns:     number of screens.
  
    Deprecated:     The number of screens is always 1.
  */
  int getNScreens()
  {
    int _retval;
    _retval = gdk_display_get_n_screens(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Gets the name of the display.
    Returns:     a string representing the display name. This string is owned
      by GDK and should not be modified or freed.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gdk_display_get_name(cast(GdkDisplay*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the current location of the pointer and the current modifier
    mask for a given display.
    Params:
      screen =       location to store the screen that the
                 cursor is on, or null.
      x =       location to store root window X coordinate of pointer, or null.
      y =       location to store root window Y coordinate of pointer, or null.
      mask =       location to store current modifier mask, or null
  
    Deprecated:     Use [gdk.device.Device.getPosition] instead.
  */
  void getPointer(out gdk.screen.Screen screen, out int x, out int y, out gdk.types.ModifierType mask)
  {
    GdkScreen* _screen;
    gdk_display_get_pointer(cast(GdkDisplay*)cPtr, &_screen, cast(int*)&x, cast(int*)&y, &mask);
    screen = new gdk.screen.Screen(cast(void*)_screen, No.take);
  }

  /**
      Gets the primary monitor for the display.
    
    The primary monitor is considered the monitor where the “main desktop”
    lives. While normal application windows typically allow the window
    manager to place the windows, specialized desktop applications
    such as panels should place themselves on the primary monitor.
    Returns:     the primary monitor, or null if no primary
          monitor is configured by the user
  */
  gdk.monitor.Monitor getPrimaryMonitor()
  {
    GdkMonitor* _cretval;
    _cretval = gdk_display_get_primary_monitor(cast(GdkDisplay*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.monitor.Monitor)(cast(GdkMonitor*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns a screen object for one of the screens of the display.
    Params:
      screenNum =       the screen number
    Returns:     the #GdkScreen object
  
    Deprecated:     There is only one screen; use [gdk.display.Display.getDefaultScreen] to get it.
  */
  gdk.screen.Screen getScreen(int screenNum)
  {
    GdkScreen* _cretval;
    _cretval = gdk_display_get_screen(cast(GdkDisplay*)cPtr, screenNum);
    auto _retval = ObjectG.getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.take);
    return _retval;
  }

  /**
      Obtains the window underneath the mouse pointer, returning the location
    of the pointer in that window in win_x, win_y for screen. Returns null
    if the window under the mouse pointer is not known to GDK (for example,
    belongs to another application).
    Params:
      winX =       return location for x coordinate of the pointer location relative
           to the window origin, or null
      winY =       return location for y coordinate of the pointer location relative
         &    to the window origin, or null
    Returns:     the window under the mouse
        pointer, or null
  
    Deprecated:     Use [gdk.device.Device.getWindowAtPosition] instead.
  */
  gdk.window.Window getWindowAtPointer(out int winX, out int winY)
  {
    GdkWindow* _cretval;
    _cretval = gdk_display_get_window_at_pointer(cast(GdkDisplay*)cPtr, cast(int*)&winX, cast(int*)&winY);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns whether the display has events that are waiting
    to be processed.
    Returns:     true if there are events ready to be processed.
  */
  bool hasPending()
  {
    bool _retval;
    _retval = gdk_display_has_pending(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Finds out if the display has been closed.
    Returns:     true if the display is closed.
  */
  bool isClosed()
  {
    bool _retval;
    _retval = gdk_display_is_closed(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Release any keyboard grab
    Params:
      time =       a timestap (e.g #GDK_CURRENT_TIME).
  
    Deprecated:     Use [gdk.device.Device.ungrab], together with [gdk.device.Device.grab]
                  instead.
  */
  void keyboardUngrab(uint time)
  {
    gdk_display_keyboard_ungrab(cast(GdkDisplay*)cPtr, time);
  }

  /**
      Returns the list of available input devices attached to display.
    The list is statically allocated and should not be freed.
    Returns:     a list of #GdkDevice
  
    Deprecated:     Use [gdk.device_manager.DeviceManager.listDevices] instead.
  */
  gdk.device.Device[] listDevices()
  {
    GList* _cretval;
    _cretval = gdk_display_list_devices(cast(GdkDisplay*)cPtr);
    auto _retval = gListToD!(gdk.device.Device, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the list of seats known to display.
    Returns:     the
               list of seats known to the #GdkDisplay
  */
  gdk.seat.Seat[] listSeats()
  {
    GList* _cretval;
    _cretval = gdk_display_list_seats(cast(GdkDisplay*)cPtr);
    auto _retval = gListToD!(gdk.seat.Seat, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Indicates to the GUI environment that the application has
    finished loading, using a given identifier.
    
    GTK+ will call this function automatically for #GtkWindow
    with custom startup-notification identifier unless
    [gtk.window.Window.setAutoStartupNotification] is called to
    disable that feature.
    Params:
      startupId =       a startup-notification identifier, for which
            notification process should be completed
  */
  void notifyStartupComplete(string startupId)
  {
    const(char)* _startupId = startupId.toCString(No.alloc);
    gdk_display_notify_startup_complete(cast(GdkDisplay*)cPtr, _startupId);
  }

  /**
      Gets a copy of the first #GdkEvent in the display’s event queue, without
    removing the event from the queue.  (Note that this function will
    not get more events from the windowing system.  It only checks the events
    that have already been moved to the GDK event queue.)
    Returns:     a copy of the first #GdkEvent on the event
      queue, or null if no events are in the queue. The returned
      #GdkEvent should be freed with [gdk.event.Event.free].
  */
  gdk.event.Event peekEvent()
  {
    GdkEvent* _cretval;
    _cretval = gdk_display_peek_event(cast(GdkDisplay*)cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval) : null;
    return _retval;
  }

  /**
      Test if the pointer is grabbed.
    Returns:     true if an active X pointer grab is in effect
  
    Deprecated:     Use [gdk.display.Display.deviceIsGrabbed] instead.
  */
  bool pointerIsGrabbed()
  {
    bool _retval;
    _retval = gdk_display_pointer_is_grabbed(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Release any pointer grab.
    Params:
      time =       a timestap (e.g. `GDK_CURRENT_TIME`).
  
    Deprecated:     Use [gdk.device.Device.ungrab], together with [gdk.device.Device.grab]
                  instead.
  */
  void pointerUngrab(uint time)
  {
    gdk_display_pointer_ungrab(cast(GdkDisplay*)cPtr, time);
  }

  /**
      Appends a copy of the given event onto the front of the event
    queue for display.
    Params:
      event =       a #GdkEvent.
  */
  void putEvent(gdk.event.Event event)
  {
    gdk_display_put_event(cast(GdkDisplay*)cPtr, event ? cast(const(GdkEvent)*)event.cPtr : null);
  }

  /**
      Request #GdkEventOwnerChange events for ownership changes
    of the selection named by the given atom.
    Params:
      selection =       the #GdkAtom naming the selection for which
                    ownership change notification is requested
    Returns:     whether #GdkEventOwnerChange events will
                    be sent.
  */
  bool requestSelectionNotification(gdk.atom.Atom selection)
  {
    bool _retval;
    _retval = gdk_display_request_selection_notification(cast(GdkDisplay*)cPtr, selection ? cast(GdkAtom)selection.cPtr : null);
    return _retval;
  }

  /**
      Sets the double click distance (two clicks within this distance
    count as a double click and result in a #GDK_2BUTTON_PRESS event).
    See also [gdk.display.Display.setDoubleClickTime].
    Applications should not set this, it is a global
    user-configured setting.
    Params:
      distance =       distance in pixels
  */
  void setDoubleClickDistance(uint distance)
  {
    gdk_display_set_double_click_distance(cast(GdkDisplay*)cPtr, distance);
  }

  /**
      Sets the double click time (two clicks within this time interval
    count as a double click and result in a #GDK_2BUTTON_PRESS event).
    Applications should not set this, it is a global
    user-configured setting.
    Params:
      msec =       double click time in milliseconds (thousandths of a second)
  */
  void setDoubleClickTime(uint msec)
  {
    gdk_display_set_double_click_time(cast(GdkDisplay*)cPtr, msec);
  }

  /**
      Returns whether the speicifed display supports clipboard
    persistance; i.e. if it’s possible to store the clipboard data after an
    application has quit. On X11 this checks if a clipboard daemon is
    running.
    Returns:     true if the display supports clipboard persistance.
  */
  bool supportsClipboardPersistence()
  {
    bool _retval;
    _retval = gdk_display_supports_clipboard_persistence(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns true if [gdk.window.Window.setComposited] can be used
    to redirect drawing on the window using compositing.
    
    Currently this only works on X11 with XComposite and
    XDamage extensions available.
    Returns:     true if windows may be composited.
  
    Deprecated:     Compositing is an outdated technology that
        only ever worked on X11.
  */
  bool supportsComposite()
  {
    bool _retval;
    _retval = gdk_display_supports_composite(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns true if cursors can use an 8bit alpha channel
    on display. Otherwise, cursors are restricted to bilevel
    alpha (i.e. a mask).
    Returns:     whether cursors can have alpha channels.
  */
  bool supportsCursorAlpha()
  {
    bool _retval;
    _retval = gdk_display_supports_cursor_alpha(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns true if multicolored cursors are supported
    on display. Otherwise, cursors have only a forground
    and a background color.
    Returns:     whether cursors can have multiple colors.
  */
  bool supportsCursorColor()
  {
    bool _retval;
    _retval = gdk_display_supports_cursor_color(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns true if gdk_window_input_shape_combine_mask() can
    be used to modify the input shape of windows on display.
    Returns:     true if windows with modified input shape are supported
  */
  bool supportsInputShapes()
  {
    bool _retval;
    _retval = gdk_display_supports_input_shapes(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns whether #GdkEventOwnerChange events will be
    sent when the owner of a selection changes.
    Returns:     whether #GdkEventOwnerChange events will
                    be sent.
  */
  bool supportsSelectionNotification()
  {
    bool _retval;
    _retval = gdk_display_supports_selection_notification(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Returns true if gdk_window_shape_combine_mask() can
    be used to create shaped windows on display.
    Returns:     true if shaped windows are supported
  */
  bool supportsShapes()
  {
    bool _retval;
    _retval = gdk_display_supports_shapes(cast(GdkDisplay*)cPtr);
    return _retval;
  }

  /**
      Flushes any requests queued for the windowing system and waits until all
    requests have been handled. This is often used for making sure that the
    display is synchronized with the current state of the program. Calling
    [gdk.display.Display.sync] before [gdk.global.errorTrapPop] makes sure that any errors
    generated from earlier requests are handled before the error trap is
    removed.
    
    This is most useful for X11. On windowing systems where requests are
    handled synchronously, this function will do nothing.
  */
  void sync()
  {
    gdk_display_sync(cast(GdkDisplay*)cPtr);
  }

  /**
      Warps the pointer of display to the point x,y on
    the screen screen, unless the pointer is confined
    to a window by a grab, in which case it will be moved
    as far as allowed by the grab. Warping the pointer
    creates events as if the user had moved the mouse
    instantaneously to the destination.
    
    Note that the pointer should normally be under the
    control of the user. This function was added to cover
    some rare use cases like keyboard navigation support
    for the color picker in the #GtkColorSelectionDialog.
    Params:
      screen =       the screen of display to warp the pointer to
      x =       the x coordinate of the destination
      y =       the y coordinate of the destination
  
    Deprecated:     Use [gdk.device.Device.warp] instead.
  */
  void warpPointer(gdk.screen.Screen screen, int x, int y)
  {
    gdk_display_warp_pointer(cast(GdkDisplay*)cPtr, screen ? cast(GdkScreen*)screen.cPtr(No.dup) : null, x, y);
  }

  /**
      The ::closed signal is emitted when the connection to the windowing
    system for display is closed.
  
    ## Parameters
    $(LIST
      * $(B isError)       true if the display was closed due to an error
      * $(B display) the instance the signal is connected to
    )
  */
  alias ClosedCallbackDlg = void delegate(bool isError, gdk.display.Display display);

  /** ditto */
  alias ClosedCallbackFunc = void function(bool isError, gdk.display.Display display);

  /**
    Connect to Closed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectClosed(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ClosedCallbackDlg) || is(T : ClosedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto display = getVal!(gdk.display.Display)(_paramVals);
      auto isError = getVal!(bool)(&_paramVals[1]);
      _dClosure.dlg(isError, display);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }

  /**
      The ::monitor-added signal is emitted whenever a monitor is
    added.
  
    ## Parameters
    $(LIST
      * $(B monitor)       the monitor that was just added
      * $(B display) the instance the signal is connected to
    )
  */
  alias MonitorAddedCallbackDlg = void delegate(gdk.monitor.Monitor monitor, gdk.display.Display display);

  /** ditto */
  alias MonitorAddedCallbackFunc = void function(gdk.monitor.Monitor monitor, gdk.display.Display display);

  /**
    Connect to MonitorAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectMonitorAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : MonitorAddedCallbackDlg) || is(T : MonitorAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto display = getVal!(gdk.display.Display)(_paramVals);
      auto monitor = getVal!(gdk.monitor.Monitor)(&_paramVals[1]);
      _dClosure.dlg(monitor, display);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("monitor-added", closure, after);
  }

  /**
      The ::monitor-removed signal is emitted whenever a monitor is
    removed.
  
    ## Parameters
    $(LIST
      * $(B monitor)       the monitor that was just removed
      * $(B display) the instance the signal is connected to
    )
  */
  alias MonitorRemovedCallbackDlg = void delegate(gdk.monitor.Monitor monitor, gdk.display.Display display);

  /** ditto */
  alias MonitorRemovedCallbackFunc = void function(gdk.monitor.Monitor monitor, gdk.display.Display display);

  /**
    Connect to MonitorRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectMonitorRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : MonitorRemovedCallbackDlg) || is(T : MonitorRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto display = getVal!(gdk.display.Display)(_paramVals);
      auto monitor = getVal!(gdk.monitor.Monitor)(&_paramVals[1]);
      _dClosure.dlg(monitor, display);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("monitor-removed", closure, after);
  }

  /**
      The ::opened signal is emitted when the connection to the windowing
    system for display is opened.
  
    ## Parameters
    $(LIST
      * $(B display) the instance the signal is connected to
    )
  */
  alias OpenedCallbackDlg = void delegate(gdk.display.Display display);

  /** ditto */
  alias OpenedCallbackFunc = void function(gdk.display.Display display);

  /**
    Connect to Opened signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectOpened(T)(T callback, Flag!"after" after = No.after)
  if (is(T : OpenedCallbackDlg) || is(T : OpenedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto display = getVal!(gdk.display.Display)(_paramVals);
      _dClosure.dlg(display);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("opened", closure, after);
  }

  /**
      The ::seat-added signal is emitted whenever a new seat is made
    known to the windowing system.
  
    ## Parameters
    $(LIST
      * $(B seat)       the seat that was just added
      * $(B display) the instance the signal is connected to
    )
  */
  alias SeatAddedCallbackDlg = void delegate(gdk.seat.Seat seat, gdk.display.Display display);

  /** ditto */
  alias SeatAddedCallbackFunc = void function(gdk.seat.Seat seat, gdk.display.Display display);

  /**
    Connect to SeatAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectSeatAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : SeatAddedCallbackDlg) || is(T : SeatAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto display = getVal!(gdk.display.Display)(_paramVals);
      auto seat = getVal!(gdk.seat.Seat)(&_paramVals[1]);
      _dClosure.dlg(seat, display);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("seat-added", closure, after);
  }

  /**
      The ::seat-removed signal is emitted whenever a seat is removed
    by the windowing system.
  
    ## Parameters
    $(LIST
      * $(B seat)       the seat that was just removed
      * $(B display) the instance the signal is connected to
    )
  */
  alias SeatRemovedCallbackDlg = void delegate(gdk.seat.Seat seat, gdk.display.Display display);

  /** ditto */
  alias SeatRemovedCallbackFunc = void function(gdk.seat.Seat seat, gdk.display.Display display);

  /**
    Connect to SeatRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectSeatRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : SeatRemovedCallbackDlg) || is(T : SeatRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto display = getVal!(gdk.display.Display)(_paramVals);
      auto seat = getVal!(gdk.seat.Seat)(&_paramVals[1]);
      _dClosure.dlg(seat, display);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("seat-removed", closure, after);
  }
}
