module arrow.uint16_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class UInt16Array : arrow.numeric_array.NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_uint16_array_get_type != &gidSymbolNotFound ? garrow_uint16_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override UInt16Array self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowUInt16Array* _cretval;
    _cretval = garrow_uint16_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue(long i)
  {
    ushort _retval;
    _retval = garrow_uint16_array_get_value(cast(GArrowUInt16Array*)cPtr, i);
    return _retval;
  }

  /** */
  ushort[] getValues()
  {
    const(ushort)* _cretval;
    long _cretlength;
    _cretval = garrow_uint16_array_get_values(cast(GArrowUInt16Array*)cPtr, &_cretlength);
    ushort[] _retval;

    if (_cretval)
    {
      _retval = cast(ushort[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /** */
  ulong sum()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_uint16_array_sum(cast(GArrowUInt16Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
