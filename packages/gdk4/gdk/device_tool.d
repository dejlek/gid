module gdk.device_tool;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.object;

/**
    A physical tool associated to a [gdk.device.Device].
*/
class DeviceTool : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_device_tool_get_type != &gidSymbolNotFound ? gdk_device_tool_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Gets the axes of the tool.
    Returns:     the axes of tool
  */
  gdk.types.AxisFlags getAxes()
  {
    GdkAxisFlags _cretval;
    _cretval = gdk_device_tool_get_axes(cast(GdkDeviceTool*)cPtr);
    gdk.types.AxisFlags _retval = cast(gdk.types.AxisFlags)_cretval;
    return _retval;
  }

  /**
      Gets the hardware ID of this tool, or 0 if it's not known.
    
    When non-zero, the identifier is unique for the given tool model,
    meaning that two identical tools will share the same hardware_id,
    but will have different serial numbers (see
    [gdk.device_tool.DeviceTool.getSerial]).
    
    This is a more concrete (and device specific) method to identify
    a [gdk.device_tool.DeviceTool] than [gdk.device_tool.DeviceTool.getToolType],
    as a tablet may support multiple devices with the same
    [gdk.types.DeviceToolType], but different hardware identifiers.
    Returns:     The hardware identifier of this tool.
  */
  ulong getHardwareId()
  {
    ulong _retval;
    _retval = gdk_device_tool_get_hardware_id(cast(GdkDeviceTool*)cPtr);
    return _retval;
  }

  /**
      Gets the serial number of this tool.
    
    This value can be used to identify a physical tool
    (eg. a tablet pen) across program executions.
    Returns:     The serial ID for this tool
  */
  ulong getSerial()
  {
    ulong _retval;
    _retval = gdk_device_tool_get_serial(cast(GdkDeviceTool*)cPtr);
    return _retval;
  }

  /**
      Gets the [gdk.types.DeviceToolType] of the tool.
    Returns:     The physical type for this tool. This can be used to
        figure out what sort of pen is being used, such as an airbrush
        or a pencil.
  */
  gdk.types.DeviceToolType getToolType()
  {
    GdkDeviceToolType _cretval;
    _cretval = gdk_device_tool_get_tool_type(cast(GdkDeviceTool*)cPtr);
    gdk.types.DeviceToolType _retval = cast(gdk.types.DeviceToolType)_cretval;
    return _retval;
  }
}
