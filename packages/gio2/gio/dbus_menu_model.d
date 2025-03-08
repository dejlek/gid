module gio.dbus_menu_model;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.menu_model;
import gio.types;
import gobject.object;

/**
    [gio.dbus_menu_model.DBusMenuModel] is an implementation of [gio.menu_model.MenuModel] that can be
  used as a proxy for a menu model that is exported over D-Bus with
  [gio.dbus_connection.DBusConnection.exportMenuModel].
*/
class DBusMenuModel : gio.menu_model.MenuModel
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_menu_model_get_type != &gidSymbolNotFound ? g_dbus_menu_model_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Obtains a #GDBusMenuModel for the menu model which is exported
    at the given bus_name and object_path.
    
    The thread default main context is taken at the time of this call.
    All signals on the menu model (and any linked models) are reported
    with respect to this context.  All calls on the returned menu model
    (and linked models) must also originate from this same context, with
    the thread default main context unchanged.
    Params:
      connection =       a #GDBusConnection
      busName =       the bus name which exports the menu model
            or null if connection is not a message bus connection
      objectPath =       the object path at which the menu model is exported
    Returns:     a #GDBusMenuModel object. Free with
          [gobject.object.ObjectG.unref].
  */
  static gio.dbus_menu_model.DBusMenuModel get(gio.dbus_connection.DBusConnection connection, string busName, string objectPath)
  {
    GDBusMenuModel* _cretval;
    const(char)* _busName = busName.toCString(No.alloc);
    const(char)* _objectPath = objectPath.toCString(No.alloc);
    _cretval = g_dbus_menu_model_get(connection ? cast(GDBusConnection*)connection.cPtr(No.dup) : null, _busName, _objectPath);
    auto _retval = ObjectG.getDObject!(gio.dbus_menu_model.DBusMenuModel)(cast(GDBusMenuModel*)_cretval, Yes.take);
    return _retval;
  }
}
