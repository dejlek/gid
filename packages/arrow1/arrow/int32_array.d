/// Module for [Int32Array] class
module arrow.int32_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Int32Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_int32_array_get_type != &gidSymbolNotFound ? garrow_int32_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Int32Array self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowInt32Array* _cretval;
    _cretval = garrow_int32_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue(long i)
  {
    int _retval;
    _retval = garrow_int32_array_get_value(cast(GArrowInt32Array*)cPtr, i);
    return _retval;
  }

  /** */
  int[] getValues()
  {
    const(int)* _cretval;
    long _cretlength;
    _cretval = garrow_int32_array_get_values(cast(GArrowInt32Array*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /** */
  long sum()
  {
    long _retval;
    GError *_err;
    _retval = garrow_int32_array_sum(cast(GArrowInt32Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
