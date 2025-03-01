module arrow.month_interval_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.global;

class MonthIntervalArray : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_interval_array_get_type != &gidSymbolNotFound ? garrow_month_interval_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowMonthIntervalArray* _cretval;
    _cretval = garrow_month_interval_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  int getValue(long i)
  {
    int _retval;
    _retval = garrow_month_interval_array_get_value(cast(GArrowMonthIntervalArray*)cPtr, i);
    return _retval;
  }

  int[] getValues()
  {
    const(int)* _cretval;
    long _cretlength;
    _cretval = garrow_month_interval_array_get_values(cast(GArrowMonthIntervalArray*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }
}
