module gdk.c.types;

public import gid.basictypes;
public import gdkpixbuf.c.types;
public import gio.c.types;
public import pango.c.types;
public import cairo.c.types;
import gdk.types;

/**
    Used to represent native events (XEvents for the X11
  backend, MSGs for Win32).
*/
alias GdkXEvent = void;


// Enums
alias GdkAnchorHints = gdk.types.AnchorHints;
alias GdkAxisFlags = gdk.types.AxisFlags;
alias GdkAxisUse = gdk.types.AxisUse;
alias GdkByteOrder = gdk.types.ByteOrder;
alias GdkCrossingMode = gdk.types.CrossingMode;
alias GdkCursorType = gdk.types.CursorType;
alias GdkDevicePadFeature = gdk.types.DevicePadFeature;
alias GdkDeviceToolType = gdk.types.DeviceToolType;
alias GdkDeviceType = gdk.types.DeviceType;
alias GdkDragAction = gdk.types.DragAction;
alias GdkDragCancelReason = gdk.types.DragCancelReason;
alias GdkDragProtocol = gdk.types.DragProtocol;
alias GdkEventMask = gdk.types.EventMask;
alias GdkEventType = gdk.types.EventType;
alias GdkFilterReturn = gdk.types.FilterReturn;
alias GdkFrameClockPhase = gdk.types.FrameClockPhase;
alias GdkFullscreenMode = gdk.types.FullscreenMode;
alias GdkGLError = gdk.types.GLError;
alias GdkGrabOwnership = gdk.types.GrabOwnership;
alias GdkGrabStatus = gdk.types.GrabStatus;
alias GdkGravity = gdk.types.Gravity;
alias GdkInputMode = gdk.types.InputMode;
alias GdkInputSource = gdk.types.InputSource;
alias GdkModifierIntent = gdk.types.ModifierIntent;
alias GdkModifierType = gdk.types.ModifierType;
alias GdkNotifyType = gdk.types.NotifyType;
alias GdkOwnerChange = gdk.types.OwnerChange;
alias GdkPropMode = gdk.types.PropMode;
alias GdkPropertyState = gdk.types.PropertyState;
alias GdkScrollDirection = gdk.types.ScrollDirection;
alias GdkSeatCapabilities = gdk.types.SeatCapabilities;
alias GdkSettingAction = gdk.types.SettingAction;
alias GdkStatus = gdk.types.Status;
alias GdkSubpixelLayout = gdk.types.SubpixelLayout;
alias GdkTouchpadGesturePhase = gdk.types.TouchpadGesturePhase;
alias GdkVisibilityState = gdk.types.VisibilityState;
alias GdkVisualType = gdk.types.VisualType;
alias GdkWMDecoration = gdk.types.WMDecoration;
alias GdkWMFunction = gdk.types.WMFunction;
alias GdkWindowAttributesType = gdk.types.WindowAttributesType;
alias GdkWindowEdge = gdk.types.WindowEdge;
alias GdkWindowHints = gdk.types.WindowHints;
alias GdkWindowState = gdk.types.WindowState;
alias GdkWindowType = gdk.types.WindowType;
alias GdkWindowTypeHint = gdk.types.WindowTypeHint;
alias GdkWindowWindowClass = gdk.types.WindowWindowClass;
/**
    GdkAppLaunchContext is an implementation of #GAppLaunchContext that
  handles launching an application in a graphical context. It provides
  startup notification and allows to launch applications on a specific
  screen or workspace.
  
  ## Launching an application
  
  ```c
  GdkAppLaunchContext *context;
  
  context = gdk_display_get_app_launch_context (display);
  
  gdk_app_launch_context_set_screen (screen);
  gdk_app_launch_context_set_timestamp (event->time);
  
  if (!g_app_info_launch_default_for_uri ("http://www.gtk.org", context, &error))
    g_warning ("Launching failed: %s\n", error->message);
  
  g_object_unref (context);
  ```
*/
struct GdkAppLaunchContext;

/**
    An opaque type representing a string as an index into a table
  of strings on the X server.
*/
alias GdkAtom = GdkAtom_st*;

struct GdkAtom_st;

/**
    A #GdkColor is used to describe a color,
  similar to the XColor struct used in the X11 drawing API.

  Deprecated:     Use #GdkRGBA
*/
struct GdkColor
{
  /**
      For allocated colors, the pixel value used to
        draw this color on the screen. Not used anymore.
  */
  uint pixel;

  /**
      The red component of the color. This is
        a value between 0 and 65535, with 65535 indicating
        full intensity
  */
  ushort red;

  /**
      The green component of the color
  */
  ushort green;

  /**
      The blue component of the color
  */
  ushort blue;
}

/**
    A #GdkCursor represents a cursor. Its contents are private.
*/
struct GdkCursor;

/**
    The #GdkDevice object represents a single input device, such
  as a keyboard, a mouse, a touchpad, etc.
  
  See the #GdkDeviceManager documentation for more information
  about the various kinds of master and slave devices, and their
  relationships.
*/
struct GdkDevice;

