module gio.dbus_action_group;

import gid.gid;
import gio.action_group;
import gio.action_group_mixin;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.remote_action_group;
import gio.remote_action_group_mixin;
import gio.types;
import gobject.object;

/**
    [gio.dbus_action_group.DBusActionGroup] is an implementation of the [gio.action_group.ActionGroup]
  interface.
  
  [gio.dbus_action_group.DBusActionGroup] can be used as a proxy for an action group
  that is exported over D-Bus with [gio.dbus_connection.DBusConnection.exportActionGroup].
*/
class DBusActionGroup : gobject.object.ObjectG, gio.action_group.ActionGroup, gio.remote_action_group.RemoteActionGroup
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_action_group_get_type != &gidSymbolNotFound ? g_dbus_action_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ActionGroupT!();
  mixin RemoteActionGroupT!();

  /**
      Obtains a #GDBusActionGroup for the action group which is exported at
    the given bus_name and object_path.
    
    The thread default main context is taken at the time of this call.
    All signals on the menu model (and any linked models) are reported
    with respect to this context.  All calls on the returned menu model
    (and linked models) must also originate from this same context, with
    the thread default main context unchanged.
    
    This call is non-blocking.  The returned action group may or may not
    already be filled in.  The correct thing to do is connect the signals
    for the action group to monitor for changes and then to call
    [gio.action_group.ActionGroup.listActions] to get the initial list.
    Params:
      connection =       A #GDBusConnection
      busName =       the bus name which exports the action
            group or null if connection is not a message bus connection
      objectPath =       the object path at which the action group is exported
    Returns:     a #GDBusActionGroup
  */
  static gio.dbus_action_group.DBusActionGroup get(gio.dbus_connection.DBusConnection connection, string busName, string objectPath)
  {
    GDBusActionGroup* _cretval;
    const(char)* _busName = busName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_action_group_get(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, _busName, _objectPath);
    auto _retval = ObjectG.getDObject!(gio.dbus_action_group.DBusActionGroup)(cast(GDBusActionGroup*)_cretval, Yes.Take);
    return _retval;
  }
}
