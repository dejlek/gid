module gio.file_descriptor_based_iface_proxy;

import gobject.object;
import gio.file_descriptor_based;
import gio.file_descriptor_based_mixin;

/// Proxy object for Gio.FileDescriptorBased interface when a GObject has no applicable D binding
class FileDescriptorBasedIfaceProxy : IfaceProxy, FileDescriptorBased
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(FileDescriptorBased);
  }

  mixin FileDescriptorBasedT!();
}
