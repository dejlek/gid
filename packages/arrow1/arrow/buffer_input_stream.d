module arrow.buffer_input_stream;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.readable;
import arrow.readable_mixin;
import arrow.seekable_input_stream;
import arrow.types;
import gid.global;
import gobject.object;

class BufferInputStream : SeekableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_buffer_input_stream_get_type != &gidSymbolNotFound ? garrow_buffer_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Buffer buffer)
  {
    GArrowBufferInputStream* _cretval;
    _cretval = garrow_buffer_input_stream_new(buffer ? cast(GArrowBuffer*)buffer.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_input_stream_get_buffer(cast(GArrowBufferInputStream*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
