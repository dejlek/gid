module Gtk.SectionModelIfaceProxy;

import GObject.ObjectG;
import Gtk.SectionModel;
import Gtk.SectionModelT;

/// Proxy object for Gtk.SectionModel interface when a GObject has no applicable D binding
class SectionModelIfaceProxy : IfaceProxy, SectionModel
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(SectionModel);
  }

  mixin SectionModelT!();
}
