module arrow.int8_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

class Int8Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_int8_scalar_get_type != &gidSymbolNotFound ? garrow_int8_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(byte value)
  {
    GArrowInt8Scalar* _cretval;
    _cretval = garrow_int8_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  byte getValue()
  {
    byte _retval;
    _retval = garrow_int8_scalar_get_value(cast(GArrowInt8Scalar*)cPtr);
    return _retval;
  }
}
