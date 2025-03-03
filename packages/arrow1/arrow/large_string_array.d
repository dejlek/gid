module arrow.large_string_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.large_binary_array;
import arrow.types;
import gid.gid;

class LargeStringArray : arrow.large_binary_array.LargeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_string_array_get_type != &gidSymbolNotFound ? garrow_large_string_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowLargeStringArray* _cretval;
    _cretval = garrow_large_string_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets.cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  string getString(long i)
  {
    char* _cretval;
    _cretval = garrow_large_string_array_get_string(cast(GArrowLargeStringArray*)cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
