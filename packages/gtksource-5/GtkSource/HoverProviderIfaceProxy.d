module GtkSource.HoverProviderIfaceProxy;

import GObject.ObjectG;
import GtkSource.HoverProvider;
import GtkSource.HoverProviderT;

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
