module arrow.writable_mixin;

public import arrow.writable_iface_proxy;
public import arrow.c.functions;
public import arrow.c.types;
public import arrow.types;
public import gid.gid;
public import glib.error;

/** */
template WritableT()
{

  /**
      It ensures writing all data on memory to storage.
    Returns:     true on success, false if there was an error.
  */
  override bool flush()
  {
    bool _retval;
    GError *_err;
    _retval = garrow_writable_flush(cast(GArrowWritable*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  override bool write(ubyte[] data)
  {
    bool _retval;
    long _nBytes;
    if (data)
      _nBytes = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = garrow_writable_write(cast(GArrowWritable*)cPtr, _data, _nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
