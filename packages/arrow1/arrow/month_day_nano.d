module arrow.month_day_nano;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class MonthDayNano : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_day_nano_get_type != &gidSymbolNotFound ? garrow_month_day_nano_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override MonthDayNano self()
  {
    return this;
  }

  /** */
  this(int month, int day, long nanosecond)
  {
    GArrowMonthDayNano* _cretval;
    _cretval = garrow_month_day_nano_new(month, day, nanosecond);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.month_day_nano.MonthDayNano otherMonthNanoDay)
  {
    bool _retval;
    _retval = garrow_month_day_nano_equal(cast(GArrowMonthDayNano*)cPtr, otherMonthNanoDay ? cast(GArrowMonthDayNano*)otherMonthNanoDay.cPtr(No.Dup) : null);
    return _retval;
  }
}
