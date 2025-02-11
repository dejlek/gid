module Arrow.MonthIntervalDataType;

import Arrow.IntervalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MonthIntervalDataType : IntervalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_month_interval_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowMonthIntervalDataType* _cretval;
    _cretval = garrow_month_interval_data_type_new();
    this(_cretval, Yes.Take);
  }
}
