module gtk.accessible_text_iface_proxy;

import gobject.object;
import gtk.accessible_text;
import gtk.accessible_text_mixin;

/// Proxy object for Gtk.AccessibleText interface when a GObject has no applicable D binding
class AccessibleTextIfaceProxy : IfaceProxy, gtk.accessible_text.AccessibleText
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.accessible_text.AccessibleText);
  }

  mixin AccessibleTextT!();
}
