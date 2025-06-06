/// Module for [UInt16Scalar] class
module arrow.uint16_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class UInt16Scalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_uint16_scalar_get_type != &gidSymbolNotFound ? garrow_uint16_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt16Scalar self()
  {
    return this;
  }

  /** */
  this(ushort value)
  {
    GArrowUInt16Scalar* _cretval;
    _cretval = garrow_uint16_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue()
  {
    ushort _retval;
    _retval = garrow_uint16_scalar_get_value(cast(GArrowUInt16Scalar*)this._cPtr);
    return _retval;
  }
}
