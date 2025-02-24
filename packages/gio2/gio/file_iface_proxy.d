module gio.file_iface_proxy;

import gobject.object;
import gio.file;
import gio.file_mixin;

/// Proxy object for Gio.File interface when a GObject has no applicable D binding
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
