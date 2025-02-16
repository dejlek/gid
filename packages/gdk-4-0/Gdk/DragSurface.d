module Gdk.DragSurface;

public import Gdk.DragSurfaceIfaceProxy;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;

/**
 * A `GdkDragSurface` is an interface for surfaces used during DND.
 */
interface DragSurface
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_drag_surface_get_type != &gidSymbolNotFound ? gdk_drag_surface_get_type() : cast(GType)0;
  }

  /**
   * Present drag_surface.
   * Params:
   *   width = the unconstrained drag_surface width to layout
   *   height = the unconstrained drag_surface height to layout
   * Returns: %FALSE if it failed to be presented, otherwise %TRUE.
   */
  bool present(int width, int height);
}
