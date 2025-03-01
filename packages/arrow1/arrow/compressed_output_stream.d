module arrow.compressed_output_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.codec;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.global;
import glib.error;

class CompressedOutputStream : OutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_compressed_output_stream_get_type != &gidSymbolNotFound ? garrow_compressed_output_stream_get_type() : cast(GType)0;
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
