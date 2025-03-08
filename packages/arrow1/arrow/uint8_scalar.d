module arrow.uint8_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class UInt8Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_uint8_scalar_get_type != &gidSymbolNotFound ? garrow_uint8_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(ubyte value)
  {
    GArrowUInt8Scalar* _cretval;
    _cretval = garrow_uint8_scalar_new(value);
    this(_cretval, Yes.take);
  }

  /** */
  ubyte getValue()
  {
    ubyte _retval;
    _retval = garrow_uint8_scalar_get_value(cast(GArrowUInt8Scalar*)cPtr);
    return _retval;
  }
}
