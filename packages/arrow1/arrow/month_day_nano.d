module arrow.month_day_nano;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import gobject.object;

class MonthDayNano : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_day_nano_get_type != &gidSymbolNotFound ? garrow_month_day_nano_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int month, int day, long nanosecond)
  {
    GArrowMonthDayNano* _cretval;
    _cretval = garrow_month_day_nano_new(month, day, nanosecond);
    this(_cretval, Yes.Take);
  }

  bool equal(MonthDayNano otherMonthNanoDay)
  {
    bool _retval;
    _retval = garrow_month_day_nano_equal(cast(GArrowMonthDayNano*)cPtr, otherMonthNanoDay ? cast(GArrowMonthDayNano*)otherMonthNanoDay.cPtr(No.Dup) : null);
    return _retval;
  }
}
