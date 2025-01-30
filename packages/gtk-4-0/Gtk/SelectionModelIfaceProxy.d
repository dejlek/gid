module Gtk.SelectionModelIfaceProxy;

import GObject.ObjectG;
import Gtk.SelectionModel;
import Gtk.SelectionModelT;

/// Proxy object for Gtk.SelectionModel interface when a GObject has no applicable D binding
class SelectionModelIfaceProxy : IfaceProxy, SelectionModel
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
    return typeid(SelectionModel);
  }

  mixin SelectionModelT!();
}
