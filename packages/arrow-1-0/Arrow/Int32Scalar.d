module Arrow.Int32Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int32Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_int32_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int value)
  {
    GArrowInt32Scalar* _cretval;
    _cretval = garrow_int32_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  int getValue()
  {
    int _retval;
    _retval = garrow_int32_scalar_get_value(cast(GArrowInt32Scalar*)cPtr);
    return _retval;
  }
}
