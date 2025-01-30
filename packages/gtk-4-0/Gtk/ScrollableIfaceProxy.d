module Gtk.ScrollableIfaceProxy;

import GObject.ObjectG;
import Gtk.Scrollable;
import Gtk.ScrollableT;

/// Proxy object for Gtk.Scrollable interface when a GObject has no applicable D binding
class ScrollableIfaceProxy : IfaceProxy, Scrollable
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
    return typeid(Scrollable);
  }

  mixin ScrollableT!();
}
