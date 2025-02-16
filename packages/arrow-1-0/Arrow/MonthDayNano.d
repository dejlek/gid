module Arrow.MonthDayNano;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class MonthDayNano : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
