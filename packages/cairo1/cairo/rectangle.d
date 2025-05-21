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

  /**
      Create a `rectangle.Rectangle` boxed type.
      Params:
        x = X coordinate of the left side of the rectangle
        y = Y coordinate of the top side of the rectangle
        width = width of the rectangle
        height = height of the rectangle
  */
  this(double x = 0.0, double y = 0.0, double width = 0.0, double height = 0.0)
  {
    super(gMalloc(cairo_rectangle_t.sizeof), Yes.Take);
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_rectangle_get_type != &gidSymbolNotFound ? cairo_gobject_rectangle_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Rectangle self()
  {
    return this;
  }

  /**
      Get `x` field.
      Returns: X coordinate of the left side of the rectangle
  */
  @property double x()
  {
    return (cast(cairo_rectangle_t*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = X coordinate of the left side of the rectangle
  */
  @property void x(double propval)
  {
    (cast(cairo_rectangle_t*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: Y coordinate of the top side of the rectangle
  */
  @property double y()
  {
    return (cast(cairo_rectangle_t*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = Y coordinate of the top side of the rectangle
  */
  @property void y(double propval)
  {
    (cast(cairo_rectangle_t*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: width of the rectangle
  */
  @property double width()
  {
    return (cast(cairo_rectangle_t*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = width of the rectangle
  */
  @property void width(double propval)
  {
    (cast(cairo_rectangle_t*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: height of the rectangle
  */
  @property double height()
  {
    return (cast(cairo_rectangle_t*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = height of the rectangle
  */
  @property void height(double propval)
  {
    (cast(cairo_rectangle_t*)this._cPtr).height = propval;
  }
}
