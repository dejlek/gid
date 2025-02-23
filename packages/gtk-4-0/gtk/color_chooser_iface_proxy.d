module gtk.color_chooser_iface_proxy;

import gobject.object;
import gtk.color_chooser;
import gtk.color_chooser_mixin;

/// Proxy object for Gtk.ColorChooser interface when a GObject has no applicable D binding
class ColorChooserIfaceProxy : IfaceProxy, ColorChooser
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(ColorChooser);
  }

  mixin ColorChooserT!();
}
