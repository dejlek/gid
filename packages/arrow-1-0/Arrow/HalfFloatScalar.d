module Arrow.HalfFloatScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class HalfFloatScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_half_float_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ushort value)
  {
    GArrowHalfFloatScalar* _cretval;
    _cretval = garrow_half_float_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  ushort getValue()
  {
    ushort _retval;
    _retval = garrow_half_float_scalar_get_value(cast(GArrowHalfFloatScalar*)cPtr);
    return _retval;
  }
}
