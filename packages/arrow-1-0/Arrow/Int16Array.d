module Arrow.Int16Array;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Int16Array : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_int16_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowInt16Array* _cretval;
    _cretval = garrow_int16_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  short getValue(long i)
  {
    short _retval;
    _retval = garrow_int16_array_get_value(cast(GArrowInt16Array*)cPtr, i);
    return _retval;
  }

  short[] getValues()
  {
    const(short)* _cretval;
    long _cretlength;
    _cretval = garrow_int16_array_get_values(cast(GArrowInt16Array*)cPtr, &_cretlength);
    short[] _retval;

    if (_cretval)
    {
      _retval = cast(short[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  long sum()
  {
    long _retval;
    GError *_err;
    _retval = garrow_int16_array_sum(cast(GArrowInt16Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
