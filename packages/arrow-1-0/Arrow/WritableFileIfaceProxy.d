module Arrow.WritableFileIfaceProxy;

import GObject.ObjectG;
import Arrow.WritableFile;
import Arrow.WritableFileT;

/// Proxy object for Arrow.WritableFile interface when a GObject has no applicable D binding
class WritableFileIfaceProxy : IfaceProxy, WritableFile
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(WritableFile);
  }

  mixin WritableFileT!();
}
