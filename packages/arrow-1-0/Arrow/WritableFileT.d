module Arrow.WritableFileT;

public import Arrow.WritableFileIfaceProxy;
public import Arrow.Types;
public import Arrow.c.functions;
public import Arrow.c.types;
public import GLib.ErrorG;
public import Gid.gid;

template WritableFileT()
{

  override bool writeAt(long position, ubyte[] data)
  {
    bool _retval;
    long _nBytes;
    if (data)
      _nBytes = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = garrow_writable_file_write_at(cast(GArrowWritableFile*)cPtr, position, _data, _nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
