module Arrow.MonthDayNanoIntervalArray;

import Arrow.Buffer;
import Arrow.MonthDayNano;
import Arrow.PrimitiveArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class MonthDayNanoIntervalArray : PrimitiveArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_month_day_nano_interval_array_get_type();
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