/**
    In addition to a single pointer and keyboard for user interface input,
  GDK contains support for a variety of input devices, including graphics
  tablets, touchscreens and multiple pointers/keyboards interacting
  simultaneously with the user interface. Such input devices often have
  additional features, such as sub-pixel positioning information and
  additional device-dependent information.
  
  In order to query the device hierarchy and be aware of changes in the
  device hierarchy (such as virtual devices being created or removed, or
  physical devices being plugged or unplugged), GDK provides
  #GdkDeviceManager.
  
  By default, and if the platform supports it, GDK is aware of multiple
  keyboard/pointer pairs and multitouch devices. This behavior can be
  changed by calling [gdk.global.disableMultidevice] before [gdk.display.Display.open].
  There should rarely be a need to do that though, since GDK defaults
  to a compatibility mode in which it will emit just one enter/leave
  event pair for all devices on a window. To enable per-device
  enter/leave events and other multi-pointer interaction features,
  [gdk.window.Window.setSupportMultidevice] must be called on
  #GdkWindows (or [gtk.widget.Widget.setSupportMultidevice] on widgets).
  window. See the [gdk.window.Window.setSupportMultidevice] documentation
  for more information.
  
  On X11, multi-device support is implemented through XInput 2.
  Unless [gdk.global.disableMultidevice] is called, the XInput 2
  #GdkDeviceManager implementation will be used as the input source.
  Otherwise either the core or XInput 1 implementations will be used.
  
  For simple applications that don’t have any special interest in
  input devices, the so-called “client pointer”
  provides a reasonable approximation to a simple setup with a single
  pointer and keyboard. The device that has been set as the client
  pointer can be accessed via [gdk.device_manager.DeviceManager.getClientPointer].
  
  Conceptually, in multidevice mode there are 2 device types. Virtual
  devices (or master devices) are represented by the pointer cursors
  and keyboard foci that are seen on the screen. Physical devices (or
  slave devices) represent the hardware that is controlling the virtual
  devices, and thus have no visible cursor on the screen.
  
  Virtual devices are always paired, so there is a keyboard device for every
  pointer device. Associations between devices may be inspected through
  [gdk.device.Device.getAssociatedDevice].
  
  There may be several virtual devices, and several physical devices could
  be controlling each of these virtual devices. Physical devices may also
  be “floating”, which means they are not attached to any virtual device.
  
  # Master and slave devices
  
  ```
  carlos@sacarino:~$ xinput list
  ⎡ Virtual core pointer                          id=2    [master pointer  (3)]
  ⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
  ⎜   ↳ Wacom ISDv4 E6 Pen stylus                 id=10   [slave  pointer  (2)]
  ⎜   ↳ Wacom ISDv4 E6 Finger touch               id=11   [slave  pointer  (2)]
  ⎜   ↳ SynPS/2 Synaptics TouchPad                id=13   [slave  pointer  (2)]
  ⎜   ↳ TPPS/2 IBM TrackPoint                     id=14   [slave  pointer  (2)]
  ⎜   ↳ Wacom ISDv4 E6 Pen eraser                 id=16   [slave  pointer  (2)]
  ⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
      ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
      ↳ Power Button                              id=6    [slave  keyboard (3)]
      ↳ Video Bus                                 id=7    [slave  keyboard (3)]
      ↳ Sleep Button                              id=8    [slave  keyboard (3)]
      ↳ Integrated Camera                         id=9    [slave  keyboard (3)]
      ↳ AT Translated Set 2 keyboard              id=12   [slave  keyboard (3)]
      ↳ ThinkPad Extra Buttons                    id=15   [slave  keyboard (3)]
  ```
  
  By default, GDK will automatically listen for events coming from all
  master devices, setting the #GdkDevice for all events coming from input
  devices. Events containing device information are #GDK_MOTION_NOTIFY,
  #GDK_BUTTON_PRESS, #GDK_2BUTTON_PRESS, #GDK_3BUTTON_PRESS,
  #GDK_BUTTON_RELEASE, #GDK_SCROLL, #GDK_KEY_PRESS, #GDK_KEY_RELEASE,
  #GDK_ENTER_NOTIFY, #GDK_LEAVE_NOTIFY, #GDK_FOCUS_CHANGE,
  #GDK_PROXIMITY_IN, #GDK_PROXIMITY_OUT, #GDK_DRAG_ENTER, #GDK_DRAG_LEAVE,
  #GDK_DRAG_MOTION, #GDK_DRAG_STATUS, #GDK_DROP_START, #GDK_DROP_FINISHED
  and #GDK_GRAB_BROKEN. When dealing with an event on a master device,
  it is possible to get the source (slave) device that the event originated
  from via [gdk.event.Event.getSourceDevice].
  
  On a standard session, all physical devices are connected by default to
  the "Virtual Core Pointer/Keyboard" master devices, hence routing all events
  through these. This behavior is only modified by device grabs, where the
  slave device is temporarily detached for as long as the grab is held, and
  more permanently by user modifications to the device hierarchy.
  
  On certain application specific setups, it may make sense
  to detach a physical device from its master pointer, and mapping it to
  an specific window. This can be achieved by the combination of
  [gdk.device.Device.grab] and [gdk.device.Device.setMode].
  
  In order to listen for events coming from devices
  other than a virtual device, [gdk.window.Window.setDeviceEvents] must be
  called. Generally, this function can be used to modify the event mask
  for any given device.
  
  Input devices may also provide additional information besides X/Y.
  For example, graphics tablets may also provide pressure and X/Y tilt
  information. This information is device-dependent, and may be
  queried through [gdk.device.Device.getAxis]. In multidevice mode, virtual
  devices will change axes in order to always represent the physical
  device that is routing events through it. Whenever the physical device
  changes, the #GdkDevice:n-axes property will be notified, and
  [gdk.device.Device.listAxes] will return the new device axes.
  
  Devices may also have associated “keys” or
  macro buttons. Such keys can be globally set to map into normal X
  keyboard events. The mapping is set using [gdk.device.Device.setKey].
  
  In GTK+ 3.20, a new #GdkSeat object has been introduced that
  supersedes #GdkDeviceManager and should be preferred in newly
  written code.
*/
struct GdkDeviceManager;

/**
    #GdkDevicePad is an interface implemented by devices of type
  [gdk.types.InputSource.TabletPad], it allows querying the features provided
  by the pad device.
  
  Tablet pads may contain one or more groups, each containing a subset
  of the buttons/rings/strips available. [gdk.device_pad.DevicePad.getNGroups]
  can be used to obtain the number of groups, [gdk.device_pad.DevicePad.getNFeatures]
  and [gdk.device_pad.DevicePad.getFeatureGroup] can be combined to find out the
  number of buttons/rings/strips the device has, and how are they grouped.
  
  Each of those groups have different modes, which may be used to map
  each individual pad feature to multiple actions. Only one mode is
  effective (current) for each given group, different groups may have
  different current modes. The number of available modes in a group can
  be found out through [gdk.device_pad.DevicePad.getGroupNModes], and the current
  mode for a given group will be notified through the #GdkEventPadGroupMode
  event.
*/
struct GdkDevicePad;

/** */
struct GdkDevicePadInterface;

/** */
struct GdkDeviceTool;

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
struct GdkDisplay;

/**
    The purpose of the #GdkDisplayManager singleton object is to offer
  notification when displays appear or disappear or the default display
  changes.
  
  You can use [gdk.display_manager.DisplayManager.get] to obtain the #GdkDisplayManager
  singleton, but that should be rarely necessary. Typically, initializing
  GTK+ opens a display that you can work with without ever accessing the
  #GdkDisplayManager.
  
  The GDK library can be built with support for multiple backends.
  The #GdkDisplayManager object determines which backend is used
  at runtime.
  
  When writing backend-specific code that is supposed to work with
  multiple GDK backends, you have to consider both compile time and
  runtime. At compile time, use the #GDK_WINDOWING_X11, #GDK_WINDOWING_WIN32
  macros, etc. to find out which backends are present in the GDK library
  you are building your application against. At runtime, use type-check
  macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
  
  ## Backend-specific code ## {#backend-specific}
  
  ```c
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (display))
      {
        // make X11-specific calls here
      }
    else
  #endif
  #ifdef GDK_WINDOWING_QUARTZ
    if (GDK_IS_QUARTZ_DISPLAY (display))
      {
        // make Quartz-specific calls here
      }
    else
  #endif
    g_error ("Unsupported GDK backend");
  ```
*/
struct GdkDisplayManager;

