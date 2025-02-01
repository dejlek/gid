module Gio.DBusObjectManagerIfaceProxy;

import GObject.ObjectG;
import Gio.DBusObjectManager;
import Gio.DBusObjectManagerT;

/// Proxy object for Gio.DBusObjectManager interface when a GObject has no applicable D binding
class DBusObjectManagerIfaceProxy : IfaceProxy, DBusObjectManager
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DBusObjectManager);
  }

  mixin DBusObjectManagerT!();
}
