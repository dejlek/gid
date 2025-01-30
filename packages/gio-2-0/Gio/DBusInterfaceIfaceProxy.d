module Gio.DBusInterfaceIfaceProxy;

import GObject.ObjectG;
import Gio.DBusInterface;
import Gio.DBusInterfaceT;

/// Proxy object for Gio.DBusInterface interface when a GObject has no applicable D binding
class DBusInterfaceIfaceProxy : IfaceProxy, DBusInterface
{
  this()
  {
  }

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
