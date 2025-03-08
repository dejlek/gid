module arrow.memory_mapped_input_stream;

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

/** */
class MemoryMappedInputStream : arrow.seekable_input_stream.SeekableInputStream
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_memory_mapped_input_stream_get_type != &gidSymbolNotFound ? garrow_memory_mapped_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string path)
  {
    GArrowMemoryMappedInputStream* _cretval;
    const(char)* _path = path.toCString(No.alloc);
    GError *_err;
    _cretval = garrow_memory_mapped_input_stream_new(_path, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }
}
