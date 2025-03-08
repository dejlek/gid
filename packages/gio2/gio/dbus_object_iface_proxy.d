module gio.dbus_object_iface_proxy;

import gobject.object;
import gio.dbus_object;
import gio.dbus_object_mixin;

/// Proxy object for Gio.DBusObject interface when a GObject has no applicable D binding
class DBusObjectIfaceProxy : IfaceProxy, gio.dbus_object.DBusObject
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.dbus_object.DBusObject);
  }

  mixin DBusObjectT!();
}
