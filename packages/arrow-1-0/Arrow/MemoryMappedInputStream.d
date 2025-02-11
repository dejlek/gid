module Arrow.MemoryMappedInputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.Readable;
import Arrow.ReadableT;
import Arrow.SeekableInputStream;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class MemoryMappedInputStream : SeekableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_memory_mapped_input_stream_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(string path)
  {
    GArrowMemoryMappedInputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_memory_mapped_input_stream_new(_path, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
