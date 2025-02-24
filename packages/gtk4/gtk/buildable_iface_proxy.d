module gtk.buildable_iface_proxy;

import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;

/// Proxy object for Gtk.Buildable interface when a GObject has no applicable D binding
class BuildableIfaceProxy : IfaceProxy, Buildable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Buildable);
  }

  mixin BuildableT!();
}
