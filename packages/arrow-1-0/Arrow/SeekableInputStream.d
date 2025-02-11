module Arrow.SeekableInputStream;

import Arrow.Buffer;
import Arrow.File;
import Arrow.FileT;
import Arrow.InputStream;
import Arrow.Readable;
import Arrow.ReadableT;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class SeekableInputStream : InputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_seekable_input_stream_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  ulong getSize()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_seekable_input_stream_get_size(cast(GArrowSeekableInputStream*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool getSupportZeroCopy()
  {
    bool _retval;
    _retval = garrow_seekable_input_stream_get_support_zero_copy(cast(GArrowSeekableInputStream*)cPtr);
    return _retval;
  }

  Bytes peek(long nBytes)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = garrow_seekable_input_stream_peek(cast(GArrowSeekableInputStream*)cPtr, nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  Buffer readAt(long position, long nBytes)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_seekable_input_stream_read_at(cast(GArrowSeekableInputStream*)cPtr, position, nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  Bytes readAtBytes(long position, long nBytes)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = garrow_seekable_input_stream_read_at_bytes(cast(GArrowSeekableInputStream*)cPtr, position, nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
