module Atk.StreamableContentIfaceProxy;

import GObject.ObjectG;
import Atk.StreamableContent;
import Atk.StreamableContentT;

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