/** */
struct GdkDragContext;

/**
    #GdkDrawingContext is an object that represents the current drawing
  state of a #GdkWindow.
  
  It's possible to use a #GdkDrawingContext to draw on a #GdkWindow
  via rendering API like Cairo or OpenGL.
  
  A #GdkDrawingContext can only be created by calling [gdk.window.Window.beginDrawFrame]
  and will be valid until a call to [gdk.window.Window.endDrawFrame].
  
  #GdkDrawingContext is available since GDK 3.22
*/
struct GdkDrawingContext;

/** */
struct GdkDrawingContextClass;

/**
    A #GdkEvent contains a union of all of the event types,
  and allows access to the data fields in a number of ways.
  
  The event type is always the first field in all of the event types, and
  can always be accessed with the following code, no matter what type of
  event it is:
  ```c
    GdkEvent *event;
    GdkEventType type;
  
    type = event->type;
  ```
  
  To access other fields of the event, the pointer to the event
  can be cast to the appropriate event type, or the union member
  name can be used. For example if the event type is [gdk.types.EventType.ButtonPress]
  then the x coordinate of the button press can be accessed with:
  ```c
    GdkEvent *event;
    gdouble x;
  
    x = ((GdkEventButton*)event)->x;
  ```
  or:
  ```c
    GdkEvent *event;
    gdouble x;
  
    x = event->button.x;
  ```
*/
union GdkEvent
{
  /**
      the #GdkEventType
  */
  GdkEventType type;

  /**
      a #GdkEventAny
  */
  GdkEventAny any;

  /**
      a #GdkEventExpose
  */
  GdkEventExpose expose;

  /**
      a #GdkEventVisibility
  */
  GdkEventVisibility visibility;

  /**
      a #GdkEventMotion
  */
  GdkEventMotion motion;

  /**
      a #GdkEventButton
  */
  GdkEventButton button;

  /**
      a #GdkEventTouch
  */
  GdkEventTouch touch;

  /**
      a #GdkEventScroll
  */
  GdkEventScroll scroll;

  /**
      a #GdkEventKey
  */
  GdkEventKey key;

  /**
      a #GdkEventCrossing
  */
  GdkEventCrossing crossing;

  /**
      a #GdkEventFocus
  */
  GdkEventFocus focusChange;

  /**
      a #GdkEventConfigure
  */
  GdkEventConfigure configure;

  /**
      a #GdkEventProperty
  */
  GdkEventProperty property;

  /**
      a #GdkEventSelection
  */
  GdkEventSelection selection;

  /**
      a #GdkEventOwnerChange
  */
  GdkEventOwnerChange ownerChange;

  /**
      a #GdkEventProximity
  */
  GdkEventProximity proximity;

  /**
      a #GdkEventDND
  */
  GdkEventDND dnd;

  /**
      a #GdkEventWindowState
  */
  GdkEventWindowState windowState;

  /**
      a #GdkEventSetting
  */
  GdkEventSetting setting;

  /**
      a #GdkEventGrabBroken
  */
  GdkEventGrabBroken grabBroken;

  /**
      a #GdkEventTouchpadSwipe
  */
  GdkEventTouchpadSwipe touchpadSwipe;

  /**
      a #GdkEventTouchpadPinch
  */
  GdkEventTouchpadPinch touchpadPinch;

  /**
      a #GdkEventPadButton
  */
  GdkEventPadButton padButton;

  /**
      a #GdkEventPadAxis
  */
  GdkEventPadAxis padAxis;

  /**
      a #GdkEventPadGroupMode
  */
  GdkEventPadGroupMode padGroupMode;
}

/**
    Contains the fields which are common to all event structs.
  Any event pointer can safely be cast to a pointer to a #GdkEventAny to
  access these fields.
*/
struct GdkEventAny
{
  /**
      the type of the event.
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;
}

/**
    Used for button press and button release events. The
  @type field will be one of [gdk.types.EventType.ButtonPress],
  [gdk.types.EventType._2buttonPress], [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease],
  
  Double and triple-clicks result in a sequence of events being received.
  For double-clicks the order of events will be:
  
  $(LIST
    * [gdk.types.EventType.ButtonPress]
    * [gdk.types.EventType.ButtonRelease]
    * [gdk.types.EventType.ButtonPress]
    * [gdk.types.EventType._2buttonPress]
    * [gdk.types.EventType.ButtonRelease]
  )
    
  Note that the first click is received just like a normal
  button press, while the second click results in a [gdk.types.EventType._2buttonPress]
  being received just after the [gdk.types.EventType.ButtonPress].
  
  Triple-clicks are very similar to double-clicks, except that
  [gdk.types.EventType._3buttonPress] is inserted after the third click. The order of the
  events is:
  
  $(LIST
    * [gdk.types.EventType.ButtonPress]
    * [gdk.types.EventType.ButtonRelease]
    * [gdk.types.EventType.ButtonPress]
    * [gdk.types.EventType._2buttonPress]
    * [gdk.types.EventType.ButtonRelease]
    * [gdk.types.EventType.ButtonPress]
    * [gdk.types.EventType._3buttonPress]
    * [gdk.types.EventType.ButtonRelease]
  )
    
  For a double click to occur, the second button press must occur within
  1/4 of a second of the first. For a triple click to occur, the third
  button press must also occur within 1/2 second of the first button press.
*/
struct GdkEventButton
{
  /**
      the type of the event ([gdk.types.EventType.ButtonPress], [gdk.types.EventType._2buttonPress],
      [gdk.types.EventType._3buttonPress] or [gdk.types.EventType.ButtonRelease]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      @x, @y translated to the axes of @device, or null if @device is
      the mouse.
  */
  double* axes;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      the button which was pressed or released, numbered from 1 to 5.
      Normally button 1 is the left mouse button, 2 is the middle button,
      and 3 is the right button. On 2-button mice, the middle button can
      often be simulated by pressing both mouse buttons together.
  */
  uint button;

