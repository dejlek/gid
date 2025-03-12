module arrow.buffer_output_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.resizable_buffer;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.gid;

/** */
class BufferOutputStream : arrow.output_stream.OutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_buffer_output_stream_get_type != &gidSymbolNotFound ? garrow_buffer_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override BufferOutputStream self()
  {
    return this;
  }

  /** */
  this(arrow.resizable_buffer.ResizableBuffer buffer)
  {
    GArrowBufferOutputStream* _cretval;
    _cretval = garrow_buffer_output_stream_new(buffer ? cast(GArrowResizableBuffer*)buffer.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
