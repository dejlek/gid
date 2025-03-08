module gio.file_descriptor_based_iface_proxy;

import gobject.object;
import gio.file_descriptor_based;
import gio.file_descriptor_based_mixin;

/// Proxy object for Gio.FileDescriptorBased interface when a GObject has no applicable D binding
class FileDescriptorBasedIfaceProxy : IfaceProxy, gio.file_descriptor_based.FileDescriptorBased
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gio.file_descriptor_based.FileDescriptorBased);
  }

  mixin FileDescriptorBasedT!();
}
