module Arrow.ReadableIfaceProxy;

import GObject.ObjectG;
import Arrow.Readable;
import Arrow.ReadableT;

/// Proxy object for Arrow.Readable interface when a GObject has no applicable D binding
class ReadableIfaceProxy : IfaceProxy, Readable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Readable);
  }

  mixin ReadableT!();
}
