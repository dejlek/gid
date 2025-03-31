/// Module for [ZlibCompressor] class
module gio.zlib_compressor;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.converter;
import gio.converter_mixin;
import gio.file_info;
import gio.types;
import gobject.object;

/**
    [gio.zlib_compressor.ZlibCompressor] is an implementation of [gio.converter.Converter] that
    compresses data using zlib.
*/
class ZlibCompressor : gobject.object.ObjectG, gio.converter.Converter
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
    return cast(void function())g_zlib_compressor_get_type != &gidSymbolNotFound ? g_zlib_compressor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ZlibCompressor self()
  {
    return this;
  }

  mixin ConverterT!();

  /**
      Creates a new #GZlibCompressor.
  
      Params:
        format = The format to use for the compressed data
        level = compression level (0-9), -1 for default
      Returns: a new #GZlibCompressor
  */
  this(gio.types.ZlibCompressorFormat format, int level)
  {
    GZlibCompressor* _cretval;
    _cretval = g_zlib_compressor_new(format, level);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the #GZlibCompressor:file-info property.
      Returns: a #GFileInfo, or null
  */
  gio.file_info.FileInfo getFileInfo()
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_compressor_get_file_info(cast(GZlibCompressor*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file_info.FileInfo)(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets file_info in compressor. If non-null, and compressor's
      #GZlibCompressor:format property is [gio.types.ZlibCompressorFormat.Gzip],
      it will be used to set the file name and modification time in
      the GZIP header of the compressed data.
      
      Note: it is an error to call this function while a compression is in
      progress; it may only be called immediately after creation of compressor,
      or after resetting it with [gio.converter.Converter.reset].
  
      Params:
        fileInfo = a #GFileInfo
  */
  void setFileInfo(gio.file_info.FileInfo fileInfo = null)
  {
    g_zlib_compressor_set_file_info(cast(GZlibCompressor*)cPtr, fileInfo ? cast(GFileInfo*)fileInfo.cPtr(No.Dup) : null);
  }
}
