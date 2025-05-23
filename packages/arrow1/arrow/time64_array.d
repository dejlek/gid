/// Module for [Time64Array] class
module arrow.time64_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.time64_data_type;
import arrow.types;
import gid.gid;

/** */
class Time64Array : arrow.numeric_array.NumericArray
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time64_array_get_type != &gidSymbolNotFound ? garrow_time64_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time64Array self()
  {
    return this;
  }

  /** */
  this(arrow.time64_data_type.Time64DataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowTime64Array* _cretval;
    _cretval = garrow_time64_array_new(dataType ? cast(GArrowTime64DataType*)dataType.cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue(long i)
  {
    long _retval;
    _retval = garrow_time64_array_get_value(cast(GArrowTime64Array*)cPtr, i);
    return _retval;
  }

  /** */
  long[] getValues()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_time64_array_get_values(cast(GArrowTime64Array*)cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }
}
