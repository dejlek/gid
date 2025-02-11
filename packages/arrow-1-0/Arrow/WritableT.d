module Arrow.WritableT;

public import Arrow.WritableIfaceProxy;
public import Arrow.Types;
public import Arrow.c.functions;
public import Arrow.c.types;
public import GLib.ErrorG;
public import Gid.gid;

template WritableT()
{

  /**
   * It ensures writing all data on memory to storage.
   * Returns: %TRUE on success, %FALSE if there was an error.
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
