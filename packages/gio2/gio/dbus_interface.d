module gio.dbus_interface;

public import gio.dbus_interface_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface_info;
import gio.dbus_object;
import gio.dbus_object_mixin;
import gio.types;
import gobject.object;

/**
 * Base type for D-Bus interfaces.
 * The `GDBusInterface` type is the base type for D-Bus interfaces both
 * on the service side $(LPAREN)see [Gio.DBusInterfaceSkeleton]$(RPAREN) and client side
 * $(LPAREN)see [Gio.DBusProxy]$(RPAREN).
 */
interface DBusInterface
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_interface_get_type != &gidSymbolNotFound ? g_dbus_interface_get_type() : cast(GType)0;
  }

  /**
   * Gets the #GDBusObject that interface_ belongs to, if any.
   * Returns: A #GDBusObject or %NULL. The returned
   *   reference should be freed with [GObject.ObjectG.unref].
   */
  DBusObject getObject();

  /**
   * Gets D-Bus introspection information for the D-Bus interface
   * implemented by interface_.
   * Returns: A #GDBusInterfaceInfo. Do not free.
   */
  DBusInterfaceInfo getInfo();

  /**
   * Sets the #GDBusObject for interface_ to object.
   * Note that interface_ will hold a weak reference to object.
   * Params:
   *   object = A #GDBusObject or %NULL.
   */
  void setObject(DBusObject object);
}
