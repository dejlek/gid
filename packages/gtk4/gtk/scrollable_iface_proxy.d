module gtk.scrollable_iface_proxy;

import gobject.object;
import gtk.scrollable;
import gtk.scrollable_mixin;

/// Proxy object for Gtk.Scrollable interface when a GObject has no applicable D binding
class ScrollableIfaceProxy : IfaceProxy, gtk.scrollable.Scrollable
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.scrollable.Scrollable);
  }

  mixin ScrollableT!();
}
