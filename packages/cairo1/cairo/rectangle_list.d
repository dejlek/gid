module cairo.rectangle_list;

import cairo.c.functions;
import cairo.c.types;
import cairo.rectangle;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
 * A data structure for holding a dynamically allocated
 * array of rectangles.
 */
class RectangleList : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(cairo_rectangle_list_t.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_rectangle_list_get_type != &gidSymbolNotFound ? cairo_gobject_rectangle_list_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property cairo.types.Status status()
  {
    return cast(cairo.types.Status)(cast(cairo_rectangle_list_t*)cPtr).status;
  }

  @property void status(cairo.types.Status propval)
  {
    (cast(cairo_rectangle_list_t*)cPtr).status = cast(cairo_status_t)propval;
  }

  @property cairo.rectangle.Rectangle rectangles()
  {
    return new cairo.rectangle.Rectangle(cast(cairo_rectangle_t*)(cast(cairo_rectangle_list_t*)cPtr).rectangles);
  }

  @property int numRectangles()
  {
    return (cast(cairo_rectangle_list_t*)cPtr).numRectangles;
  }

  @property void numRectangles(int propval)
  {
    (cast(cairo_rectangle_list_t*)cPtr).numRectangles = propval;
  }
}
