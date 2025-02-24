module arrow.writable_file_iface_proxy;

import gobject.object;
import arrow.writable_file;
import arrow.writable_file_mixin;

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
