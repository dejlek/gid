module gtk.section_model_iface_proxy;

import gobject.object;
import gtk.section_model;
import gtk.section_model_mixin;

/// Proxy object for Gtk.SectionModel interface when a GObject has no applicable D binding
class SectionModelIfaceProxy : IfaceProxy, gtk.section_model.SectionModel
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.section_model.SectionModel);
  }

  mixin SectionModelT!();
}
