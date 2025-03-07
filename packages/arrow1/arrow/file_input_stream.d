module arrow.file_input_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.readable;
import arrow.readable_mixin;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class FileInputStream : arrow.seekable_input_stream.SeekableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_input_stream_get_type != &gidSymbolNotFound ? garrow_file_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string path)
  {
    GArrowFileInputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_input_stream_new(_path, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.file_input_stream.FileInputStream newFileDescriptor(int fileDescriptor)
  {
    GArrowFileInputStream* _cretval;
    GError *_err;
    _cretval = garrow_file_input_stream_new_file_descriptor(fileDescriptor, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.file_input_stream.FileInputStream)(cast(GArrowFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getFileDescriptor()
  {
    int _retval;
    _retval = garrow_file_input_stream_get_file_descriptor(cast(GArrowFileInputStream*)cPtr);
    return _retval;
  }
}
