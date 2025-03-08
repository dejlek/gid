module gio.dbus_object_manager_iface_proxy;

import gobject.object;
import gio.dbus_object_manager;
import gio.dbus_object_manager_mixin;

/// Proxy object for Gio.DBusObjectManager interface when a GObject has no applicable D binding
class DBusObjectManagerIfaceProxy : IfaceProxy, gio.dbus_object_manager.DBusObjectManager
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.dbus_object_manager.DBusObjectManager);
  }

  mixin DBusObjectManagerT!();
}
