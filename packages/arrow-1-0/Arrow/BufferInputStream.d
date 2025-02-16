module Arrow.BufferInputStream;

import Arrow.Buffer;
import Arrow.File;
import Arrow.FileT;
import Arrow.Readable;
import Arrow.ReadableT;
import Arrow.SeekableInputStream;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class BufferInputStream : SeekableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
