module GtkSource.CompletionProviderIfaceProxy;

import GObject.ObjectG;
import GtkSource.CompletionProvider;
import GtkSource.CompletionProviderT;

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
