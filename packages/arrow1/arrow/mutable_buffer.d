module arrow.mutable_buffer;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;
import glib.bytes;
import glib.error;
import gobject.object;

class MutableBuffer : Buffer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_mutable_buffer_get_type != &gidSymbolNotFound ? garrow_mutable_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ubyte[] data)
  {
    GArrowMutableBuffer* _cretval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = garrow_mutable_buffer_new(_data, _size);
    this(_cretval, Yes.Take);
  }

  static MutableBuffer newBytes(Bytes data)
  {
    GArrowMutableBuffer* _cretval;
    _cretval = garrow_mutable_buffer_new_bytes(data ? cast(GBytes*)data.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!MutableBuffer(cast(GArrowMutableBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  alias setData = ObjectG.setData;

  bool setData(long offset, ubyte[] data)
  {
    bool _retval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = garrow_mutable_buffer_set_data(cast(GArrowMutableBuffer*)cPtr, offset, _data, _size, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  override MutableBuffer slice(long offset, long size)
  {
    GArrowMutableBuffer* _cretval;
    _cretval = garrow_mutable_buffer_slice(cast(GArrowMutableBuffer*)cPtr, offset, size);
    auto _retval = ObjectG.getDObject!MutableBuffer(cast(GArrowMutableBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
