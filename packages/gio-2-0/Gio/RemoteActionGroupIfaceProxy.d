module Gio.RemoteActionGroupIfaceProxy;

import GObject.ObjectG;
import Gio.RemoteActionGroup;
import Gio.RemoteActionGroupT;

/// Proxy object for Gio.RemoteActionGroup interface when a GObject has no applicable D binding
class RemoteActionGroupIfaceProxy : IfaceProxy, RemoteActionGroup
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
    return typeid(RemoteActionGroup);
  }

  mixin RemoteActionGroupT!();
}
