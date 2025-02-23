module gio.dbus_interface_iface_proxy;

import gobject.object;
import gio.dbus_interface;
import gio.dbus_interface_mixin;

/// Proxy object for Gio.DBusInterface interface when a GObject has no applicable D binding
class DBusInterfaceIfaceProxy : IfaceProxy, DBusInterface
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DBusInterface);
  }

  mixin DBusInterfaceT!();
}
