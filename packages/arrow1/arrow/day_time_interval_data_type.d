module arrow.day_time_interval_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.interval_data_type;
import arrow.types;
import gid.gid;

/** */
class DayTimeIntervalDataType : arrow.interval_data_type.IntervalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_day_time_interval_data_type_get_type != &gidSymbolNotFound ? garrow_day_time_interval_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowDayTimeIntervalDataType* _cretval;
    _cretval = garrow_day_time_interval_data_type_new();
    this(_cretval, Yes.Take);
  }
}
