module Arrow.CompressedInputStream;

import Arrow.Codec;
import Arrow.File;
import Arrow.FileT;
import Arrow.InputStream;
import Arrow.Readable;
import Arrow.ReadableT;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class CompressedInputStream : InputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_compressed_input_stream_get_type != &gidSymbolNotFound ? garrow_compressed_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Codec codec, InputStream raw)
  {
    GArrowCompressedInputStream* _cretval;
    GError *_err;
    _cretval = garrow_compressed_input_stream_new(codec ? cast(GArrowCodec*)codec.cPtr(No.Dup) : null, raw ? cast(GArrowInputStream*)raw.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
