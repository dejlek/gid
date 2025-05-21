/// Module for [UInt64Scalar] class
module arrow.uint64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class UInt64Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint64_scalar_get_type != &gidSymbolNotFound ? garrow_uint64_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt64Scalar self()
  {
    return this;
  }

  /** */
  this(ulong value)
  {
    GArrowUInt64Scalar* _cretval;
    _cretval = garrow_uint64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ulong getValue()
  {
    ulong _retval;
    _retval = garrow_uint64_scalar_get_value(cast(GArrowUInt64Scalar*)this._cPtr);
    return _retval;
  }
}
