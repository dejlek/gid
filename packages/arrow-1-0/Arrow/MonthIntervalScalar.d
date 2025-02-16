module Arrow.MonthIntervalScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MonthIntervalScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_interval_scalar_get_type != &gidSymbolNotFound ? garrow_month_interval_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int value)
  {
    GArrowMonthIntervalScalar* _cretval;
    _cretval = garrow_month_interval_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  int getValue()
  {
    int _retval;
    _retval = garrow_month_interval_scalar_get_value(cast(GArrowMonthIntervalScalar*)cPtr);
    return _retval;
  }
}
