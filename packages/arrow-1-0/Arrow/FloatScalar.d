module Arrow.FloatScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FloatScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_float_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(float value)
  {
    GArrowFloatScalar* _cretval;
    _cretval = garrow_float_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  float getValue()
  {
    float _retval;
    _retval = garrow_float_scalar_get_value(cast(GArrowFloatScalar*)cPtr);
    return _retval;
  }
}
