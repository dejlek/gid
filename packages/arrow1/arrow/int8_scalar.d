/// Module for [Int8Scalar] class
module arrow.int8_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class Int8Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_int8_scalar_get_type != &gidSymbolNotFound ? garrow_int8_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int8Scalar self()
  {
    return this;
  }

  /** */
  this(byte value)
  {
    GArrowInt8Scalar* _cretval;
    _cretval = garrow_int8_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  byte getValue()
  {
    byte _retval;
    _retval = garrow_int8_scalar_get_value(cast(GArrowInt8Scalar*)this._cPtr);
    return _retval;
  }
}
