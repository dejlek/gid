/// Module for [RectangleList] class
module cairo.rectangle_list;

import cairo.c.functions;
import cairo.c.types;
import cairo.rectangle;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a dynamically allocated
    array of rectangles.
*/
class RectangleList : gobject.boxed.Boxed
{

  /**
      Create a `rectangle_list.RectangleList` boxed type.
      Params:
        status = Error status of the rectangle list
        rectangles = Array containing the rectangles
        numRectangles = Number of rectangles in this list
  */
  this(cairo.types.Status status = cairo.types.Status.init, cairo.rectangle.Rectangle rectangles = cairo.rectangle.Rectangle.init, int numRectangles = int.init)
  {
    super(gMalloc(cairo_rectangle_list_t.sizeof), Yes.Take);
    this.status = status;
    this.rectangles = rectangles;
    this.numRectangles = numRectangles;
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
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
    return cast(void function())cairo_gobject_rectangle_list_get_type != &gidSymbolNotFound ? cairo_gobject_rectangle_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RectangleList self()
  {
    return this;
  }

  /**
      Get `status` field.
      Returns: Error status of the rectangle list
  */
  @property cairo.types.Status status()
  {
    return cast(cairo.types.Status)(cast(cairo_rectangle_list_t*)this._cPtr).status;
  }

  /**
      Set `status` field.
      Params:
        propval = Error status of the rectangle list
  */
  @property void status(cairo.types.Status propval)
  {
    (cast(cairo_rectangle_list_t*)this._cPtr).status = cast(cairo_status_t)propval;
  }

  /**
      Get `rectangles` field.
      Returns: Array containing the rectangles
  */
  @property cairo.rectangle.Rectangle rectangles()
  {
    return cToD!(cairo.rectangle.Rectangle)(cast(void*)(cast(cairo_rectangle_list_t*)this._cPtr).rectangles);
  }

  /**
      Set `rectangles` field.
      Params:
        propval = Array containing the rectangles
  */
  @property void rectangles(cairo.rectangle.Rectangle propval)
  {
    cValueFree!(cairo.rectangle.Rectangle)(cast(void*)(cast(cairo_rectangle_list_t*)this._cPtr).rectangles);
    dToC(propval, cast(void*)&(cast(cairo_rectangle_list_t*)this._cPtr).rectangles);
  }

  /**
      Get `numRectangles` field.
      Returns: Number of rectangles in this list
  */
  @property int numRectangles()
  {
    return (cast(cairo_rectangle_list_t*)this._cPtr).numRectangles;
  }

  /**
      Set `numRectangles` field.
      Params:
        propval = Number of rectangles in this list
  */
  @property void numRectangles(int propval)
  {
    (cast(cairo_rectangle_list_t*)this._cPtr).numRectangles = propval;
  }
}
