module gdk.paintable_iface_proxy;

import gobject.object;
import gdk.paintable;
import gdk.paintable_mixin;

/// Proxy object for Gdk.Paintable interface when a GObject has no applicable D binding
class PaintableIfaceProxy : IfaceProxy, gdk.paintable.Paintable
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(gdk.paintable.Paintable);
  }

  mixin PaintableT!();
}
