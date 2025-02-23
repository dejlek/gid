module gtksource.completion_provider_iface_proxy;

import gobject.object;
import gtksource.completion_provider;
import gtksource.completion_provider_mixin;

/// Proxy object for GtkSource.CompletionProvider interface when a GObject has no applicable D binding
class CompletionProviderIfaceProxy : IfaceProxy, CompletionProvider
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(CompletionProvider);
  }

  mixin CompletionProviderT!();
}
