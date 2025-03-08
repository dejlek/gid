module gtk.actionable_iface_proxy;

import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;

/// Proxy object for Gtk.Actionable interface when a GObject has no applicable D binding
class ActionableIfaceProxy : IfaceProxy, gtk.actionable.Actionable
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.actionable.Actionable);
  }

  mixin ActionableT!();
}
