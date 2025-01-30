module Gdk.DragSurfaceIfaceProxy;

import GObject.ObjectG;
import Gdk.DragSurface;
import Gdk.DragSurfaceT;

/// Proxy object for Gdk.DragSurface interface when a GObject has no applicable D binding
class DragSurfaceIfaceProxy : IfaceProxy, DragSurface
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
    return typeid(DragSurface);
  }

  mixin DragSurfaceT!();
}
