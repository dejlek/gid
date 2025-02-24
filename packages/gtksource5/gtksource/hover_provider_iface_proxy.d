module gtksource.hover_provider_iface_proxy;

import gobject.object;
import gtksource.hover_provider;
import gtksource.hover_provider_mixin;

/// Proxy object for GtkSource.HoverProvider interface when a GObject has no applicable D binding
class HoverProviderIfaceProxy : IfaceProxy, HoverProvider
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(HoverProvider);
  }

  mixin HoverProviderT!();
}
