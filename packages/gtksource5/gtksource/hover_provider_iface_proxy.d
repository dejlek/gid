module gtksource.hover_provider_iface_proxy;

import gobject.object;
import gtksource.hover_provider;
import gtksource.hover_provider_mixin;

/// Proxy object for GtkSource.HoverProvider interface when a GObject has no applicable D binding
class HoverProviderIfaceProxy : IfaceProxy, gtksource.hover_provider.HoverProvider
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtksource.hover_provider.HoverProvider);
  }

  mixin HoverProviderT!();
}
