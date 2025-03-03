module gdk.drag_surface_size;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;

/**
 * The `GdkDragSurfaceSize` struct contains information that is useful
 * to compute the size of a drag surface.
 */
class DragSurfaceSize
{
  GdkDragSurfaceSize* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.DragSurfaceSize");

    cInstancePtr = cast(GdkDragSurfaceSize*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
   * Sets the size the drag surface prefers to be resized to.
   * Params:
   *   width = the width
   *   height = the height
   */
  void setSize(int width, int height)
  {
    gdk_drag_surface_size_set_size(cast(GdkDragSurfaceSize*)cPtr, width, height);
  }
}
