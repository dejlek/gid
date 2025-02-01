module Gtk.StyleProviderIfaceProxy;

import GObject.ObjectG;
import Gtk.StyleProvider;
import Gtk.StyleProviderT;

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
