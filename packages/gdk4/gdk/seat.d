module gdk.seat;

import gdk.c.functions;
import gdk.c.types;
import gdk.device;
import gdk.device_tool;
import gdk.display;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The [gdk.seat.Seat] object represents a collection of input devices
  that belong to a user.
*/
class Seat : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_seat_get_type != &gidSymbolNotFound ? gdk_seat_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Returns the capabilities this [gdk.seat.Seat] currently has.
    Returns:     the seat capabilities
  */
  gdk.types.SeatCapabilities getCapabilities()
  {
    GdkSeatCapabilities _cretval;
    _cretval = gdk_seat_get_capabilities(cast(GdkSeat*)cPtr);
    gdk.types.SeatCapabilities _retval = cast(gdk.types.SeatCapabilities)_cretval;
    return _retval;
  }

  /**
      Returns the devices that match the given capabilities.
    Params:
      capabilities =       capabilities to get devices for
    Returns:     A list
        of `GdkDevices`. The list must be freed with [glib.list.List.free],
        the elements are owned by GTK and must not be freed.
  */
  gdk.device.Device[] getDevices(gdk.types.SeatCapabilities capabilities)
  {
    GList* _cretval;
    _cretval = gdk_seat_get_devices(cast(GdkSeat*)cPtr, capabilities);
    auto _retval = gListToD!(gdk.device.Device, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the [gdk.display.Display] this seat belongs to.
    Returns:     a [gdk.display.Display]. This object
        is owned by GTK and must not be freed.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_seat_get_display(cast(GdkSeat*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the device that routes keyboard events.
    Returns:     a [gdk.device.Device] with keyboard
        capabilities. This object is owned by GTK and must not be freed.
  */
  gdk.device.Device getKeyboard()
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_keyboard(cast(GdkSeat*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the device that routes pointer events.
    Returns:     a [gdk.device.Device] with pointer
        capabilities. This object is owned by GTK and must not be freed.
  */
  gdk.device.Device getPointer()
  {
    GdkDevice* _cretval;
    _cretval = gdk_seat_get_pointer(cast(GdkSeat*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.device.Device)(cast(GdkDevice*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns all `GdkDeviceTools` that are known to the application.
    Returns:     A list of tools. Free with [glib.list.List.free].
  */
  gdk.device_tool.DeviceTool[] getTools()
  {
    GList* _cretval;
    _cretval = gdk_seat_get_tools(cast(GdkSeat*)cPtr);
    auto _retval = gListToD!(gdk.device_tool.DeviceTool, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Emitted when a new input device is related to this seat.
  
    ## Parameters
    $(LIST
      * $(B device)       the newly added [gdk.device.Device].
      * $(B seat) the instance the signal is connected to
    )
  */
  alias DeviceAddedCallbackDlg = void delegate(gdk.device.Device device, gdk.seat.Seat seat);

  /** ditto */
  alias DeviceAddedCallbackFunc = void function(gdk.device.Device device, gdk.seat.Seat seat);

  /**
    Connect to DeviceAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeviceAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeviceAddedCallbackDlg) || is(T : DeviceAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto seat = getVal!(gdk.seat.Seat)(_paramVals);
      auto device = getVal!(gdk.device.Device)(&_paramVals[1]);
      _dClosure.dlg(device, seat);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-added", closure, after);
  }

  /**
      Emitted when an input device is removed (e.g. unplugged).
  
    ## Parameters
    $(LIST
      * $(B device)       the just removed [gdk.device.Device].
      * $(B seat) the instance the signal is connected to
    )
  */
  alias DeviceRemovedCallbackDlg = void delegate(gdk.device.Device device, gdk.seat.Seat seat);

  /** ditto */
  alias DeviceRemovedCallbackFunc = void function(gdk.device.Device device, gdk.seat.Seat seat);

  /**
    Connect to DeviceRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeviceRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeviceRemovedCallbackDlg) || is(T : DeviceRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto seat = getVal!(gdk.seat.Seat)(_paramVals);
      auto device = getVal!(gdk.device.Device)(&_paramVals[1]);
      _dClosure.dlg(device, seat);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("device-removed", closure, after);
  }

  /**
      Emitted whenever a new tool is made known to the seat.
    
    The tool may later be assigned to a device (i.e. on
    proximity with a tablet). The device will emit the
    `signalGdk.Device::tool-changed` signal accordingly.
    
    A same tool may be used by several devices.
  
    ## Parameters
    $(LIST
      * $(B tool)       the new [gdk.device_tool.DeviceTool] known to the seat
      * $(B seat) the instance the signal is connected to
    )
  */
  alias ToolAddedCallbackDlg = void delegate(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat);

  /** ditto */
  alias ToolAddedCallbackFunc = void function(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat);

  /**
    Connect to ToolAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToolAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToolAddedCallbackDlg) || is(T : ToolAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto seat = getVal!(gdk.seat.Seat)(_paramVals);
      auto tool = getVal!(gdk.device_tool.DeviceTool)(&_paramVals[1]);
      _dClosure.dlg(tool, seat);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-added", closure, after);
  }

  /**
      Emitted whenever a tool is no longer known to this seat.
  
    ## Parameters
    $(LIST
      * $(B tool)       the just removed [gdk.device_tool.DeviceTool]
      * $(B seat) the instance the signal is connected to
    )
  */
  alias ToolRemovedCallbackDlg = void delegate(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat);

  /** ditto */
  alias ToolRemovedCallbackFunc = void function(gdk.device_tool.DeviceTool tool, gdk.seat.Seat seat);

  /**
    Connect to ToolRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectToolRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToolRemovedCallbackDlg) || is(T : ToolRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto seat = getVal!(gdk.seat.Seat)(_paramVals);
      auto tool = getVal!(gdk.device_tool.DeviceTool)(&_paramVals[1]);
      _dClosure.dlg(tool, seat);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("tool-removed", closure, after);
  }
}
