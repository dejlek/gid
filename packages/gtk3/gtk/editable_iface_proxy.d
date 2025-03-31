/// Module for [EditableIfaceProxy] interface proxy object
module gtk.editable_iface_proxy;

import gobject.object;
import gtk.editable;
import gtk.editable_mixin;

/// Proxy object for [Gtk.Editable] interface when a GObject has no applicable D binding
class EditableIfaceProxy : IfaceProxy, gtk.editable.Editable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.editable.Editable);
  }

  mixin EditableT!();
}
