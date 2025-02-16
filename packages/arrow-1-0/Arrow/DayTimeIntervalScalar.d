module Arrow.DayTimeIntervalScalar;

import Arrow.DayMillisecond;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class DayTimeIntervalScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_day_time_interval_scalar_get_type != &gidSymbolNotFound ? garrow_day_time_interval_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DayMillisecond value)
  {
    GArrowDayTimeIntervalScalar* _cretval;
    _cretval = garrow_day_time_interval_scalar_new(value ? cast(GArrowDayMillisecond*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  DayMillisecond getValue()
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_time_interval_scalar_get_value(cast(GArrowDayTimeIntervalScalar*)cPtr);
    auto _retval = ObjectG.getDObject!DayMillisecond(cast(GArrowDayMillisecond*)_cretval, No.Take);
    return _retval;
  }
}
