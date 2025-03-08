module gio.unix_mount_monitor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    Watches #GUnixMounts for changes.
*/
class UnixMountMonitor : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_unix_mount_monitor_get_type != &gidSymbolNotFound ? g_unix_mount_monitor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Deprecated alias for [gio.unix_mount_monitor.UnixMountMonitor.get].
    
    This function was never a true constructor, which is why it was
    renamed.
    Returns:     a #GUnixMountMonitor.
  
    Deprecated:     Use [gio.unix_mount_monitor.UnixMountMonitor.get] instead.
  */
  this()
  {
    GUnixMountMonitor* _cretval;
    _cretval = g_unix_mount_monitor_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the #GUnixMountMonitor for the current thread-default main
    context.
    
    The mount monitor can be used to monitor for changes to the list of
    mounted filesystems as well as the list of mount points (ie: fstab
    entries).
    
    You must only call [gobject.object.ObjectG.unref] on the return value from under
    the same main context as you called this function.
    Returns:     the #GUnixMountMonitor.
  */
  static gio.unix_mount_monitor.UnixMountMonitor get()
  {
    GUnixMountMonitor* _cretval;
    _cretval = g_unix_mount_monitor_get();
    auto _retval = ObjectG.getDObject!(gio.unix_mount_monitor.UnixMountMonitor)(cast(GUnixMountMonitor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function does nothing.
    
    Before 2.44, this was a partially-effective way of controlling the
    rate at which events would be reported under some uncommon
    circumstances.  Since mount_monitor is a singleton, it also meant
    that calling this function would have side effects for other users of
    the monitor.
    Params:
      limitMsec =       a integer with the limit in milliseconds to
            poll for changes.
  
    Deprecated:     This function does nothing.  Don't call it.
  */
  void setRateLimit(int limitMsec)
  {
    g_unix_mount_monitor_set_rate_limit(cast(GUnixMountMonitor*)cPtr, limitMsec);
  }

  /**
      Emitted when the unix mount points have changed.
  
    ## Parameters
    $(LIST
      * $(B unixMountMonitor) the instance the signal is connected to
    )
  */
  alias MountpointsChangedCallbackDlg = void delegate(gio.unix_mount_monitor.UnixMountMonitor unixMountMonitor);

  /** ditto */
  alias MountpointsChangedCallbackFunc = void function(gio.unix_mount_monitor.UnixMountMonitor unixMountMonitor);

  /**
    Connect to MountpointsChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMountpointsChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountpointsChangedCallbackDlg) || is(T : MountpointsChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto unixMountMonitor = getVal!(gio.unix_mount_monitor.UnixMountMonitor)(_paramVals);
      _dClosure.dlg(unixMountMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mountpoints-changed", closure, after);
  }

  /**
      Emitted when the unix mounts have changed.
  
    ## Parameters
    $(LIST
      * $(B unixMountMonitor) the instance the signal is connected to
    )
  */
  alias MountsChangedCallbackDlg = void delegate(gio.unix_mount_monitor.UnixMountMonitor unixMountMonitor);

  /** ditto */
  alias MountsChangedCallbackFunc = void function(gio.unix_mount_monitor.UnixMountMonitor unixMountMonitor);

  /**
    Connect to MountsChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMountsChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountsChangedCallbackDlg) || is(T : MountsChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto unixMountMonitor = getVal!(gio.unix_mount_monitor.UnixMountMonitor)(_paramVals);
      _dClosure.dlg(unixMountMonitor);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mounts-changed", closure, after);
  }
}
