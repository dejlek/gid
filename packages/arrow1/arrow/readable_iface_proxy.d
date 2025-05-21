/// Module for [ReadableIfaceProxy] interface proxy object
module arrow.readable_iface_proxy;

import gobject.object;
import arrow.readable;
import arrow.readable_mixin;

/// Proxy object for [arrow.readable.Readable] interface when a GObject has no applicable D binding
class ReadableIfaceProxy : IfaceProxy, arrow.readable.Readable
{
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(arrow.readable.Readable);
  }

  mixin ReadableT!();
}
