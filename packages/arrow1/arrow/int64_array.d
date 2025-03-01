module arrow.int64_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.global;
import glib.error;

class Int64Array : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_int64_array_get_type != &gidSymbolNotFound ? garrow_int64_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowInt64Array* _cretval;
    _cretval = garrow_int64_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  long getValue(long i)
  {
    long _retval;
    _retval = garrow_int64_array_get_value(cast(GArrowInt64Array*)cPtr, i);
    return _retval;
  }

  long[] getValues()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_int64_array_get_values(cast(GArrowInt64Array*)cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  long sum()
  {
    long _retval;
    GError *_err;
    _retval = garrow_int64_array_sum(cast(GArrowInt64Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
