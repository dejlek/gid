module Arrow.UInt64Array;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class UInt64Array : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint64_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowUInt64Array* _cretval;
    _cretval = garrow_uint64_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  ulong getValue(long i)
  {
    ulong _retval;
    _retval = garrow_uint64_array_get_value(cast(GArrowUInt64Array*)cPtr, i);
    return _retval;
  }

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

  ulong sum()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_uint64_array_sum(cast(GArrowUInt64Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
