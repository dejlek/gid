module Gtk.BuildableIfaceProxy;

import GObject.ObjectG;
import Gtk.Buildable;
import Gtk.BuildableT;

/// Proxy object for Gtk.Buildable interface when a GObject has no applicable D binding
class BuildableIfaceProxy : IfaceProxy, Buildable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Buildable);
  }

  mixin BuildableT!();
}
