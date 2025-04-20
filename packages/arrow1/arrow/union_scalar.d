/// Module for [UnionScalar] class
module arrow.union_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class UnionScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_union_scalar_get_type != &gidSymbolNotFound ? garrow_union_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UnionScalar self()
  {
    return this;
  }

  /** */
  byte getTypeCode()
  {
    byte _retval;
    _retval = garrow_union_scalar_get_type_code(cast(GArrowUnionScalar*)cPtr);
    return _retval;
  }

  /** */
  arrow.scalar.Scalar getValue()
  {
    GArrowScalar* _cretval;
    _cretval = garrow_union_scalar_get_value(cast(GArrowUnionScalar*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(arrow.scalar.Scalar)(cast(GArrowScalar*)_cretval, No.Take);
    return _retval;
  }
}
