module Gio.DatagramBasedIfaceProxy;

import GObject.ObjectG;
import Gio.DatagramBased;
import Gio.DatagramBasedT;

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
