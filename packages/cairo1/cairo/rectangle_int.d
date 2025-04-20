/// Module for [RectangleInt] class
module cairo.rectangle_int;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a rectangle with integer coordinates.
*/
class RectangleInt : gobject.boxed.Boxed
{

  /**
      Create a `rectangle_int.RectangleInt` boxed type.
      Params:
        x = X coordinate of the left side of the rectangle
        y = Y coordinate of the top side of the rectangle
        width = width of the rectangle
        height = height of the rectangle
  */
  this(int x = int.init, int y = int.init, int width = int.init, int height = int.init)
  {
    super(gMalloc(cairo_rectangle_int_t.sizeof), Yes.Take);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
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
    return cast(void function())cairo_gobject_rectangle_int_get_type != &gidSymbolNotFound ? cairo_gobject_rectangle_int_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RectangleInt self()
  {
    return this;
  }

  /**
      Get `x` field.
      Returns: X coordinate of the left side of the rectangle
  */
  @property int x()
  {
    return (cast(cairo_rectangle_int_t*)cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = X coordinate of the left side of the rectangle
  */
  @property void x(int propval)
  {
    (cast(cairo_rectangle_int_t*)cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: Y coordinate of the top side of the rectangle
  */
  @property int y()
  {
    return (cast(cairo_rectangle_int_t*)cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = Y coordinate of the top side of the rectangle
  */
  @property void y(int propval)
  {
    (cast(cairo_rectangle_int_t*)cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: width of the rectangle
  */
  @property int width()
  {
    return (cast(cairo_rectangle_int_t*)cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = width of the rectangle
  */
  @property void width(int propval)
  {
    (cast(cairo_rectangle_int_t*)cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: height of the rectangle
  */
  @property int height()
  {
    return (cast(cairo_rectangle_int_t*)cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = height of the rectangle
  */
  @property void height(int propval)
  {
    (cast(cairo_rectangle_int_t*)cPtr).height = propval;
  }
}
