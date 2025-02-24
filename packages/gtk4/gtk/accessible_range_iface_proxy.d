module gtk.accessible_range_iface_proxy;

import gobject.object;
import gtk.accessible_range;
import gtk.accessible_range_mixin;

/// Proxy object for Gtk.AccessibleRange interface when a GObject has no applicable D binding
class AccessibleRangeIfaceProxy : IfaceProxy, AccessibleRange
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(AccessibleRange);
  }

  mixin AccessibleRangeT!();
}
