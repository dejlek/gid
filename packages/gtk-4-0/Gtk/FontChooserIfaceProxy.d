module Gtk.FontChooserIfaceProxy;

import GObject.ObjectG;
import Gtk.FontChooser;
import Gtk.FontChooserT;

/// Proxy object for Gtk.FontChooser interface when a GObject has no applicable D binding
class FontChooserIfaceProxy : IfaceProxy, FontChooser
{
  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(FontChooser);
  }

  mixin FontChooserT!();
}
