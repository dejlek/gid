/// Module for [TreeModelIfaceProxy] interface proxy object
module gtk.tree_model_iface_proxy;

import gobject.object;
import gtk.tree_model;
import gtk.tree_model_mixin;

/// Proxy object for [Gtk.TreeModel] interface when a GObject has no applicable D binding
class TreeModelIfaceProxy : IfaceProxy, gtk.tree_model.TreeModel
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.tree_model.TreeModel);
  }

  mixin TreeModelT!();
}
