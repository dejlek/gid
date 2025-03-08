module arrow.day_millisecond;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class DayMillisecond : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_day_millisecond_get_type != &gidSymbolNotFound ? garrow_day_millisecond_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(int day, int millisecond)
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_millisecond_new(day, millisecond);
    this(_cretval, Yes.take);
  }

  /** */
  bool equal(arrow.day_millisecond.DayMillisecond otherDayMillisecond)
  {
    bool _retval;
    _retval = garrow_day_millisecond_equal(cast(GArrowDayMillisecond*)cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.day_millisecond.DayMillisecond otherDayMillisecond)
  {
    bool _retval;
    _retval = garrow_day_millisecond_less_than(cast(GArrowDayMillisecond*)cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond.cPtr(No.dup) : null);
    return _retval;
  }
}
