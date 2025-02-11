module Arrow.Int8Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int8Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_int8_scalar_get_type();
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
