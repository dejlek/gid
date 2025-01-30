module Gtk.CellLayoutIfaceProxy;

import GObject.ObjectG;
import Gtk.CellLayout;
import Gtk.CellLayoutT;

/// Proxy object for Gtk.CellLayout interface when a GObject has no applicable D binding
class CellLayoutIfaceProxy : IfaceProxy, CellLayout
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
    return typeid(CellLayout);
  }

  mixin CellLayoutT!();
}