  /**
      the master device that the event originated from. Use
    [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
      screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
      screen.
  */
  double yRoot;
}

/**
    Generated when a window size or position has changed.
*/
struct GdkEventConfigure
{
  /**
      the type of the event ([gdk.types.EventType.Configure]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the new x coordinate of the window, relative to its parent.
  */
  int x;

  /**
      the new y coordinate of the window, relative to its parent.
  */
  int y;

  /**
      the new width of the window.
  */
  int width;

  /**
      the new height of the window.
  */
  int height;
}

/**
    Generated when the pointer enters or leaves a window.
*/
struct GdkEventCrossing
{
  /**
      the type of the event ([gdk.types.EventType.EnterNotify] or [gdk.types.EventType.LeaveNotify]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the window that was entered or left.
  */
  GdkWindow* subwindow;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      the x coordinate of the pointer relative to the root of the screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the screen.
  */
  double yRoot;

  /**
      the crossing mode ([gdk.types.CrossingMode.Normal], [gdk.types.CrossingMode.Grab],
     [gdk.types.CrossingMode.Ungrab], [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab] or
     [gdk.types.CrossingMode.StateChanged]).  [gdk.types.CrossingMode.GtkGrab], [gdk.types.CrossingMode.GtkUngrab],
     and [gdk.types.CrossingMode.StateChanged] were added in 2.14 and are always synthesized,
     never native.
  */
  GdkCrossingMode mode;

  /**
      the kind of crossing that happened ([gdk.types.NotifyType.Inferior],
     [gdk.types.NotifyType.Ancestor], [gdk.types.NotifyType.Virtual], [gdk.types.NotifyType.Nonlinear] or
     [gdk.types.NotifyType.NonlinearVirtual]).
  */
  GdkNotifyType detail;

  /**
      true if @window is the focus window or an inferior.
  */
  bool focus;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;
}

/**
    Generated during DND operations.
*/
struct GdkEventDND
{
  /**
      the type of the event ([gdk.types.EventType.DragEnter], [gdk.types.EventType.DragLeave],
      [gdk.types.EventType.DragMotion], [gdk.types.EventType.DragStatus], [gdk.types.EventType.DropStart] or
      [gdk.types.EventType.DropFinished]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the #GdkDragContext for the current DND operation.
  */
  GdkDragContext* context;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the root of the
      screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  short xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
      screen, only set for [gdk.types.EventType.DragMotion] and [gdk.types.EventType.DropStart].
  */
  short yRoot;
}

/**
    Generated when all or part of a window becomes visible and needs to be
  redrawn.
*/
struct GdkEventExpose
{
  /**
      the type of the event ([gdk.types.EventType.Expose] or [gdk.types.EventType.Damage]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      bounding box of @region.
  */
  GdkRectangle area;

  /**
      the region that needs to be redrawn.
  */
  cairo_region_t* region;

  /**
      the number of contiguous [gdk.types.EventType.Expose] events following this one.
      The only use for this is “exposure compression”, i.e. handling all
      contiguous [gdk.types.EventType.Expose] events in one go, though GDK performs some
      exposure compression so this is not normally needed.
  */
  int count;
}

/**
    Describes a change of keyboard focus.
*/
struct GdkEventFocus
{
  /**
      the type of the event ([gdk.types.EventType.FocusChange]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      true if the window has gained the keyboard focus, false if
      it has lost the focus.
  */
  short in_;
}

/**
    Generated when a pointer or keyboard grab is broken. On X11, this happens
  when the grab window becomes unviewable (i.e. it or one of its ancestors
  is unmapped), or if the same application grabs the pointer or keyboard
  again. Note that implicit grabs (which are initiated by button presses)
  can also cause #GdkEventGrabBroken events.
*/
struct GdkEventGrabBroken
{
  /**
      the type of the event ([gdk.types.EventType.GrabBroken])
  */
  GdkEventType type;

  /**
      the window which received the event, i.e. the window
      that previously owned the grab
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      true if a keyboard grab was broken, false if a pointer
      grab was broken
  */
  bool keyboard;

  /**
      true if the broken grab was implicit
  */
  bool implicit;

  /**
      If this event is caused by another grab in the same
      application, @grab_window contains the new grab window. Otherwise
      @grab_window is null.
  */
  GdkWindow* grabWindow;
}

/**
    Describes a key press or key release event.
*/
struct GdkEventKey
{
  /**
      the type of the event ([gdk.types.EventType.KeyPress] or [gdk.types.EventType.KeyRelease]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      the key that was pressed or released. See the
      `gdk/gdkkeysyms.h` header file for a
      complete list of GDK key codes.
  */
  uint keyval;

  /**
      the length of @string.
  */
  int length;

  /**
      a string containing an approximation of the text that
      would result from this keypress. The only correct way to handle text
      input of text is using input methods (see #GtkIMContext), so this
      field is deprecated and should never be used.
      ([gdk.global.unicodeToKeyval] provides a non-deprecated way of getting
      an approximate translation for a key.) The string is encoded in the
      encoding of the current locale (Note: this for backwards compatibility:
      strings in GTK+ and GDK are typically in UTF-8.) and NUL-terminated.
      In some cases, the translation of the key code will be a single
      NUL byte, in which case looking at @length is necessary to distinguish
      it from the an empty translation.
  */
  char* string_;

  /**
      the raw code of the key that was pressed or released.
  */
  ushort hardwareKeycode;

  /**
      the keyboard group.
  */
  ubyte group;

  /**
      a flag that indicates if @hardware_keycode is mapped to a
      modifier. Since 2.10
  */
  uint isModifier;
}

/**
    Generated when the pointer moves.
*/
struct GdkEventMotion
{
  /**
      the type of the event.
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      @x, @y translated to the axes of @device, or null if @device is
      the mouse.
  */
  double* axes;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      set to 1 if this event is just a hint, see the
      [gdk.types.EventMask.PointerMotionHintMask] value of #GdkEventMask.
  */
  short isHint;

  /**
      the master device that the event originated from. Use
    [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
      screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
      screen.
  */
  double yRoot;
}

/**
    Generated when the owner of a selection changes. On X11, this
  information is only available if the X server supports the XFIXES
  extension.
*/
struct GdkEventOwnerChange
{
  /**
      the type of the event ([gdk.types.EventType.OwnerChange]).
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the new owner of the selection, or null if there is none
  */
  GdkWindow* owner;

