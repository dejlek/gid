/// Module for [UInt32Scalar] class
module arrow.uint32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class UInt32Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint32_scalar_get_type != &gidSymbolNotFound ? garrow_uint32_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt32Scalar self()
  {
    return this;
  }

  /** */
  this(uint value)
  {
    GArrowUInt32Scalar* _cretval;
    _cretval = garrow_uint32_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  uint getValue()
  {
    uint _retval;
    _retval = garrow_uint32_scalar_get_value(cast(GArrowUInt32Scalar*)this._cPtr);
    return _retval;
  }
}
