module Arrow.MonthDayNanoIntervalDataType;

import Arrow.IntervalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MonthDayNanoIntervalDataType : IntervalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_day_nano_interval_data_type_get_type != &gidSymbolNotFound ? garrow_month_day_nano_interval_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowMonthDayNanoIntervalDataType* _cretval;
    _cretval = garrow_month_day_nano_interval_data_type_new();
    this(_cretval, Yes.Take);
  }
}
