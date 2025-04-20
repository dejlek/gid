/// Module for [UInt64Array] class
module arrow.uint64_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class UInt64Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_uint64_array_get_type != &gidSymbolNotFound ? garrow_uint64_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt64Array self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowUInt64Array* _cretval;
    _cretval = garrow_uint64_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  ulong getValue(long i)
  {
    ulong _retval;
    _retval = garrow_uint64_array_get_value(cast(GArrowUInt64Array*)cPtr, i);
    return _retval;
  }

  /** */
  ulong[] getValues()
  {
    const(ulong)* _cretval;
    long _cretlength;
    _cretval = garrow_uint64_array_get_values(cast(GArrowUInt64Array*)cPtr, &_cretlength);
    ulong[] _retval;

    if (_cretval)
    {
      _retval = cast(ulong[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /** */
  ulong sum()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_uint64_array_sum(cast(GArrowUInt64Array*)cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
