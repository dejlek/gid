module Gtk.FileChooserIfaceProxy;

import GObject.ObjectG;
import Gtk.FileChooser;
import Gtk.FileChooserT;

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
