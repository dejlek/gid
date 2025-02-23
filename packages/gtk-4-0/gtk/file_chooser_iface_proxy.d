module gtk.file_chooser_iface_proxy;

import gobject.object;
import gtk.file_chooser;
import gtk.file_chooser_mixin;

/// Proxy object for Gtk.FileChooser interface when a GObject has no applicable D binding
class FileChooserIfaceProxy : IfaceProxy, FileChooser
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(FileChooser);
  }

  mixin FileChooserT!();
}
