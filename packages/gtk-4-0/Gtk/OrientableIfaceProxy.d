module Gtk.OrientableIfaceProxy;

import GObject.ObjectG;
import Gtk.Orientable;
import Gtk.OrientableT;

/// Proxy object for Gtk.Orientable interface when a GObject has no applicable D binding
class OrientableIfaceProxy : IfaceProxy, Orientable
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
    return typeid(Orientable);
  }

  mixin OrientableT!();
}
