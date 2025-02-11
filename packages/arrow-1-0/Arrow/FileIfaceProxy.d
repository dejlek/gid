module Arrow.FileIfaceProxy;

import GObject.ObjectG;
import Arrow.File;
import Arrow.FileT;

/// Proxy object for Arrow.File interface when a GObject has no applicable D binding
class FileIfaceProxy : IfaceProxy, File
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(File);
  }

  mixin FileT!();
}
