module Gtk.AccessibleIfaceProxy;

import GObject.ObjectG;
import Gtk.Accessible;
import Gtk.AccessibleT;

/// Proxy object for Gtk.Accessible interface when a GObject has no applicable D binding
class AccessibleIfaceProxy : IfaceProxy, Accessible
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
    return typeid(Accessible);
  }

  mixin AccessibleT!();
}
