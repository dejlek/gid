/// Module for [Int64Scalar] class
module arrow.int64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class Int64Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_int64_scalar_get_type != &gidSymbolNotFound ? garrow_int64_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int64Scalar self()
  {
    return this;
  }

  /** */
  this(long value)
  {
    GArrowInt64Scalar* _cretval;
    _cretval = garrow_int64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue()
  {
    long _retval;
    _retval = garrow_int64_scalar_get_value(cast(GArrowInt64Scalar*)cPtr);
    return _retval;
  }
}
