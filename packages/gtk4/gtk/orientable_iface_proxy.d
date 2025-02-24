module gtk.orientable_iface_proxy;

import gobject.object;
import gtk.orientable;
import gtk.orientable_mixin;

/// Proxy object for Gtk.Orientable interface when a GObject has no applicable D binding
class OrientableIfaceProxy : IfaceProxy, Orientable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Orientable);
  }

  mixin OrientableT!();
}
