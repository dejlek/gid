module Arrow.BufferOutputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.OutputStream;
import Arrow.ResizableBuffer;
import Arrow.Types;
import Arrow.Writable;
import Arrow.WritableT;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BufferOutputStream : OutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_buffer_output_stream_get_type != &gidSymbolNotFound ? garrow_buffer_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(ResizableBuffer buffer)
  {
    GArrowBufferOutputStream* _cretval;
    _cretval = garrow_buffer_output_stream_new(buffer ? cast(GArrowResizableBuffer*)buffer.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
