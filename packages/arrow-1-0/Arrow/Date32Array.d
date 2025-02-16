module Arrow.Date32Array;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Date32Array : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_date32_array_get_type != &gidSymbolNotFound ? garrow_date32_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowDate32Array* _cretval;
    _cretval = garrow_date32_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  int getValue(long i)
  {
    int _retval;
    _retval = garrow_date32_array_get_value(cast(GArrowDate32Array*)cPtr, i);
    return _retval;
  }

  int[] getValues()
  {
    const(int)* _cretval;
    long _cretlength;
    _cretval = garrow_date32_array_get_values(cast(GArrowDate32Array*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }
}
