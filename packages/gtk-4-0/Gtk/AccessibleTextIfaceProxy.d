module Gtk.AccessibleTextIfaceProxy;

import GObject.ObjectG;
import Gtk.AccessibleText;
import Gtk.AccessibleTextT;

/// Proxy object for Gtk.AccessibleText interface when a GObject has no applicable D binding
class AccessibleTextIfaceProxy : IfaceProxy, AccessibleText
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(AccessibleText);
  }

  mixin AccessibleTextT!();
}
