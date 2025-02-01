module Gtk.EditableIfaceProxy;

import GObject.ObjectG;
import Gtk.Editable;
import Gtk.EditableT;

/// Proxy object for Gtk.Editable interface when a GObject has no applicable D binding
class EditableIfaceProxy : IfaceProxy, Editable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Editable);
  }

  mixin EditableT!();
}
