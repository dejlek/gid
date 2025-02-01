module Gtk.TreeSortableIfaceProxy;

import GObject.ObjectG;
import Gtk.TreeSortable;
import Gtk.TreeSortableT;

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
