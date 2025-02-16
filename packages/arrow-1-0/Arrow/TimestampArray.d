module Arrow.TimestampArray;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.TimestampDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TimestampArray : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_array_get_type != &gidSymbolNotFound ? garrow_timestamp_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(TimestampDataType dataType, long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowTimestampArray* _cretval;
    _cretval = garrow_timestamp_array_new(dataType ? cast(GArrowTimestampDataType*)dataType.cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  long getValue(long i)
  {
    long _retval;
    _retval = garrow_timestamp_array_get_value(cast(GArrowTimestampArray*)cPtr, i);
    return _retval;
  }

  long[] getValues()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_timestamp_array_get_values(cast(GArrowTimestampArray*)cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }
}
