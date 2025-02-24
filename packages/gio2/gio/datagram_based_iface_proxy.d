module gio.datagram_based_iface_proxy;

import gobject.object;
import gio.datagram_based;
import gio.datagram_based_mixin;

/// Proxy object for Gio.DatagramBased interface when a GObject has no applicable D binding
class DatagramBasedIfaceProxy : IfaceProxy, DatagramBased
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DatagramBased);
  }

  mixin DatagramBasedT!();
}
