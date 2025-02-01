module Gtk.BuilderScopeIfaceProxy;

import GObject.ObjectG;
import Gtk.BuilderScope;
import Gtk.BuilderScopeT;

/// Proxy object for Gtk.BuilderScope interface when a GObject has no applicable D binding
class BuilderScopeIfaceProxy : IfaceProxy, BuilderScope
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(BuilderScope);
  }

  mixin BuilderScopeT!();
}
