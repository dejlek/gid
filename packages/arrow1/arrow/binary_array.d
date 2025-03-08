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

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_binary_array_get_type != &gidSymbolNotFound ? garrow_binary_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowBinaryArray* _cretval;
    _cretval = garrow_binary_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets.cPtr(No.dup) : null, valueData ? cast(GArrowBuffer*)valueData.cPtr(No.dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.dup) : null, nNulls);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.buffer.Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_buffer(cast(GArrowBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getDataBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_data_buffer(cast(GArrowBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getOffsetsBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_offsets_buffer(cast(GArrowBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_binary_array_get_value(cast(GArrowBinaryArray*)cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
