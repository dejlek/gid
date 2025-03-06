module arrow.binary_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.object;

/** */
class BinaryArray : arrow.array.Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_binary_array_get_type != &gidSymbolNotFound ? garrow_binary_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowBinaryArray* _cretval;
    _cretval = garrow_binary_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets.cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.buffer.Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_buffer(cast(GArrowBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getDataBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_data_buffer(cast(GArrowBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getOffsetsBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_offsets_buffer(cast(GArrowBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_binary_array_get_value(cast(GArrowBinaryArray*)cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
