/// Module for [Codec] class
module arrow.codec;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Codec : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_codec_get_type != &gidSymbolNotFound ? garrow_codec_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override Codec self()
  {
    return this;
  }

  /** */
  this(arrow.types.CompressionType type)
  {
    GArrowCodec* _cretval;
    GError *_err;
    _cretval = garrow_codec_new(type, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  int getCompressionLevel()
  {
    int _retval;
    _retval = garrow_codec_get_compression_level(cast(GArrowCodec*)cPtr);
    return _retval;
  }

  /** */
  arrow.types.CompressionType getCompressionType()
  {
    GArrowCompressionType _cretval;
    _cretval = garrow_codec_get_compression_type(cast(GArrowCodec*)cPtr);
    arrow.types.CompressionType _retval = cast(arrow.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_codec_get_name(cast(GArrowCodec*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
