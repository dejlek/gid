module atk.streamable_content_iface_proxy;

import gobject.object;
import atk.streamable_content;
import atk.streamable_content_mixin;

/// Proxy object for Atk.StreamableContent interface when a GObject has no applicable D binding
class StreamableContentIfaceProxy : IfaceProxy, StreamableContent
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(StreamableContent);
  }

  mixin StreamableContentT!();
}
