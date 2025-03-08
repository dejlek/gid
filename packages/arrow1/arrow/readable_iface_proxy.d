module arrow.readable_iface_proxy;

import gobject.object;
import arrow.readable;
import arrow.readable_mixin;

/// Proxy object for Arrow.Readable interface when a GObject has no applicable D binding
class ReadableIfaceProxy : IfaceProxy, arrow.readable.Readable
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(arrow.readable.Readable);
  }

  mixin ReadableT!();
}