  /**
      the reason for the ownership change as a #GdkOwnerChange value
  */
  GdkOwnerChange reason;

  /**
      the atom identifying the selection
  */
  GdkAtom selection;

  /**
      the timestamp of the event
  */
  uint time;

  /**
      the time at which the selection ownership was taken
      over
  */
  uint selectionTime;
}

/**
    Generated during [gdk.types.InputSource.TabletPad] interaction with tactile sensors.
*/
struct GdkEventPadAxis
{
  /**
      the type of the event ([gdk.types.EventType.PadRing] or [gdk.types.EventType.PadStrip]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the pad group the ring/strip belongs to. A [gdk.types.InputSource.TabletPad]
      device may have one or more groups containing a set of buttons/rings/strips
      each.
  */
  uint group;

  /**
      number of strip/ring that was interacted. This number is 0-indexed.
  */
  uint index;

  /**
      The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
      device may have different current modes.
  */
  uint mode;

  /**
      The current value for the given axis.
  */
  double value;
}

/**
    Generated during [gdk.types.InputSource.TabletPad] button presses and releases.
*/
struct GdkEventPadButton
{
  /**
      the type of the event ([gdk.types.EventType.PadButtonPress] or [gdk.types.EventType.PadButtonRelease]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the pad group the button belongs to. A [gdk.types.InputSource.TabletPad] device
      may have one or more groups containing a set of buttons/rings/strips each.
  */
  uint group;

  /**
      The pad button that was pressed.
  */
  uint button;

  /**
      The current mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
      device may have different current modes.
  */
  uint mode;
}

/**
    Generated during [gdk.types.InputSource.TabletPad] mode switches in a group.
*/
struct GdkEventPadGroupMode
{
  /**
      the type of the event ([gdk.types.EventType.PadGroupMode]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the pad group that is switching mode. A [gdk.types.InputSource.TabletPad]
      device may have one or more groups containing a set of buttons/rings/strips
      each.
  */
  uint group;

  /**
      The new mode of @group. Different groups in a [gdk.types.InputSource.TabletPad]
      device may have different current modes.
  */
  uint mode;
}

/**
    Describes a property change on a window.
*/
struct GdkEventProperty
{
  /**
      the type of the event ([gdk.types.EventType.PropertyNotify]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the property that was changed.
  */
  GdkAtom atom;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      whether the property was changed
      ([gdk.types.PropertyState.NewValue]) or deleted ([gdk.types.PropertyState.Delete]).
  */
  GdkPropertyState state;
}

/**
    Proximity events are generated when using GDK’s wrapper for the
  XInput extension. The XInput extension is an add-on for standard X
  that allows you to use nonstandard devices such as graphics tablets.
  A proximity event indicates that the stylus has moved in or out of
  contact with the tablet, or perhaps that the user’s finger has moved
  in or out of contact with a touch screen.
  
  This event type will be used pretty rarely. It only is important for
  XInput aware programs that are drawing their own cursor.
*/
struct GdkEventProximity
{
  /**
      the type of the event ([gdk.types.EventType.ProximityIn] or [gdk.types.EventType.ProximityOut]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the master device that the event originated from. Use
    [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;
}

/**
    Generated from button presses for the buttons 4 to 7. Wheel mice are
  usually configured to generate button press events for buttons 4 and 5
  when the wheel is turned.
  
  Some GDK backends can also generate “smooth” scroll events, which
  can be recognized by the [gdk.types.ScrollDirection.Smooth] scroll direction. For
  these, the scroll deltas can be obtained with
  [gdk.event.Event.getScrollDeltas].
*/
struct GdkEventScroll
{
  /**
      the type of the event ([gdk.types.EventType.Scroll]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window.
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window.
  */
  double y;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;

  /**
      the direction to scroll to (one of [gdk.types.ScrollDirection.Up],
      [gdk.types.ScrollDirection.Down], [gdk.types.ScrollDirection.Left], [gdk.types.ScrollDirection.Right] or
      [gdk.types.ScrollDirection.Smooth]).
  */
  GdkScrollDirection direction;

  /**
      the master device that the event originated from. Use
    [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
      screen.
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
      screen.
  */
  double yRoot;

  /**
      the x coordinate of the scroll delta
  */
  double deltaX;

  /**
      the y coordinate of the scroll delta
  */
  double deltaY;

  /** */
  uint isStop;
}

/**
    Generated when a selection is requested or ownership of a selection
  is taken over by another client application.
*/
struct GdkEventSelection
{
  /**
      the type of the event ([gdk.types.EventType.SelectionClear],
      [gdk.types.EventType.SelectionNotify] or [gdk.types.EventType.SelectionRequest]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the selection.
  */
  GdkAtom selection;

  /**
      the target to which the selection should be converted.
  */
  GdkAtom target;

  /**
      the property in which to place the result of the conversion.
  */
  GdkAtom property;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the window on which to place @property or null if none.
  */
  GdkWindow* requestor;
}

/** */
struct GdkEventSequence;

/**
    Generated when a setting is modified.
*/
struct GdkEventSetting
{
  /**
      the type of the event ([gdk.types.EventType.Setting]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      what happened to the setting ([gdk.types.SettingAction.New],
      [gdk.types.SettingAction.Changed] or [gdk.types.SettingAction.Deleted]).
  */
  GdkSettingAction action;

  /**
      the name of the setting.
  */
  char* name;
}

/**
    Used for touch events.
  @type field will be one of [gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
  [gdk.types.EventType.TouchEnd] or [gdk.types.EventType.TouchCancel].
  
  Touch events are grouped into sequences by means of the @sequence
  field, which can also be obtained with [gdk.event.Event.getEventSequence].
  Each sequence begins with a [gdk.types.EventType.TouchBegin] event, followed by
  any number of [gdk.types.EventType.TouchUpdate] events, and ends with a [gdk.types.EventType.TouchEnd]
  (or [gdk.types.EventType.TouchCancel]) event. With multitouch devices, there may be
  several active sequences at the same time.
*/
struct GdkEventTouch
{
  /**
      the type of the event ([gdk.types.EventType.TouchBegin], [gdk.types.EventType.TouchUpdate],
      [gdk.types.EventType.TouchEnd], [gdk.types.EventType.TouchCancel])
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the time of the event in milliseconds.
  */
  uint time;

  /**
      the x coordinate of the pointer relative to the window
  */
  double x;

  /**
      the y coordinate of the pointer relative to the window
  */
  double y;

