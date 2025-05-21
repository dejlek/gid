/// Module for [HalfFloatScalar] class
module arrow.half_float_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class HalfFloatScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_half_float_scalar_get_type != &gidSymbolNotFound ? garrow_half_float_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HalfFloatScalar self()
  {
    return this;
  }

  /** */
  this(ushort value)
  {
    GArrowHalfFloatScalar* _cretval;
    _cretval = garrow_half_float_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue()
  {
    ushort _retval;
    _retval = garrow_half_float_scalar_get_value(cast(GArrowHalfFloatScalar*)this._cPtr);
    return _retval;
  }
}
