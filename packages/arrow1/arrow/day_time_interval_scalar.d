module arrow.day_time_interval_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.day_millisecond;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class DayTimeIntervalScalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_day_time_interval_scalar_get_type != &gidSymbolNotFound ? garrow_day_time_interval_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override DayTimeIntervalScalar self()
  {
    return this;
  }

  /** */
  this(arrow.day_millisecond.DayMillisecond value)
  {
    GArrowDayTimeIntervalScalar* _cretval;
    _cretval = garrow_day_time_interval_scalar_new(value ? cast(GArrowDayMillisecond*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.day_millisecond.DayMillisecond getValue()
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_time_interval_scalar_get_value(cast(GArrowDayTimeIntervalScalar*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.day_millisecond.DayMillisecond)(cast(GArrowDayMillisecond*)_cretval, No.Take);
    return _retval;
  }
}
