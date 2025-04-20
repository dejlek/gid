/// Module for [OrientableIfaceProxy] interface proxy object
module gtk.orientable_iface_proxy;

import gobject.object;
import gtk.orientable;
import gtk.orientable_mixin;

/// Proxy object for [gtk.orientable.Orientable] interface when a GObject has no applicable D binding
class OrientableIfaceProxy : IfaceProxy, gtk.orientable.Orientable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.orientable.Orientable);
  }

  mixin OrientableT!();
}
