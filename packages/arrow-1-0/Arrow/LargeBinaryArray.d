module Arrow.LargeBinaryArray;

import Arrow.Array;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import GObject.ObjectG;
import Gid.gid;

class LargeBinaryArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_binary_array_get_type != &gidSymbolNotFound ? garrow_large_binary_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer valueOffsets, Buffer valueData, Buffer nullBitmap, long nNulls)
  {
    GArrowLargeBinaryArray* _cretval;
    _cretval = garrow_large_binary_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets.cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_large_binary_array_get_buffer(cast(GArrowLargeBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer getDataBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_large_binary_array_get_data_buffer(cast(GArrowLargeBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer getOffsetsBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_large_binary_array_get_offsets_buffer(cast(GArrowLargeBinaryArray*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_large_binary_array_get_value(cast(GArrowLargeBinaryArray*)cPtr, i);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
