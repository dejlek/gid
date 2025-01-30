module Gio.FileDescriptorBasedIfaceProxy;

import GObject.ObjectG;
import Gio.FileDescriptorBased;
import Gio.FileDescriptorBasedT;

/// Proxy object for Gio.FileDescriptorBased interface when a GObject has no applicable D binding
class FileDescriptorBasedIfaceProxy : IfaceProxy, FileDescriptorBased
{
  this()
  {
  }

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
