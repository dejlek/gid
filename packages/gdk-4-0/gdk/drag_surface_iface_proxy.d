module gdk.drag_surface_iface_proxy;

import gobject.object;
import gdk.drag_surface;
import gdk.drag_surface_mixin;

/// Proxy object for Gdk.DragSurface interface when a GObject has no applicable D binding
class DragSurfaceIfaceProxy : IfaceProxy, DragSurface
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DragSurface);
  }

  mixin DragSurfaceT!();
}
