module Gtk.NativeIfaceProxy;

import GObject.ObjectG;
import Gtk.Native;
import Gtk.NativeT;

/// Proxy object for Gtk.Native interface when a GObject has no applicable D binding
class NativeIfaceProxy : IfaceProxy, Native
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Native);
  }

  mixin NativeT!();
}
