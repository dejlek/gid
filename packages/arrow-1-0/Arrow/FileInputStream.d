module Arrow.FileInputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.Readable;
import Arrow.ReadableT;
import Arrow.SeekableInputStream;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class FileInputStream : SeekableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_file_input_stream_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

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

  static FileInputStream newFileDescriptor(int fileDescriptor)
  {
    GArrowFileInputStream* _cretval;
    GError *_err;
    _cretval = garrow_file_input_stream_new_file_descriptor(fileDescriptor, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!FileInputStream(cast(GArrowFileInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  int getFileDescriptor()
  {
    int _retval;
    _retval = garrow_file_input_stream_get_file_descriptor(cast(GArrowFileInputStream*)cPtr);
    return _retval;
  }
}
