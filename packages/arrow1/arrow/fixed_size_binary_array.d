/// Module for [FixedSizeBinaryArray] class
module arrow.fixed_size_binary_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import glib.bytes;

/** */
class FixedSizeBinaryArray : arrow.primitive_array.PrimitiveArray
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
    return cast(void function())garrow_fixed_size_binary_array_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryArray self()
  {
    return this;
  }

  /** */
  this(arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowFixedSizeBinaryArray* _cretval;
    _cretval = garrow_fixed_size_binary_array_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType.cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  int getByteWidth()
  {
    int _retval;
    _retval = garrow_fixed_size_binary_array_get_byte_width(cast(GArrowFixedSizeBinaryArray*)cPtr);
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_fixed_size_binary_array_get_value(cast(GArrowFixedSizeBinaryArray*)cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValuesBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_fixed_size_binary_array_get_values_bytes(cast(GArrowFixedSizeBinaryArray*)cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
