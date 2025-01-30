module Gtk.CellEditableIfaceProxy;

import GObject.ObjectG;
import Gtk.CellEditable;
import Gtk.CellEditableT;

/// Proxy object for Gtk.CellEditable interface when a GObject has no applicable D binding
class CellEditableIfaceProxy : IfaceProxy, CellEditable
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
    return typeid(CellEditable);
  }

  mixin CellEditableT!();
}
