/// Module for [GeometricPoint] class
module gda.geometric_point;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import gobject.boxed;

/** */
class GeometricPoint : gobject.boxed.Boxed
{

  /**
      Create a `geometric_point.GeometricPoint` boxed type.
      Params:
        x = 
        y = 
  */
  this(double x = 0.0, double y = 0.0)
  {
    super(gMalloc(GdaGeometricPoint.sizeof), Yes.Take);
    this.x = x;
    this.y = y;
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
    return cast(void function())gda_geometricpoint_get_type != &gidSymbolNotFound ? gda_geometricpoint_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GeometricPoint self()
  {
    return this;
  }

  /** */
  @property double x()
  {
    return (cast(GdaGeometricPoint*)this._cPtr).x;
  }

  /** */
  @property void x(double propval)
  {
    (cast(GdaGeometricPoint*)this._cPtr).x = propval;
  }

  /** */
  @property double y()
  {
    return (cast(GdaGeometricPoint*)this._cPtr).y;
  }

  /** */
  @property void y(double propval)
  {
    (cast(GdaGeometricPoint*)this._cPtr).y = propval;
  }

  /** */
  static void* copy(void* boxed = null)
  {
    auto _retval = gda_geometricpoint_copy(boxed);
    return _retval;
  }

  /** */
  static void free(void* boxed = null)
  {
    gda_geometricpoint_free(boxed);
  }
}
