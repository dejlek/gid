module arrow.readable_mixin;

public import arrow.readable_iface_proxy;
public import arrow.buffer;
public import arrow.c.functions;
public import arrow.c.types;
public import arrow.types;
public import gid.global;
public import glib.bytes;
public import glib.error;
public import gobject.object;

template ReadableT()
{

  override Buffer read(long nBytes)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_readable_read(cast(GArrowReadable*)cPtr, nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  override Bytes readBytes(long nBytes)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = garrow_readable_read_bytes(cast(GArrowReadable*)cPtr, nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
