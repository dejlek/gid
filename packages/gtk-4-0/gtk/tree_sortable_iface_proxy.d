module gtk.tree_sortable_iface_proxy;

import gobject.object;
import gtk.tree_sortable;
import gtk.tree_sortable_mixin;

/// Proxy object for Gtk.TreeSortable interface when a GObject has no applicable D binding
class TreeSortableIfaceProxy : IfaceProxy, TreeSortable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TreeSortable);
  }

  mixin TreeSortableT!();
}
