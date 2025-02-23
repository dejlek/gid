module gtk.accessible_text_iface_proxy;

import gobject.object;
import gtk.accessible_text;
import gtk.accessible_text_mixin;

/// Proxy object for Gtk.AccessibleText interface when a GObject has no applicable D binding
class AccessibleTextIfaceProxy : IfaceProxy, AccessibleText
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(AccessibleText);
  }

  mixin AccessibleTextT!();
}
