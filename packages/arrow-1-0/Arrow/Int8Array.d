module Arrow.Int8Array;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Int8Array : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_int8_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowInt8Array* _cretval;
    _cretval = garrow_int8_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  byte getValue(long i)
  {
    byte _retval;
    _retval = garrow_int8_array_get_value(cast(GArrowInt8Array*)cPtr, i);
    return _retval;
  }

  byte[] getValues()
  {
    const(byte)* _cretval;
    long _cretlength;
    _cretval = garrow_int8_array_get_values(cast(GArrowInt8Array*)cPtr, &_cretlength);
    byte[] _retval;

    if (_cretval)
    {
      _retval = cast(byte[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  long sum()
  {
    long _retval;
    GError *_err;
    _retval = garrow_int8_array_sum(cast(GArrowInt8Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
