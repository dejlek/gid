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
import gid.gid;
import glib.error;

/** */
class CompressedOutputStream : arrow.output_stream.OutputStream
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_compressed_output_stream_get_type != &gidSymbolNotFound ? garrow_compressed_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.codec.Codec codec, arrow.output_stream.OutputStream raw)
  {
    GArrowCompressedOutputStream* _cretval;
    GError *_err;
    _cretval = garrow_compressed_output_stream_new(codec ? cast(GArrowCodec*)codec.cPtr(No.dup) : null, raw ? cast(GArrowOutputStream*)raw.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }
}
