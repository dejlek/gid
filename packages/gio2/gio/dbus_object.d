module gio.dbus_object;

public import gio.dbus_object_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
 * The `GDBusObject` type is the base type for D-Bus objects on both
 * the service side $(LPAREN)see [gio.dbus_object_skeleton.DBusObjectSkeleton]$(RPAREN) and the client side
 * $(LPAREN)see [gio.dbus_object_proxy.DBusObjectProxy]$(RPAREN). It is essentially just a container of
 * interfaces.
 */
interface DBusObject
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_get_type != &gidSymbolNotFound ? g_dbus_object_get_type() : cast(GType)0;
  }

  /**
   * Gets the D-Bus interface with name interface_name associated with
   * object, if any.
   * Params:
   *   interfaceName = A D-Bus interface name.
   * Returns: %NULL if not found, otherwise a
   *   #GDBusInterface that must be freed with [gobject.object.ObjectG.unref].
   */
  gio.dbus_interface.DBusInterface getInterface(string interfaceName);

  /**
   * Gets the D-Bus interfaces associated with object.
   * Returns: A list of #GDBusInterface instances.
   *   The returned list must be freed by [glib.list.List.free] after each element has been freed
   *   with [gobject.object.ObjectG.unref].
   */
  gio.dbus_interface.DBusInterface[] getInterfaces();

  /**
   * Gets the object path for object.
   * Returns: A string owned by object. Do not free.
   */
  string getObjectPath();

  /**
   * Emitted when interface is added to object.
   * Params
   *   interface_ = The #GDBusInterface that was added.
   *   dBusObject = the instance the signal is connected to
   */
  alias InterfaceAddedCallbackDlg = void delegate(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);
  alias InterfaceAddedCallbackFunc = void function(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);

  /**
   * Connect to InterfaceAdded signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceAddedCallbackDlg) || is(T : InterfaceAddedCallbackFunc));

  /**
   * Emitted when interface is removed from object.
   * Params
   *   interface_ = The #GDBusInterface that was removed.
   *   dBusObject = the instance the signal is connected to
   */
  alias InterfaceRemovedCallbackDlg = void delegate(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);
  alias InterfaceRemovedCallbackFunc = void function(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);

  /**
   * Connect to InterfaceRemoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceRemovedCallbackDlg) || is(T : InterfaceRemovedCallbackFunc));
  }
