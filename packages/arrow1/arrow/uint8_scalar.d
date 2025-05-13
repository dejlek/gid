/// Module for [UInt8Scalar] class
module arrow.uint8_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class UInt8Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint8_scalar_get_type != &gidSymbolNotFound ? garrow_uint8_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt8Scalar self()
  {
    return this;
  }

  /** */
  this(ubyte value)
  {
    GArrowUInt8Scalar* _cretval;
    _cretval = garrow_uint8_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ubyte getValue()
  {
    ubyte _retval;
    _retval = garrow_uint8_scalar_get_value(cast(GArrowUInt8Scalar*)this._cPtr);
    return _retval;
  }
}
