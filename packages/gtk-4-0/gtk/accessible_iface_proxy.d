module gtk.accessible_iface_proxy;

import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;

/// Proxy object for Gtk.Accessible interface when a GObject has no applicable D binding
class AccessibleIfaceProxy : IfaceProxy, Accessible
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Accessible);
  }

  mixin AccessibleT!();
}