  /**
      @x, @y translated to the axes of @device, or null if @device is
      the mouse
  */
  double* axes;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType
  */
  GdkModifierType state;

  /**
      the event sequence that the event belongs to
  */
  GdkEventSequence* sequence;

  /**
      whether the event should be used for emulating
      pointer event
  */
  bool emulatingPointer;

  /**
      the master device that the event originated from. Use
    [gdk.event.Event.getSourceDevice] to get the slave device.
  */
  GdkDevice* device;

  /**
      the x coordinate of the pointer relative to the root of the
      screen
  */
  double xRoot;

  /**
      the y coordinate of the pointer relative to the root of the
      screen
  */
  double yRoot;
}

/**
    Generated during touchpad swipe gestures.
*/
struct GdkEventTouchpadPinch
{
  /**
      the type of the event ([gdk.types.EventType.TouchpadPinch])
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly
  */
  byte sendEvent;

  /**
      the current phase of the gesture
  */
  byte phase;

  /**
      The number of fingers triggering the pinch
  */
  byte nFingers;

  /**
      the time of the event in milliseconds
  */
  uint time;

  /**
      The X coordinate of the pointer
  */
  double x;

  /**
      The Y coordinate of the pointer
  */
  double y;

  /**
      Movement delta in the X axis of the swipe focal point
  */
  double dx;

  /**
      Movement delta in the Y axis of the swipe focal point
  */
  double dy;

  /**
      The angle change in radians, negative angles
      denote counter-clockwise movements
  */
  double angleDelta;

  /**
      The current scale, relative to that at the time of
      the corresponding [gdk.types.TouchpadGesturePhase.Begin] event
  */
  double scale;

  /**
      The X coordinate of the pointer, relative to the
      root of the screen.
  */
  double xRoot;

  /**
      The Y coordinate of the pointer, relative to the
      root of the screen.
  */
  double yRoot;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;
}

/**
    Generated during touchpad swipe gestures.
*/
struct GdkEventTouchpadSwipe
{
  /**
      the type of the event ([gdk.types.EventType.TouchpadSwipe])
  */
  GdkEventType type;

  /**
      the window which received the event
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly
  */
  byte sendEvent;

  /**
      the current phase of the gesture
  */
  byte phase;

  /**
      The number of fingers triggering the swipe
  */
  byte nFingers;

  /**
      the time of the event in milliseconds
  */
  uint time;

  /**
      The X coordinate of the pointer
  */
  double x;

  /**
      The Y coordinate of the pointer
  */
  double y;

  /**
      Movement delta in the X axis of the swipe focal point
  */
  double dx;

  /**
      Movement delta in the Y axis of the swipe focal point
  */
  double dy;

  /**
      The X coordinate of the pointer, relative to the
      root of the screen.
  */
  double xRoot;

  /**
      The Y coordinate of the pointer, relative to the
      root of the screen.
  */
  double yRoot;

  /**
      a bit-mask representing the state of
      the modifier keys (e.g. Control, Shift and Alt) and the pointer
      buttons. See #GdkModifierType.
  */
  GdkModifierType state;
}

/**
    Generated when the window visibility status has changed.

  Deprecated:     Modern composited windowing systems with pervasive
        transparency make it impossible to track the visibility of a window
        reliably, so this event can not be guaranteed to provide useful
        information.
*/
struct GdkEventVisibility
{
  /**
      the type of the event ([gdk.types.EventType.VisibilityNotify]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      the new visibility state ([gdk.types.VisibilityState.FullyObscured],
      [gdk.types.VisibilityState.Partial] or [gdk.types.VisibilityState.Unobscured]).
  */
  GdkVisibilityState state;
}

/**
    Generated when the state of a toplevel window changes.
*/
struct GdkEventWindowState
{
  /**
      the type of the event ([gdk.types.EventType.WindowState]).
  */
  GdkEventType type;

  /**
      the window which received the event.
  */
  GdkWindow* window;

  /**
      true if the event was sent explicitly.
  */
  byte sendEvent;

  /**
      mask specifying what flags have changed.
  */
  GdkWindowState changedMask;

