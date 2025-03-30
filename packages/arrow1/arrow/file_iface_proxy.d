/// Module for [FileIfaceProxy] interface proxy object
module arrow.file_iface_proxy;

import gobject.object;
import arrow.file;
import arrow.file_mixin;

/// Proxy object for [Arrow.File] interface when a GObject has no applicable D binding
class FileIfaceProxy : IfaceProxy, arrow.file.File
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(arrow.file.File);
  }

  mixin FileT!();
}
