module Arrow.DoubleScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DoubleScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_double_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(double value)
  {
    GArrowDoubleScalar* _cretval;
    _cretval = garrow_double_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  double getValue()
  {
    double _retval;
    _retval = garrow_double_scalar_get_value(cast(GArrowDoubleScalar*)cPtr);
    return _retval;
  }
}
