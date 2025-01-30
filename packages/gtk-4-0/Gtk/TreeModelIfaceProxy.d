module Gtk.TreeModelIfaceProxy;

import GObject.ObjectG;
import Gtk.TreeModel;
import Gtk.TreeModelT;

/// Proxy object for Gtk.TreeModel interface when a GObject has no applicable D binding
class TreeModelIfaceProxy : IfaceProxy, TreeModel
{
  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(TreeModel);
  }

  mixin TreeModelT!();
}
