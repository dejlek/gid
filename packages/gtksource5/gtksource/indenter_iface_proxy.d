module gtksource.indenter_iface_proxy;

import gobject.object;
import gtksource.indenter;
import gtksource.indenter_mixin;

/// Proxy object for GtkSource.Indenter interface when a GObject has no applicable D binding
class IndenterIfaceProxy : IfaceProxy, Indenter
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Indenter);
  }

  mixin IndenterT!();
}
