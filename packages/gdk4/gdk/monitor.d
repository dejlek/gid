module gdk.monitor;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.rectangle;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    [gdk.monitor.MonitorG] objects represent the individual outputs that are
  associated with a [gdk.display.Display].
  
  [gdk.display.Display] keeps a [gio.list_model.ListModel] to enumerate and monitor
  monitors with [gdk.display.Display.getMonitors]. You can use
  [gdk.display.Display.getMonitorAtSurface] to find a particular
  monitor.
*/
class MonitorG : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_monitor_get_type != &gidSymbolNotFound ? gdk_monitor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Gets the name of the monitor's connector, if available.
    
    These are strings such as "eDP-1", or "HDMI-2". They depend
    on software and hardware configuration, and should not be
    relied on as stable identifiers of a specific monitor.
    Returns:     the name of the connector
  */
  string getConnector()
  {
    const(char)* _cretval;
    _cretval = gdk_monitor_get_connector(cast(GdkMonitor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets a string describing the monitor, if available.
    
    This can be used to identify a monitor in the UI.
    Returns:     the monitor description
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = gdk_monitor_get_description(cast(GdkMonitor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the display that this monitor belongs to.
    Returns:     the display
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_monitor_get_display(cast(GdkMonitor*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.take);
    return _retval;
  }

  /**
      Retrieves the size and position of the monitor within the
    display coordinate space.
    
    The returned geometry is in  ”application pixels”, not in
    ”device pixels” (see [gdk.monitor.MonitorG.getScale]).
    Params:
      geometry =       a [gtk.types.Rectangle] to be filled with the monitor geometry
  */
  void getGeometry(out gdk.rectangle.Rectangle geometry)
  {
    GdkRectangle _geometry;
    gdk_monitor_get_geometry(cast(GdkMonitor*)cPtr, &_geometry);
    geometry = new gdk.rectangle.Rectangle(cast(void*)&_geometry, No.take);
  }

  /**
      Gets the height in millimeters of the monitor.
    Returns:     the physical height of the monitor
  */
  int getHeightMm()
  {
    int _retval;
    _retval = gdk_monitor_get_height_mm(cast(GdkMonitor*)cPtr);
    return _retval;
  }

  /**
      Gets the name or PNP ID of the monitor's manufacturer.
    
    Note that this value might also vary depending on actual
    display backend.
    
    The PNP ID registry is located at
    [https://uefi.org/pnp_id_list](https://uefi.org/pnp_id_list).
    Returns:     the name of the manufacturer
  */
  string getManufacturer()
  {
    const(char)* _cretval;
    _cretval = gdk_monitor_get_manufacturer(cast(GdkMonitor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the string identifying the monitor model, if available.
    Returns:     the monitor model
  */
  string getModel()
  {
    const(char)* _cretval;
    _cretval = gdk_monitor_get_model(cast(GdkMonitor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Gets the refresh rate of the monitor, if available.
    
    The value is in milli-Hertz, so a refresh rate of 60Hz
    is returned as 60000.
    Returns:     the refresh rate in milli-Hertz, or 0
  */
  int getRefreshRate()
  {
    int _retval;
    _retval = gdk_monitor_get_refresh_rate(cast(GdkMonitor*)cPtr);
    return _retval;
  }

  /**
      Gets the internal scale factor that maps from monitor coordinates
    to device pixels.
    
    This can be used if you want to create pixel based data for a
    particular monitor, but most of the time you’re drawing to a surface
    where it is better to use [gdk.surface.Surface.getScale] instead.
    Returns:     the scale
  */
  double getScale()
  {
    double _retval;
    _retval = gdk_monitor_get_scale(cast(GdkMonitor*)cPtr);
    return _retval;
  }

  /**
      Gets the internal scale factor that maps from monitor coordinates
    to device pixels.
    
    On traditional systems this is 1, but on very high density outputs
    it can be a higher value (often 2).
    
    This can be used if you want to create pixel based data for a
    particular monitor, but most of the time you’re drawing to a surface
    where it is better to use [gdk.surface.Surface.getScaleFactor] instead.
    Returns:     the scale factor
  */
  int getScaleFactor()
  {
    int _retval;
    _retval = gdk_monitor_get_scale_factor(cast(GdkMonitor*)cPtr);
    return _retval;
  }

  /**
      Gets information about the layout of red, green and blue
    primaries for pixels.
    Returns:     the subpixel layout
  */
  gdk.types.SubpixelLayout getSubpixelLayout()
  {
    GdkSubpixelLayout _cretval;
    _cretval = gdk_monitor_get_subpixel_layout(cast(GdkMonitor*)cPtr);
    gdk.types.SubpixelLayout _retval = cast(gdk.types.SubpixelLayout)_cretval;
    return _retval;
  }

  /**
      Gets the width in millimeters of the monitor.
    Returns:     the physical width of the monitor
  */
  int getWidthMm()
  {
    int _retval;
    _retval = gdk_monitor_get_width_mm(cast(GdkMonitor*)cPtr);
    return _retval;
  }

  /**
      Returns true if the monitor object corresponds to a
    physical monitor.
    
    The monitor becomes invalid when the physical monitor
    is unplugged or removed.
    Returns:     true if the object corresponds to a physical monitor
  */
  bool isValid()
  {
    bool _retval;
    _retval = gdk_monitor_is_valid(cast(GdkMonitor*)cPtr);
    return _retval;
  }

  /**
      Emitted when the output represented by monitor gets disconnected.
  
    ## Parameters
    $(LIST
      * $(B monitorG) the instance the signal is connected to
    )
  */
  alias InvalidateCallbackDlg = void delegate(gdk.monitor.MonitorG monitorG);

  /** ditto */
  alias InvalidateCallbackFunc = void function(gdk.monitor.MonitorG monitorG);

  /**
    Connect to Invalidate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectInvalidate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : InvalidateCallbackDlg) || is(T : InvalidateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto monitorG = getVal!(gdk.monitor.MonitorG)(_paramVals);
      _dClosure.dlg(monitorG);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("invalidate", closure, after);
  }
}
