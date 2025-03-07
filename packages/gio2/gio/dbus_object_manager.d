module gio.dbus_object_manager;

public import gio.dbus_object_manager_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface;
import gio.dbus_object;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    The [gio.dbus_object_manager.DBusObjectManager] type is the base type for service- and
  client-side implementations of the standardized
  [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
  interface.
  
  See [gio.dbus_object_manager_client.DBusObjectManagerClient] for the client-side implementation
  and [gio.dbus_object_manager_server.DBusObjectManagerServer] for the service-side implementation.
*/
interface DBusObjectManager
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_manager_get_type != &gidSymbolNotFound ? g_dbus_object_manager_get_type() : cast(GType)0;
  }

  /**
      Gets the interface proxy for interface_name at object_path, if
    any.
    Params:
      objectPath =       Object path to look up.
      interfaceName =       D-Bus interface name to look up.
    Returns:     A #GDBusInterface instance or null. Free
        with [gobject.object.ObjectG.unref].
  */
  gio.dbus_interface.DBusInterface getInterface(string objectPath, string interfaceName);

  /**
      Gets the #GDBusObject at object_path, if any.
    Params:
      objectPath =       Object path to look up.
    Returns:     A #GDBusObject or null. Free with
        [gobject.object.ObjectG.unref].
  */
  gio.dbus_object.DBusObject getObject(string objectPath);

  /**
      Gets the object path that manager is for.
    Returns:     A string owned by manager. Do not free.
  */
  string getObjectPath();

  /**
      Gets all #GDBusObject objects known to manager.
    Returns:     A list of
        #GDBusObject objects. The returned list should be freed with
        [glib.list.List.free] after each element has been freed with
        [gobject.object.ObjectG.unref].
  */
  gio.dbus_object.DBusObject[] getObjects();

  /**
      Emitted when interface is added to object.
    
    This signal exists purely as a convenience to avoid having to
    connect signals to all objects managed by manager.
  
    ## Parameters
    $(LIST
      * $(B object)       The #GDBusObject on which an interface was added.
      * $(B interface_)       The #GDBusInterface that was added.
      * $(B dBusObjectManager) the instance the signal is connected to
    )
  */
  alias InterfaceAddedCallbackDlg = void delegate(gio.dbus_object.DBusObject object, gio.dbus_interface.DBusInterface interface_, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /** ditto */
  alias InterfaceAddedCallbackFunc = void function(gio.dbus_object.DBusObject object, gio.dbus_interface.DBusInterface interface_, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /**
    Connect to InterfaceAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceAddedCallbackDlg) || is(T : InterfaceAddedCallbackFunc));

  /**
      Emitted when interface has been removed from object.
    
    This signal exists purely as a convenience to avoid having to
    connect signals to all objects managed by manager.
  
    ## Parameters
    $(LIST
      * $(B object)       The #GDBusObject on which an interface was removed.
      * $(B interface_)       The #GDBusInterface that was removed.
      * $(B dBusObjectManager) the instance the signal is connected to
    )
  */
  alias InterfaceRemovedCallbackDlg = void delegate(gio.dbus_object.DBusObject object, gio.dbus_interface.DBusInterface interface_, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /** ditto */
  alias InterfaceRemovedCallbackFunc = void function(gio.dbus_object.DBusObject object, gio.dbus_interface.DBusInterface interface_, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /**
    Connect to InterfaceRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceRemovedCallbackDlg) || is(T : InterfaceRemovedCallbackFunc));

  /**
      Emitted when object is added to manager.
  
    ## Parameters
    $(LIST
      * $(B object)       The #GDBusObject that was added.
      * $(B dBusObjectManager) the instance the signal is connected to
    )
  */
  alias ObjectAddedCallbackDlg = void delegate(gio.dbus_object.DBusObject object, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /** ditto */
  alias ObjectAddedCallbackFunc = void function(gio.dbus_object.DBusObject object, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /**
    Connect to ObjectAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectObjectAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ObjectAddedCallbackDlg) || is(T : ObjectAddedCallbackFunc));

  /**
      Emitted when object is removed from manager.
  
    ## Parameters
    $(LIST
      * $(B object)       The #GDBusObject that was removed.
      * $(B dBusObjectManager) the instance the signal is connected to
    )
  */
  alias ObjectRemovedCallbackDlg = void delegate(gio.dbus_object.DBusObject object, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /** ditto */
  alias ObjectRemovedCallbackFunc = void function(gio.dbus_object.DBusObject object, gio.dbus_object_manager.DBusObjectManager dBusObjectManager);

  /**
    Connect to ObjectRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectObjectRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ObjectRemovedCallbackDlg) || is(T : ObjectRemovedCallbackFunc));
  }
