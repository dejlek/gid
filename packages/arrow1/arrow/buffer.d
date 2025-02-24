module arrow.buffer;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

class Buffer : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_buffer_get_type != &gidSymbolNotFound ? garrow_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ubyte[] data)
  {
    GArrowBuffer* _cretval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = garrow_buffer_new(_data, _size);
    this(_cretval, Yes.Take);
  }

  static Buffer newBytes(Bytes data)
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_new_bytes(data ? cast(GBytes*)data.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer copy(long start, long size)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_buffer_copy(cast(GArrowBuffer*)cPtr, start, size, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  bool equal(Buffer otherBuffer)
  {
    bool _retval;
    _retval = garrow_buffer_equal(cast(GArrowBuffer*)cPtr, otherBuffer ? cast(GArrowBuffer*)otherBuffer.cPtr(No.Dup) : null);
    return _retval;
  }

  bool equalNBytes(Buffer otherBuffer, long nBytes)
  {
    bool _retval;
    _retval = garrow_buffer_equal_n_bytes(cast(GArrowBuffer*)cPtr, otherBuffer ? cast(GArrowBuffer*)otherBuffer.cPtr(No.Dup) : null, nBytes);
    return _retval;
  }

  long getCapacity()
  {
    long _retval;
    _retval = garrow_buffer_get_capacity(cast(GArrowBuffer*)cPtr);
    return _retval;
  }

  alias getData = ObjectG.getData;

  Bytes getData()
  {
    GBytes* _cretval;
    _cretval = garrow_buffer_get_data(cast(GArrowBuffer*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  Bytes getMutableData()
  {
    GBytes* _cretval;
    _cretval = garrow_buffer_get_mutable_data(cast(GArrowBuffer*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  Buffer getParent()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_get_parent(cast(GArrowBuffer*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  long getSize()
  {
    long _retval;
    _retval = garrow_buffer_get_size(cast(GArrowBuffer*)cPtr);
    return _retval;
  }

  bool isMutable()
  {
    bool _retval;
    _retval = garrow_buffer_is_mutable(cast(GArrowBuffer*)cPtr);
    return _retval;
  }

  Buffer slice(long offset, long size)
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_slice(cast(GArrowBuffer*)cPtr, offset, size);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
