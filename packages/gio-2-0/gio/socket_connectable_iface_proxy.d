module gio.socket_connectable_iface_proxy;

import gobject.object;
import gio.socket_connectable;
import gio.socket_connectable_mixin;

/// Proxy object for Gio.SocketConnectable interface when a GObject has no applicable D binding
class SocketConnectableIfaceProxy : IfaceProxy, SocketConnectable
{
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
