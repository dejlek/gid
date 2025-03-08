module gdk.device_manager;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.display;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

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
class DeviceManager : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_device_manager_get_type != &gidSymbolNotFound ? gdk_device_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns the client pointer, that is, the master pointer that acts as the core pointer
    for this application. In X11, window managers may change this depending on the interaction
    pattern under the presence of several pointers.
    
    You should use this function seldomly, only in code that isn’t triggered by a #GdkEvent
    and there aren’t other means to get a meaningful #GdkDevice to operate on.
    Returns:     The client pointer. This memory is
               owned by GDK and must not be freed or unreferenced.
  
    Deprecated:     Use [gdk.seat.Seat.getPointer] instead.
  */
  gdk.device.Device getClientPointer()
  {
    GdkDevice* _cretval;
    _cretval = gdk_device_manager_get_client_pointer(cast(GdkDeviceManager*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the #GdkDisplay associated to device_manager.
    Returns:     the #GdkDisplay to which
               device_manager is associated to, or null. This memory is
               owned by GDK and must not be freed or unreferenced.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_device_manager_get_display(cast(GdkDeviceManager*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the list of devices of type type currently attached to
    device_manager.
    Params:
      type =       device type to get.
    Returns:     a list of
               #GdkDevices. The returned list must be
               freed with g_list_free (). The list elements are owned by
               GTK+ and must not be freed or unreffed.
  
    Deprecated:     , use [gdk.seat.Seat.getPointer], [gdk.seat.Seat.getKeyboard]
                  and [gdk.seat.Seat.getSlaves] instead.
  */
  gdk.device.Device[] listDevices(gdk.types.DeviceType type)
  {
    GList* _cretval;
    _cretval = gdk_device_manager_list_devices(cast(GdkDeviceManager*)cPtr, type);
    auto _retval = gListToD!(gdk.device.Device, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      The ::device-added signal is emitted either when a new master
    pointer is created, or when a slave (Hardware) input device
    is plugged in.
  
    ## Parameters
    $(LIST
      * $(B device)       the newly added #GdkDevice.
      * $(B deviceManager) the instance the signal is connected to
    )
  */
  alias DeviceAddedCallbackDlg = void delegate(gdk.device.Device device, gdk.device_manager.DeviceManager deviceManager);

  /** ditto */
  alias DeviceAddedCallbackFunc = void function(gdk.device.Device device, gdk.device_manager.DeviceManager deviceManager);

  /**
    Connect to DeviceAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeviceAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DeviceAddedCallbackDlg) || is(T : DeviceAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto deviceManager = getVal!(gdk.device_manager.DeviceManager)(_paramVals);
      auto device = getVal!(gdk.device.Device)(&_paramVals[1]);
      _dClosure.dlg(device, deviceManager);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-added", closure, after);
  }

  /**
      The ::device-changed signal is emitted whenever a device
    has changed in the hierarchy, either slave devices being
    disconnected from their master device or connected to
    another one, or master devices being added or removed
    a slave device.
    
    If a slave device is detached from all master devices
    ([gdk.device.Device.getAssociatedDevice] returns null), its
    #GdkDeviceType will change to [gdk.types.DeviceType.floating],
    if it's attached, it will change to [gdk.types.DeviceType.slave].
  
    ## Parameters
    $(LIST
      * $(B device)       the #GdkDevice that changed.
      * $(B deviceManager) the instance the signal is connected to
    )
  */
  alias DeviceChangedCallbackDlg = void delegate(gdk.device.Device device, gdk.device_manager.DeviceManager deviceManager);

  /** ditto */
  alias DeviceChangedCallbackFunc = void function(gdk.device.Device device, gdk.device_manager.DeviceManager deviceManager);

  /**
    Connect to DeviceChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeviceChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DeviceChangedCallbackDlg) || is(T : DeviceChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto deviceManager = getVal!(gdk.device_manager.DeviceManager)(_paramVals);
      auto device = getVal!(gdk.device.Device)(&_paramVals[1]);
      _dClosure.dlg(device, deviceManager);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-changed", closure, after);
  }

  /**
      The ::device-removed signal is emitted either when a master
    pointer is removed, or when a slave (Hardware) input device
    is unplugged.
  
    ## Parameters
    $(LIST
      * $(B device)       the just removed #GdkDevice.
      * $(B deviceManager) the instance the signal is connected to
    )
  */
  alias DeviceRemovedCallbackDlg = void delegate(gdk.device.Device device, gdk.device_manager.DeviceManager deviceManager);

  /** ditto */
  alias DeviceRemovedCallbackFunc = void function(gdk.device.Device device, gdk.device_manager.DeviceManager deviceManager);

  /**
    Connect to DeviceRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeviceRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DeviceRemovedCallbackDlg) || is(T : DeviceRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto deviceManager = getVal!(gdk.device_manager.DeviceManager)(_paramVals);
      auto device = getVal!(gdk.device.Device)(&_paramVals[1]);
      _dClosure.dlg(device, deviceManager);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-removed", closure, after);
  }
}
