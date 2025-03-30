/// Module for [Rectangle] class
module gdk.rectangle;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    A [gtk.types.Rectangle] data type for representing rectangles.
    
    [gtk.types.Rectangle] is identical to [cairo.rectangle.Rectangle]. Together with Cairo’s
    [cairo.region.Region] data type, these are the central types for representing
    sets of pixels.
    
    The intersection of two rectangles can be computed with
    [gdk.rectangle.Rectangle.intersect]; to find the union of two rectangles use
    [gdk.rectangle.Rectangle.union_].
    
    The [cairo.region.Region] type provided by Cairo is usually used for managing
    non-rectangular clipping of graphical operations.
    
    The Graphene library has a number of other data types for regions and
    volumes in 2D and 3D.
*/
class Rectangle : gobject.boxed.Boxed
{

  /** */
  this()
  {
    super(gMalloc(GdkRectangle.sizeof), Yes.Take);
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
    return cast(void function())gdk_rectangle_get_type != &gidSymbolNotFound ? gdk_rectangle_get_type() : cast(GType)0;
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

  @property int x()
  {
    return (cast(GdkRectangle*)cPtr).x;
  }

  @property void x(int propval)
  {
    (cast(GdkRectangle*)cPtr).x = propval;
  }

  @property int y()
  {
    return (cast(GdkRectangle*)cPtr).y;
  }

  @property void y(int propval)
  {
    (cast(GdkRectangle*)cPtr).y = propval;
  }

  @property int width()
  {
    return (cast(GdkRectangle*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(GdkRectangle*)cPtr).width = propval;
  }

  @property int height()
  {
    return (cast(GdkRectangle*)cPtr).height;
  }

  @property void height(int propval)
  {
    (cast(GdkRectangle*)cPtr).height = propval;
  }

  /**
      Returns true if rect contains the point described by `x` and `y`.
  
      Params:
        x = X coordinate
        y = Y coordinate
      Returns: true if rect contains the point
  */
  bool containsPoint(int x, int y)
  {
    bool _retval;
    _retval = gdk_rectangle_contains_point(cast(const(GdkRectangle)*)cPtr, x, y);
    return _retval;
  }

  /**
      Checks if the two given rectangles are equal.
  
      Params:
        rect2 = a [gtk.types.Rectangle]
      Returns: true if the rectangles are equal.
  */
  bool equal(gdk.rectangle.Rectangle rect2)
  {
    bool _retval;
    _retval = gdk_rectangle_equal(cast(const(GdkRectangle)*)cPtr, rect2 ? cast(const(GdkRectangle)*)rect2.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Calculates the intersection of two rectangles.
      
      It is allowed for dest to be the same as either src1 or src2.
      If the rectangles do not intersect, dest’s width and height is set
      to 0 and its x and y values are undefined. If you are only interested
      in whether the rectangles intersect, but not in the intersecting area
      itself, pass null for dest.
  
      Params:
        src2 = a [gtk.types.Rectangle]
        dest = return location for the
            intersection of src1 and src2
      Returns: true if the rectangles intersect.
  */
  bool intersect(gdk.rectangle.Rectangle src2, out gdk.rectangle.Rectangle dest)
  {
    bool _retval;
    GdkRectangle _dest;
    _retval = gdk_rectangle_intersect(cast(const(GdkRectangle)*)cPtr, src2 ? cast(const(GdkRectangle)*)src2.cPtr(No.Dup) : null, &_dest);
    dest = new gdk.rectangle.Rectangle(cast(void*)&_dest, No.Take);
    return _retval;
  }

  /**
      Calculates the union of two rectangles.
      
      The union of rectangles src1 and src2 is the smallest rectangle which
      includes both src1 and src2 within it. It is allowed for dest to be
      the same as either src1 or src2.
      
      Note that this function does not ignore 'empty' rectangles (ie. with
      zero width or height).
  
      Params:
        src2 = a [gtk.types.Rectangle]
        dest = return location for the union of src1 and src2
  */
  void union_(gdk.rectangle.Rectangle src2, out gdk.rectangle.Rectangle dest)
  {
    GdkRectangle _dest;
    gdk_rectangle_union(cast(const(GdkRectangle)*)cPtr, src2 ? cast(const(GdkRectangle)*)src2.cPtr(No.Dup) : null, &_dest);
    dest = new gdk.rectangle.Rectangle(cast(void*)&_dest, No.Take);
  }
}
