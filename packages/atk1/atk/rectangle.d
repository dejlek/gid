/// Module for [Rectangle] class
module atk.rectangle;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a rectangle. Those coordinates are
    relative to the component top-level parent.
*/
class Rectangle : gobject.boxed.Boxed
{

  /**
      Create a `rectangle.Rectangle` boxed type.
      Params:
        x = X coordinate of the left side of the rectangle.
        y = Y coordinate of the top side of the rectangle.
        width = width of the rectangle.
        height = height of the rectangle.
  */
  this(int x = int.init, int y = int.init, int width = int.init, int height = int.init)
  {
    super(gMalloc(AtkRectangle.sizeof), Yes.Take);
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
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_rectangle_get_type != &gidSymbolNotFound ? atk_rectangle_get_type() : cast(GType)0;
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
      Returns: X coordinate of the left side of the rectangle.
  */
  @property int x()
  {
    return (cast(AtkRectangle*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = X coordinate of the left side of the rectangle.
  */
  @property void x(int propval)
  {
    (cast(AtkRectangle*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: Y coordinate of the top side of the rectangle.
  */
  @property int y()
  {
    return (cast(AtkRectangle*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = Y coordinate of the top side of the rectangle.
  */
  @property void y(int propval)
  {
    (cast(AtkRectangle*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: width of the rectangle.
  */
  @property int width()
  {
    return (cast(AtkRectangle*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = width of the rectangle.
  */
  @property void width(int propval)
  {
    (cast(AtkRectangle*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: height of the rectangle.
  */
  @property int height()
  {
    return (cast(AtkRectangle*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = height of the rectangle.
  */
  @property void height(int propval)
  {
    (cast(AtkRectangle*)this._cPtr).height = propval;
  }
}
