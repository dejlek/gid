module gtk.app_chooser_iface_proxy;

import gobject.object;
import gtk.app_chooser;
import gtk.app_chooser_mixin;

/// Proxy object for Gtk.AppChooser interface when a GObject has no applicable D binding
class AppChooserIfaceProxy : IfaceProxy, gtk.app_chooser.AppChooser
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.app_chooser.AppChooser);
  }

  mixin AppChooserT!();
}
