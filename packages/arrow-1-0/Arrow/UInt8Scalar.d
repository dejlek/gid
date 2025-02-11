module Arrow.UInt8Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt8Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint8_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ubyte value)
  {
    GArrowUInt8Scalar* _cretval;
    _cretval = garrow_uint8_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  ubyte getValue()
  {
    ubyte _retval;
    _retval = garrow_uint8_scalar_get_value(cast(GArrowUInt8Scalar*)cPtr);
    return _retval;
  }
}
