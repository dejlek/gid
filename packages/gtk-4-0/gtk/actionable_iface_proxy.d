module gtk.actionable_iface_proxy;

import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;

/// Proxy object for Gtk.Actionable interface when a GObject has no applicable D binding
class ActionableIfaceProxy : IfaceProxy, Actionable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Actionable);
  }

  mixin ActionableT!();
}
