module gtk.buildable_iface_proxy;

import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;

/// Proxy object for Gtk.Buildable interface when a GObject has no applicable D binding
class BuildableIfaceProxy : IfaceProxy, gtk.buildable.Buildable
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.buildable.Buildable);
  }

  mixin BuildableT!();
}
