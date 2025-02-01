module Gtk.AppChooserIfaceProxy;

import GObject.ObjectG;
import Gtk.AppChooser;
import Gtk.AppChooserT;

/// Proxy object for Gtk.AppChooser interface when a GObject has no applicable D binding
class AppChooserIfaceProxy : IfaceProxy, AppChooser
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(AppChooser);
  }

  mixin AppChooserT!();
}
