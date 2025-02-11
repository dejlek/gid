module Arrow.CompressedOutputStream;

import Arrow.Codec;
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

class CompressedOutputStream : OutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_compressed_output_stream_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Codec codec, OutputStream raw)
  {
    GArrowCompressedOutputStream* _cretval;
    GError *_err;
    _cretval = garrow_compressed_output_stream_new(codec ? cast(GArrowCodec*)codec.cPtr(No.Dup) : null, raw ? cast(GArrowOutputStream*)raw.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
