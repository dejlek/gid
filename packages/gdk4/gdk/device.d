module gdk.device;

import gdk.c.functions;
import gdk.c.types;
import gdk.device_tool;
import gdk.display;
import gdk.seat;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import pango.types;

/**
    The [gdk.device.Device] object represents an input device, such
  as a keyboard, a mouse, or a touchpad.
  
  See the [gdk.seat.Seat] documentation for more information
  about the various kinds of devices, and their relationships.
*/
class Device : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_device_get_type != &gidSymbolNotFound ? gdk_device_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Retrieves whether the Caps Lock modifier of the keyboard is locked.
    
    This is only relevant for keyboard devices.
    Returns:     true if Caps Lock is on for device
  */
  bool getCapsLockState()
  {
    bool _retval;
    _retval = gdk_device_get_caps_lock_state(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current tool for device.
    Returns:     the [gdk.device_tool.DeviceTool]
  */
  gdk.device_tool.DeviceTool getDeviceTool()
  {
    GdkDeviceTool* _cretval;
    _cretval = gdk_device_get_device_tool(cast(GdkDevice*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the direction of effective layout of the keyboard.
    
    This is only relevant for keyboard devices.
    
    The direction of a layout is the direction of the majority
    of its symbols. See `funcPango.unichar_direction`.
    Returns:     [pango.types.Direction.Ltr] or [pango.types.Direction.Rtl]
        if it can determine the direction. [pango.types.Direction.Neutral]
        otherwise
  */
  pango.types.Direction getDirection()
  {
    PangoDirection _cretval;
    _cretval = gdk_device_get_direction(cast(GdkDevice*)cPtr);
    pango.types.Direction _retval = cast(pango.types.Direction)_cretval;
    return _retval;
  }

  /**
      Returns the [gdk.display.Display] to which device pertains.
    Returns:     a [gdk.display.Display]
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_device_get_display(cast(GdkDevice*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the pointer follows device motion.
    
    This is not meaningful for keyboard devices, which
    don't have a pointer.
    Returns:     true if the pointer follows device motion
  */
  bool getHasCursor()
  {
    bool _retval;
    _retval = gdk_device_get_has_cursor(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Retrieves the current modifier state of the keyboard.
    
    This is only relevant for keyboard devices.
    Returns:     the current modifier state
  */
  gdk.types.ModifierType getModifierState()
  {
    GdkModifierType _cretval;
    _cretval = gdk_device_get_modifier_state(cast(GdkDevice*)cPtr);
    gdk.types.ModifierType _retval = cast(gdk.types.ModifierType)_cretval;
    return _retval;
  }

  /**
      The name of the device, suitable for showing in a user interface.
    Returns:     a name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_name(cast(GdkDevice*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves whether the Num Lock modifier of the keyboard is locked.
    
    This is only relevant for keyboard devices.
    Returns:     true if Num Lock is on for device
  */
  bool getNumLockState()
  {
    bool _retval;
    _retval = gdk_device_get_num_lock_state(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Retrieves the number of touch points associated to device.
    Returns:     the number of touch points
  */
  uint getNumTouches()
  {
    uint _retval;
    _retval = gdk_device_get_num_touches(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Returns the product ID of this device.
    
    This ID is retrieved from the device, and does not change.
    See [gdk.device.Device.getVendorId] for more information.
    Returns:     the product ID
  */
  string getProductId()
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_product_id(cast(GdkDevice*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves whether the Scroll Lock modifier of the keyboard is locked.
    
    This is only relevant for keyboard devices.
    Returns:     true if Scroll Lock is on for device
  */
  bool getScrollLockState()
  {
    bool _retval;
    _retval = gdk_device_get_scroll_lock_state(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Returns the [gdk.seat.Seat] the device belongs to.
    Returns:     a [gdk.seat.Seat]
  */
  gdk.seat.Seat getSeat()
  {
    GdkSeat* _cretval;
    _cretval = gdk_device_get_seat(cast(GdkDevice*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.seat.Seat)(cast(GdkSeat*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the type of the device.
    Returns:     a [gdk.types.InputSource]
  */
  gdk.types.InputSource getSource()
  {
    GdkInputSource _cretval;
    _cretval = gdk_device_get_source(cast(GdkDevice*)cPtr);
    gdk.types.InputSource _retval = cast(gdk.types.InputSource)_cretval;
    return _retval;
  }

  /**
      Obtains the surface underneath device, returning the location of the
    device in win_x and win_y.
    
    Returns null if the surface tree under device is not known to GDK
    (for example, belongs to another application).
    Params:
      winX =       return location for the X coordinate
          of the device location relative to the surface origin
      winY =       return location for the Y coordinate
          of the device location relative to the surface origin
    Returns:     the [gdk.surface.Surface] under the
        device position
  */
  gdk.surface.Surface getSurfaceAtPosition(out double winX, out double winY)
  {
    GdkSurface* _cretval;
    _cretval = gdk_device_get_surface_at_position(cast(GdkDevice*)cPtr, cast(double*)&winX, cast(double*)&winY);
    auto _retval = ObjectG.getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the timestamp of the last activity for this device.
    
    In practice, this means the timestamp of the last event that was
    received from the OS for this device. (GTK may occasionally produce
    events for a device that are not received from the OS, and will not
    update the timestamp).
    Returns:     the timestamp of the last activity for this device
  */
  uint getTimestamp()
  {
    uint _retval;
    _retval = gdk_device_get_timestamp(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Returns the vendor ID of this device.
    
    This ID is retrieved from the device, and does not change.
    
    This function, together with [gdk.device.Device.getProductId],
    can be used to eg. compose [gio.settings.Settings] paths to store settings
    for this device.
    
    ```c
     static GSettings *
     get_device_settings (GdkDevice *device)
     {
       const char *vendor, *product;
       GSettings *settings;
       GdkDevice *device;
       char *path;
    
       vendor = gdk_device_get_vendor_id (device);
       product = gdk_device_get_product_id (device);
    
       path = g_strdup_printf ("/org/example/app/devices/%s:%s/", vendor, product);
       settings = g_settings_new_with_path (DEVICE_SCHEMA, path);
       g_free (path);
    
       return settings;
     }
    ```
    Returns:     the vendor ID
  */
  string getVendorId()
  {
    const(char)* _cretval;
    _cretval = gdk_device_get_vendor_id(cast(GdkDevice*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Determines if layouts for both right-to-left and
    left-to-right languages are in use on the keyboard.
    
    This is only relevant for keyboard devices.
    Returns:     true if there are layouts with both directions, false otherwise
  */
  bool hasBidiLayouts()
  {
    bool _retval;
    _retval = gdk_device_has_bidi_layouts(cast(GdkDevice*)cPtr);
    return _retval;
  }

  /**
      Emitted either when the number of either axes or keys changes.
    
    On X11 this will normally happen when the physical device
    routing events through the logical device changes (for
    example, user switches from the USB mouse to a tablet); in
    that case the logical device will change to reflect the axes
    and keys on the new physical device.
  
    ## Parameters
    $(LIST
      * $(B device) the instance the signal is connected to
    )
  */
  alias ChangedCallbackDlg = void delegate(gdk.device.Device device);

  /** ditto */
  alias ChangedCallbackFunc = void function(gdk.device.Device device);

  /**
    Connect to Changed signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangedCallbackDlg) || is(T : ChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto device = getVal!(gdk.device.Device)(_paramVals);
      _dClosure.dlg(device);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Emitted on pen/eraser devices whenever tools enter or leave proximity.
  
    ## Parameters
    $(LIST
      * $(B tool)       The new current tool
      * $(B device) the instance the signal is connected to
    )
  */
  alias ToolChangedCallbackDlg = void delegate(gdk.device_tool.DeviceTool tool, gdk.device.Device device);

  /** ditto */
  alias ToolChangedCallbackFunc = void function(gdk.device_tool.DeviceTool tool, gdk.device.Device device);

  /**
    Connect to ToolChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToolChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToolChangedCallbackDlg) || is(T : ToolChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto device = getVal!(gdk.device.Device)(_paramVals);
      auto tool = getVal!(gdk.device_tool.DeviceTool)(&_paramVals[1]);
      _dClosure.dlg(tool, device);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-changed", closure, after);
  }
}
