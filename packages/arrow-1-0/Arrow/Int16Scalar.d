module Arrow.Int16Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int16Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_int16_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(short value)
  {
    GArrowInt16Scalar* _cretval;
    _cretval = garrow_int16_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  short getValue()
  {
    short _retval;
    _retval = garrow_int16_scalar_get_value(cast(GArrowInt16Scalar*)cPtr);
    return _retval;
  }
}
