module gio.zlib_decompressor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.file_info;
import gio.types;
import gobject.object;

/**
 * `GZlibDecompressor` is an implementation of [Gio.Converter] that
 * decompresses data compressed with zlib.
 */
class ZlibDecompressor : ObjectG, Converter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_zlib_decompressor_get_type != &gidSymbolNotFound ? g_zlib_decompressor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ConverterT!();

  /**
   * Creates a new #GZlibDecompressor.
   * Params:
   *   format = The format to use for the compressed data
   * Returns: a new #GZlibDecompressor
   */
  this(ZlibCompressorFormat format)
  {
    GZlibDecompressor* _cretval;
    _cretval = g_zlib_decompressor_new(format);
    this(_cretval, Yes.Take);
  }

  /**
   * Retrieves the #GFileInfo constructed from the GZIP header data
   * of compressed data processed by compressor, or %NULL if decompressor's
   * #GZlibDecompressor:format property is not %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
   * or the header data was not fully processed yet, or it not present in the
   * data stream at all.
   * Returns: a #GFileInfo, or %NULL
   */
  FileInfo getFileInfo()
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_decompressor_get_file_info(cast(GZlibDecompressor*)cPtr);
    auto _retval = ObjectG.getDObject!FileInfo(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }
}
