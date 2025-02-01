module Gdk.ToplevelIfaceProxy;

import GObject.ObjectG;
import Gdk.Toplevel;
import Gdk.ToplevelT;

/// Proxy object for Gdk.Toplevel interface when a GObject has no applicable D binding
class ToplevelIfaceProxy : IfaceProxy, Toplevel
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(Toplevel);
  }

  mixin ToplevelT!();
}
