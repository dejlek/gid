module gtk.accessible_range_iface_proxy;

import gobject.object;
import gtk.accessible_range;
import gtk.accessible_range_mixin;

/// Proxy object for Gtk.AccessibleRange interface when a GObject has no applicable D binding
class AccessibleRangeIfaceProxy : IfaceProxy, gtk.accessible_range.AccessibleRange
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.accessible_range.AccessibleRange);
  }

  mixin AccessibleRangeT!();
}
