module Gio.DBusObjectProxy;

import GObject.ObjectG;
import Gid.gid;
import Gio.DBusConnection;
import Gio.DBusObject;
import Gio.DBusObjectT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * A `GDBusObjectProxy` is an object used to represent a remote object
 * with one or more D-Bus interfaces. Normally, you don’t instantiate
 * a `GDBusObjectProxy` yourself — typically [Gio.DBusObjectManagerClient]
 * is used to obtain it.
 */
class DBusObjectProxy : ObjectG, DBusObject
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_proxy_get_type != &gidSymbolNotFound ? g_dbus_object_proxy_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin DBusObjectT!();

  /**
   * Creates a new #GDBusObjectProxy for the given connection and
   * object path.
   * Params:
   *   connection = a #GDBusConnection
   *   objectPath = the object path
   * Returns: a new #GDBusObjectProxy
   */
  this(DBusConnection connection, string objectPath)
  {
    GDBusObjectProxy* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_object_proxy_new(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, _objectPath);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the connection that proxy is for.
   * Returns: A #GDBusConnection. Do not free, the
   *   object is owned by proxy.
   */
  DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_object_proxy_get_connection(cast(GDBusObjectProxy*)cPtr);
    auto _retval = ObjectG.getDObject!DBusConnection(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }
}
