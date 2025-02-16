module Arrow.HalfFloatArray;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class HalfFloatArray : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_half_float_array_get_type != &gidSymbolNotFound ? garrow_half_float_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowHalfFloatArray* _cretval;
    _cretval = garrow_half_float_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  ushort getValue(long i)
  {
    ushort _retval;
    _retval = garrow_half_float_array_get_value(cast(GArrowHalfFloatArray*)cPtr, i);
    return _retval;
  }

  ushort[] getValues()
  {
    const(ushort)* _cretval;
    long _cretlength;
    _cretval = garrow_half_float_array_get_values(cast(GArrowHalfFloatArray*)cPtr, &_cretlength);
    ushort[] _retval;

    if (_cretval)
    {
      _retval = cast(ushort[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }
}
