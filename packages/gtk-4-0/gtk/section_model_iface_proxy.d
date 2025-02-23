module gtk.section_model_iface_proxy;

import gobject.object;
import gtk.section_model;
import gtk.section_model_mixin;

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
