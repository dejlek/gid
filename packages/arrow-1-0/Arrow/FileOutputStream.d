module Arrow.FileOutputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.OutputStream;
import Arrow.Types;
import Arrow.Writable;
import Arrow.WritableT;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class FileOutputStream : OutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_output_stream_get_type != &gidSymbolNotFound ? garrow_file_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string path, bool append)
  {
    GArrowFileOutputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_file_output_stream_new(_path, append, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
