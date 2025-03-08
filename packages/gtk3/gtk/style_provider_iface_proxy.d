module gtk.style_provider_iface_proxy;

import gobject.object;
import gtk.style_provider;
import gtk.style_provider_mixin;

/// Proxy object for Gtk.StyleProvider interface when a GObject has no applicable D binding
class StyleProviderIfaceProxy : IfaceProxy, gtk.style_provider.StyleProvider
{
  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gtk.style_provider.StyleProvider);
  }

  mixin StyleProviderT!();
}