  /**
      the new window state, a combination of
      #GdkWindowState bits.
  */
  GdkWindowState newWindowState;
}

/**
    A #GdkFrameClock tells the application when to update and repaint a
  window. This may be synced to the vertical refresh rate of the
  monitor, for example. Even when the frame clock uses a simple timer
  rather than a hardware-based vertical sync, the frame clock helps
  because it ensures everything paints at the same time (reducing the
  total number of frames). The frame clock can also automatically
  stop painting when it knows the frames will not be visible, or
  scale back animation framerates.
  
  #GdkFrameClock is designed to be compatible with an OpenGL-based
  implementation or with mozRequestAnimationFrame in Firefox,
  for example.
  
  A frame clock is idle until someone requests a frame with
  [gdk.frame_clock.FrameClock.requestPhase]. At some later point that makes
  sense for the synchronization being implemented, the clock will
  process a frame and emit signals for each phase that has been
  requested. (See the signals of the #GdkFrameClock class for
  documentation of the phases. [gdk.types.FrameClockPhase.Update] and the
  #GdkFrameClock::update signal are most interesting for application
  writers, and are used to update the animations, using the frame time
  given by [gdk.frame_clock.FrameClock.getFrameTime].
  
  The frame time is reported in microseconds and generally in the same
  timescale as [glib.global.getMonotonicTime], however, it is not the same
  as [glib.global.getMonotonicTime]. The frame time does not advance during
  the time a frame is being painted, and outside of a frame, an attempt
  is made so that all calls to [gdk.frame_clock.FrameClock.getFrameTime] that
  are called at a “similar” time get the same value. This means that
  if different animations are timed by looking at the difference in
  time between an initial value from [gdk.frame_clock.FrameClock.getFrameTime]
  and the value inside the #GdkFrameClock::update signal of the clock,
  they will stay exactly synchronized.
*/
struct GdkFrameClock;

/** */
struct GdkFrameClockClass;

/** */
struct GdkFrameClockPrivate;

/**
    A #GdkFrameTimings object holds timing information for a single frame
  of the application’s displays. To retrieve #GdkFrameTimings objects,
  use [gdk.frame_clock.FrameClock.getTimings] or [gdk.frame_clock.FrameClock.getCurrentTimings].
  The information in #GdkFrameTimings is useful for precise synchronization
  of video with the event or audio streams, and for measuring
  quality metrics for the application’s display, such as latency and jitter.
*/
struct GdkFrameTimings;

/**
    #GdkGLContext is an object representing the platform-specific
  OpenGL drawing context.
  
  #GdkGLContexts are created for a #GdkWindow using
  [gdk.window.Window.createGlContext], and the context will match
  the #GdkVisual of the window.
  
  A #GdkGLContext is not tied to any particular normal framebuffer.
  For instance, it cannot draw to the #GdkWindow back buffer. The GDK
  repaint system is in full control of the painting to that. Instead,
  you can create render buffers or textures and use [gdk.global.cairoDrawFromGl]
  in the draw function of your widget to draw them. Then GDK will handle
  the integration of your rendering with that of other widgets.
  
  Support for #GdkGLContext is platform-specific, context creation
  can fail, returning null context.
  
  A #GdkGLContext has to be made "current" in order to start using
  it, otherwise any OpenGL call will be ignored.
  
  ## Creating a new OpenGL context ##
  
  In order to create a new #GdkGLContext instance you need a
  #GdkWindow, which you typically get during the realize call
  of a widget.
  
  A #GdkGLContext is not realized until either [gdk.glcontext.GLContext.makeCurrent],
  or until it is realized using [gdk.glcontext.GLContext.realize]. It is possible to
  specify details of the GL context like the OpenGL version to be used, or
  whether the GL context should have extra state validation enabled after
  calling [gdk.window.Window.createGlContext] by calling [gdk.glcontext.GLContext.realize].
  If the realization fails you have the option to change the settings of the
  #GdkGLContext and try again.
  
  ## Using a GdkGLContext ##
  
  You will need to make the #GdkGLContext the current context
  before issuing OpenGL calls; the system sends OpenGL commands to
  whichever context is current. It is possible to have multiple
  contexts, so you always need to ensure that the one which you
  want to draw with is the current one before issuing commands:
  
  ```c
    gdk_gl_context_make_current (context);
  ```
  
  You can now perform your drawing using OpenGL commands.
  
  You can check which #GdkGLContext is the current one by using
  [gdk.glcontext.GLContext.getCurrent]; you can also unset any #GdkGLContext
  that is currently set by calling [gdk.glcontext.GLContext.clearCurrent].
*/
struct GdkGLContext;

/**
    The #GdkGeometry struct gives the window manager information about
  a window’s geometry constraints. Normally you would set these on
  the GTK+ level using [gtk.window.Window.setGeometryHints]. #GtkWindow
  then sets the hints on the #GdkWindow it creates.
  
  [gdk.window.Window.setGeometryHints] expects the hints to be fully valid already
  and simply passes them to the window manager; in contrast,
  [gtk.window.Window.setGeometryHints] performs some interpretation. For example,
  #GtkWindow will apply the hints to the geometry widget instead of the
  toplevel window, if you set a geometry widget. Also, the
  @min_width/@min_height/@max_width/@max_height fields may be set to -1, and
  #GtkWindow will substitute the size request of the window or geometry widget.
  If the minimum size hint is not provided, #GtkWindow will use its requisition
  as the minimum size. If the minimum size is provided and a geometry widget is
  set, #GtkWindow will take the minimum size as the minimum size of the
  geometry widget rather than the entire window. The base size is treated
  similarly.
  
  The canonical use-case for [gtk.window.Window.setGeometryHints] is to get a
  terminal widget to resize properly. Here, the terminal text area should be
  the geometry widget; #GtkWindow will then automatically set the base size to
  the size of other widgets in the terminal window, such as the menubar and
  scrollbar. Then, the @width_inc and @height_inc fields should be set to the
  size of one character in the terminal. Finally, the base size should be set
  to the size of one character. The net effect is that the minimum size of the
  terminal will have a 1x1 character terminal area, and only terminal sizes on
  the “character grid” will be allowed.
  
  Here’s an example of how the terminal example would be implemented, assuming
  a terminal area widget called “terminal” and a toplevel window “toplevel”:
  
  ```c
  	GdkGeometry hints;
  
  	hints.base_width = terminal->char_width;
          hints.base_height = terminal->char_height;
          hints.min_width = terminal->char_width;
          hints.min_height = terminal->char_height;
          hints.width_inc = terminal->char_width;
          hints.height_inc = terminal->char_height;
  
   gtk_window_set_geometry_hints (GTK_WINDOW (toplevel),
                                  GTK_WIDGET (terminal),
                                  &hints,
                                  GDK_HINT_RESIZE_INC |
                                  GDK_HINT_MIN_SIZE |
                                  GDK_HINT_BASE_SIZE);
  ```
  
  The other useful fields are the @min_aspect and @max_aspect fields; these
  contain a width/height ratio as a floating point number. If a geometry widget
  is set, the aspect applies to the geometry widget rather than the entire
  window. The most common use of these hints is probably to set @min_aspect and
  @max_aspect to the same value, thus forcing the window to keep a constant
  aspect ratio.
*/
struct GdkGeometry
{
  /**
      minimum width of window (or -1 to use requisition, with
     #GtkWindow only)
  */
  int minWidth;

  /**
      minimum height of window (or -1 to use requisition, with
     #GtkWindow only)
  */
  int minHeight;

  /**
      maximum width of window (or -1 to use requisition, with
     #GtkWindow only)
  */
  int maxWidth;

  /**
      maximum height of window (or -1 to use requisition, with
     #GtkWindow only)
  */
  int maxHeight;

  /**
      allowed window widths are @base_width + @width_inc * N where N
     is any integer (-1 allowed with #GtkWindow)
  */
  int baseWidth;

  /**
      allowed window widths are @base_height + @height_inc * N where
     N is any integer (-1 allowed with #GtkWindow)
  */
  int baseHeight;

  /**
      width resize increment
  */
  int widthInc;

  /**
      height resize increment
  */
  int heightInc;

  /**
      minimum width/height ratio
  */
  double minAspect;

  /**
      maximum width/height ratio
  */
  double maxAspect;

  /**
      window gravity, see [gtk.window.Window.setGravity]
  */
  GdkGravity winGravity;
}

/**
    A #GdkKeymap defines the translation from keyboard state
  (including a hardware key, a modifier mask, and active keyboard group)
  to a keyval. This translation has two phases. The first phase is
  to determine the effective keyboard group and level for the keyboard
  state; the second phase is to look up the keycode/group/level triplet
  in the keymap and see what keyval it corresponds to.
*/
struct GdkKeymap;

/**
    A #GdkKeymapKey is a hardware key that can be mapped to a keyval.
*/
struct GdkKeymapKey
{
  /**
      the hardware keycode. This is an identifying number for a
      physical key.
  */
  uint keycode;

