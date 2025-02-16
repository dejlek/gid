module Arrow.FixedSizeBinaryArray;

import Arrow.Buffer;
import Arrow.FixedSizeBinaryDataType;
import Arrow.PrimitiveArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import Gid.gid;

class FixedSizeBinaryArray : PrimitiveArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_fixed_size_binary_array_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(FixedSizeBinaryDataType dataType, long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowFixedSizeBinaryArray* _cretval;
    _cretval = garrow_fixed_size_binary_array_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType.cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  int getByteWidth()
  {
    int _retval;
    _retval = garrow_fixed_size_binary_array_get_byte_width(cast(GArrowFixedSizeBinaryArray*)cPtr);
    return _retval;
  }

  Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_fixed_size_binary_array_get_value(cast(GArrowFixedSizeBinaryArray*)cPtr, i);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  Bytes getValuesBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_fixed_size_binary_array_get_values_bytes(cast(GArrowFixedSizeBinaryArray*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
