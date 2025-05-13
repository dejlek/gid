/// Module for [FloatScalar] class
module arrow.float_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class FloatScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_float_scalar_get_type != &gidSymbolNotFound ? garrow_float_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FloatScalar self()
  {
    return this;
  }

  /** */
  this(float value)
  {
    GArrowFloatScalar* _cretval;
    _cretval = garrow_float_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  float getValue()
  {
    float _retval;
    _retval = garrow_float_scalar_get_value(cast(GArrowFloatScalar*)this._cPtr);
    return _retval;
  }
}
