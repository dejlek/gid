module Gio.SocketConnectableIfaceProxy;

import GObject.ObjectG;
import Gio.SocketConnectable;
import Gio.SocketConnectableT;

/// Proxy object for Gio.SocketConnectable interface when a GObject has no applicable D binding
class SocketConnectableIfaceProxy : IfaceProxy, SocketConnectable
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
    return typeid(SocketConnectable);
  }

  mixin SocketConnectableT!();
}
