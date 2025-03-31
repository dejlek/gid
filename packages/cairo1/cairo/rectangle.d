/// Module for [Rectangle] class
module cairo.rectangle;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a rectangle.
*/
class Rectangle : gobject.boxed.Boxed
{

  /** */
  this()
  {
    super(gMalloc(cairo_rectangle_t.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_rectangle_get_type != &gidSymbolNotFound ? cairo_gobject_rectangle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Rectangle self()
  {
    return this;
  }

  @property double x()
  {
    return (cast(cairo_rectangle_t*)cPtr).x;
  }

  @property void x(double propval)
  {
    (cast(cairo_rectangle_t*)cPtr).x = propval;
  }

  @property double y()
  {
    return (cast(cairo_rectangle_t*)cPtr).y;
  }

  @property void y(double propval)
  {
    (cast(cairo_rectangle_t*)cPtr).y = propval;
  }

  @property double width()
  {
    return (cast(cairo_rectangle_t*)cPtr).width;
  }

  @property void width(double propval)
  {
    (cast(cairo_rectangle_t*)cPtr).width = propval;
  }

  @property double height()
  {
    return (cast(cairo_rectangle_t*)cPtr).height;
  }

  @property void height(double propval)
  {
    (cast(cairo_rectangle_t*)cPtr).height = propval;
  }
}
