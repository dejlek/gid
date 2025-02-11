module Arrow.ReadableT;

public import Arrow.ReadableIfaceProxy;
public import Arrow.Buffer;
public import Arrow.Types;
public import Arrow.c.functions;
public import Arrow.c.types;
public import GLib.Bytes;
public import GLib.ErrorG;
public import GObject.ObjectG;
public import Gid.gid;

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
