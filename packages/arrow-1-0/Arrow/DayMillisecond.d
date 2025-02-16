module Arrow.DayMillisecond;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class DayMillisecond : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_day_millisecond_get_type != &gidSymbolNotFound ? garrow_day_millisecond_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int day, int millisecond)
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_millisecond_new(day, millisecond);
    this(_cretval, Yes.Take);
  }

  bool equal(DayMillisecond otherDayMillisecond)
  {
    bool _retval;
    _retval = garrow_day_millisecond_equal(cast(GArrowDayMillisecond*)cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond.cPtr(No.Dup) : null);
    return _retval;
  }

  bool lessThan(DayMillisecond otherDayMillisecond)
  {
    bool _retval;
    _retval = garrow_day_millisecond_less_than(cast(GArrowDayMillisecond*)cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond.cPtr(No.Dup) : null);
    return _retval;
  }
}