  /**
      indicates movement in a horizontal direction. Usually groups are used
      for two different languages. In group 0, a key might have two English
      characters, and in group 1 it might have two Hebrew characters. The Hebrew
      characters will be printed on the key next to the English characters.
  */
  int group;

  /**
      indicates which symbol on the key will be used, in a vertical direction.
      So on a standard US keyboard, the key with the number “1” on it also has the
      exclamation point ("!") character on it. The level indicates whether to use
      the “1” or the “!” symbol. The letter keys are considered to have a lowercase
      letter at level 0, and an uppercase letter at level 1, though only the
      uppercase letter is printed.
  */
  int level;
}

/**
    GdkMonitor objects represent the individual outputs that are
  associated with a #GdkDisplay. GdkDisplay has APIs to enumerate
  monitors with [gdk.display.Display.getNMonitors] and [gdk.display.Display.getMonitor], and
  to find particular monitors with [gdk.display.Display.getPrimaryMonitor] or
  [gdk.display.Display.getMonitorAtWindow].
  
  GdkMonitor was introduced in GTK+ 3.22 and supersedes earlier
  APIs in GdkScreen to obtain monitor-related information.
*/
struct GdkMonitor;

/** */
struct GdkMonitorClass;

/**
    Defines the x and y coordinates of a point.
*/
struct GdkPoint
{
  /**
      the x coordinate of the point.
  */
  int x;

  /**
      the y coordinate of the point.
  */
  int y;
}

/**
    A #GdkRGBA is used to represent a (possibly translucent)
  color, in a way that is compatible with cairo’s notion of color.
*/
struct GdkRGBA
{
  /**
      The intensity of the red channel from 0.0 to 1.0 inclusive
  */
  double red;

  /**
      The intensity of the green channel from 0.0 to 1.0 inclusive
  */
  double green;

  /**
      The intensity of the blue channel from 0.0 to 1.0 inclusive
  */
  double blue;

  /**
      The opacity of the color from 0.0 for completely translucent to
      1.0 for opaque
  */
  double alpha;
}

/**
    Defines the position and size of a rectangle. It is identical to
  #cairo_rectangle_int_t.
*/
struct GdkRectangle
{
  /** */
  int x;

  /** */
  int y;

  /** */
  int width;

  /** */
  int height;
}

/**
    #GdkScreen objects are the GDK representation of the screen on
  which windows can be displayed and on which the pointer moves.
  X originally identified screens with physical screens, but
  nowadays it is more common to have a single #GdkScreen which
  combines several physical monitors (see [gdk.screen.Screen.getNMonitors]).
  
  GdkScreen is used throughout GDK and GTK+ to specify which screen
  the top level windows are to be displayed on. it is also used to
  query the screen specification and default settings such as
  the default visual ([gdk.screen.Screen.getSystemVisual]), the dimensions
  of the physical monitors ([gdk.screen.Screen.getMonitorGeometry]), etc.
*/
struct GdkScreen;

/**
    The #GdkSeat object represents a collection of input devices
  that belong to a user.
*/
struct GdkSeat
{
  /** */
  ObjectC parentInstance;
}

/**
    A #GdkTimeCoord stores a single event in a motion history.
*/
struct GdkTimeCoord
{
  /**
      The timestamp for this event.
  */
  uint time;

  /**
      the values of the device’s axes.
  */
  double[128] axes;
}

/**
    A #GdkVisual contains information about
  a particular visual.
*/
struct GdkVisual;

/** */
struct GdkWindow;

/**
    Attributes to use for a newly-created window.
*/
struct GdkWindowAttr
{
  /**
      title of the window (for toplevel windows)
  */
  char* title;

  /**
      event mask (see [gdk.window.Window.setEvents])
  */
  int eventMask;

  /**
      X coordinate relative to parent window (see [gdk.window.Window.move])
  */
  int x;

  /**
      Y coordinate relative to parent window (see [gdk.window.Window.move])
  */
  int y;

  /**
      width of window
  */
  int width;

  /**
      height of window
  */
  int height;

  /**
      #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
     window that receives events)
  */
  GdkWindowWindowClass wclass;

  /**
      #GdkVisual for window
  */
  GdkVisual* visual;

  /**
      type of window
  */
  GdkWindowType windowType;

  /**
      cursor for the window (see [gdk.window.Window.setCursor])
  */
  GdkCursor* cursor;

  /**
      don’t use (see [gtk.window.Window.setWmclass])
  */
  char* wmclassName;

  /**
      don’t use (see [gtk.window.Window.setWmclass])
  */
  char* wmclassClass;

  /**
      true to bypass the window manager
  */
  bool overrideRedirect;

  /**
      a hint of the function of the window
  */
  GdkWindowTypeHint typeHint;
}

/** */
struct GdkWindowClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) GdkWindow* function(GdkWindow* window, double x, double y) pickEmbeddedChild;

  /** */
  extern(C) void function(GdkWindow* window, double offscreenX, double offscreenY, double* embedderX, double* embedderY) toEmbedder;

  /** */
  extern(C) void function(GdkWindow* window, double embedderX, double embedderY, double* offscreenX, double* offscreenY) fromEmbedder;

  /** */
  extern(C) cairo_surface_t* function(GdkWindow* window, int width, int height) createSurface;

  /** */
  extern(C) void function() GdkReserved1;

  /** */
  extern(C) void function() GdkReserved2;

  /** */
  extern(C) void function() GdkReserved3;

  /** */
  extern(C) void function() GdkReserved4;

  /** */
  extern(C) void function() GdkReserved5;

  /** */
  extern(C) void function() GdkReserved6;

  /** */
  extern(C) void function() GdkReserved7;

  /** */
  extern(C) void function() GdkReserved8;
}

/** */
struct GdkWindowRedirect;

alias extern(C) void function(GdkEvent* event, void* data) GdkEventFunc;

alias extern(C) GdkFilterReturn function(GdkXEvent* xevent, GdkEvent* event, void* data) GdkFilterFunc;

alias extern(C) void function(GdkSeat* seat, GdkWindow* window, void* userData) GdkSeatGrabPrepareFunc;

alias extern(C) bool function(GdkWindow* window, void* userData) GdkWindowChildFunc;

alias extern(C) void function(GdkWindow* window, cairo_region_t* region) GdkWindowInvalidateHandlerFunc;

