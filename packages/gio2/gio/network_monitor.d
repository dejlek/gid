module gio.network_monitor;

public import gio.network_monitor_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.socket_connectable;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    [gio.network_monitor.NetworkMonitor] provides an easy-to-use cross-platform API
  for monitoring network connectivity. On Linux, the available
  implementations are based on the kernel's netlink interface and
  on NetworkManager.
  
  There is also an implementation for use inside Flatpak sandboxes.
*/
interface NetworkMonitor
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_network_monitor_get_type != &gidSymbolNotFound ? g_network_monitor_get_type() : cast(GType)0;
  }

  /**
      Gets the default #GNetworkMonitor for the system.
    Returns:     a #GNetworkMonitor, which will be
          a dummy object if no network monitor is available
  */
  static gio.network_monitor.NetworkMonitor getDefault()
  {
    GNetworkMonitor* _cretval;
    _cretval = g_network_monitor_get_default();
    auto _retval = ObjectG.getDObject!(gio.network_monitor.NetworkMonitor)(cast(GNetworkMonitor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Attempts to determine whether or not the host pointed to by
    connectable can be reached, without actually trying to connect to
    it.
    
    This may return true even when #GNetworkMonitor:network-available
    is false, if, for example, monitor can determine that
    connectable refers to a host on a local network.
    
    If monitor believes that an attempt to connect to connectable
    will succeed, it will return true. Otherwise, it will return
    false and set error to an appropriate error (such as
    [gio.types.IOErrorEnum.HostUnreachable]).
    
    Note that although this does not attempt to connect to
    connectable, it may still block for a brief period of time (eg,
    trying to do multicast DNS on the local network), so if you do not
    want to block, you should use [gio.network_monitor.NetworkMonitor.canReachAsync].
    Params:
      connectable =       a #GSocketConnectable
      cancellable =       a #GCancellable, or null
    Returns:     true if connectable is reachable, false if not.
  */
  bool canReach(gio.socket_connectable.SocketConnectable connectable, gio.cancellable.Cancellable cancellable = null);

  /**
      Asynchronously attempts to determine whether or not the host
    pointed to by connectable can be reached, without actually
    trying to connect to it.
    
    For more details, see [gio.network_monitor.NetworkMonitor.canReach].
    
    When the operation is finished, callback will be called.
    You can then call [gio.network_monitor.NetworkMonitor.canReachFinish]
    to get the result of the operation.
    Params:
      connectable =       a #GSocketConnectable
      cancellable =       a #GCancellable, or null
      callback =       a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void canReachAsync(gio.socket_connectable.SocketConnectable connectable, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes an async network connectivity test.
    See [gio.network_monitor.NetworkMonitor.canReachAsync].
    Params:
      result =       a #GAsyncResult
    Returns:     true if network is reachable, false if not.
  */
  bool canReachFinish(gio.async_result.AsyncResult result);

  /**
      Gets a more detailed networking state than
    [gio.network_monitor.NetworkMonitor.getNetworkAvailable].
    
    If #GNetworkMonitor:network-available is false, then the
    connectivity state will be [gio.types.NetworkConnectivity.Local].
    
    If #GNetworkMonitor:network-available is true, then the
    connectivity state will be [gio.types.NetworkConnectivity.Full] (if there
    is full Internet connectivity), [gio.types.NetworkConnectivity.Limited] (if
    the host has a default route, but appears to be unable to actually
    reach the full Internet), or [gio.types.NetworkConnectivity.Portal] (if the
    host is trapped behind a "captive portal" that requires some sort
    of login or acknowledgement before allowing full Internet access).
    
    Note that in the case of [gio.types.NetworkConnectivity.Limited] and
    [gio.types.NetworkConnectivity.Portal], it is possible that some sites are
    reachable but others are not. In this case, applications can
    attempt to connect to remote servers, but should gracefully fall
    back to their "offline" behavior if the connection attempt fails.
    Returns:     the network connectivity state
  */
  gio.types.NetworkConnectivity getConnectivity();

  /**
      Checks if the network is available. "Available" here means that the
    system has a default route available for at least one of IPv4 or
    IPv6. It does not necessarily imply that the public Internet is
    reachable. See #GNetworkMonitor:network-available for more details.
    Returns:     whether the network is available
  */
  bool getNetworkAvailable();

  /**
      Checks if the network is metered.
    See #GNetworkMonitor:network-metered for more details.
    Returns:     whether the connection is metered
  */
  bool getNetworkMetered();

  /**
      Emitted when the network configuration changes.
  
    ## Parameters
    $(LIST
      * $(B networkAvailable)       the current value of #GNetworkMonitor:network-available
      * $(B networkMonitor) the instance the signal is connected to
    )
  */
  alias NetworkChangedCallbackDlg = void delegate(bool networkAvailable, gio.network_monitor.NetworkMonitor networkMonitor);

  /** ditto */
  alias NetworkChangedCallbackFunc = void function(bool networkAvailable, gio.network_monitor.NetworkMonitor networkMonitor);

  /**
    Connect to NetworkChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectNetworkChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NetworkChangedCallbackDlg) || is(T : NetworkChangedCallbackFunc));
  }
