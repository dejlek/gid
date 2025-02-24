module arrow.month_day_nano_interval_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.month_day_nano;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import gobject.object;

class MonthDayNanoIntervalArray : PrimitiveArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_day_nano_interval_array_get_type != &gidSymbolNotFound ? garrow_month_day_nano_interval_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowMonthDayNanoIntervalArray* _cretval;
    _cretval = garrow_month_day_nano_interval_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  MonthDayNano getValue(long i)
  {
    GArrowMonthDayNano* _cretval;
    _cretval = garrow_month_day_nano_interval_array_get_value(cast(GArrowMonthDayNanoIntervalArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!MonthDayNano(cast(GArrowMonthDayNano*)_cretval, Yes.Take);
    return _retval;
  }

  MonthDayNano[] getValues()
  {
    GList* _cretval;
    _cretval = garrow_month_day_nano_interval_array_get_values(cast(GArrowMonthDayNanoIntervalArray*)cPtr);
    auto _retval = gListToD!(MonthDayNano, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
