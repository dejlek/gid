module gst.toc_setter_iface_proxy;

import gobject.object;
import gst.toc_setter;
import gst.toc_setter_mixin;

/// Proxy object for Gst.TocSetter interface when a GObject has no applicable D binding
class TocSetterIfaceProxy : IfaceProxy, gst.toc_setter.TocSetter
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gst.toc_setter.TocSetter);
  }

  mixin TocSetterT!();
}
