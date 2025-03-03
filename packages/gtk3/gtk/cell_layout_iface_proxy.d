module gtk.cell_layout_iface_proxy;

import gobject.object;
import gtk.cell_layout;
import gtk.cell_layout_mixin;

/// Proxy object for Gtk.CellLayout interface when a GObject has no applicable D binding
class CellLayoutIfaceProxy : IfaceProxy, gtk.cell_layout.CellLayout
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.cell_layout.CellLayout);
  }

  mixin CellLayoutT!();
}
