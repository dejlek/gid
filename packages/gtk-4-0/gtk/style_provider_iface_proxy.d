module gtk.style_provider_iface_proxy;

import gobject.object;
import gtk.style_provider;
import gtk.style_provider_mixin;

/// Proxy object for Gtk.StyleProvider interface when a GObject has no applicable D binding
class StyleProviderIfaceProxy : IfaceProxy, StyleProvider
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(StyleProvider);
  }

  mixin StyleProviderT!();
}
