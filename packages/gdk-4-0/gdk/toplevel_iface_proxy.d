module gdk.toplevel_iface_proxy;

import gobject.object;
import gdk.toplevel;
import gdk.toplevel_mixin;

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
