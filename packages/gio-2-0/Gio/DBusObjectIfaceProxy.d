module Gio.DBusObjectIfaceProxy;

import GObject.ObjectG;
import Gio.DBusObject;
import Gio.DBusObjectT;

/// Proxy object for Gio.DBusObject interface when a GObject has no applicable D binding
class DBusObjectIfaceProxy : IfaceProxy, DBusObject
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DBusObject);
  }

  mixin DBusObjectT!();
}
