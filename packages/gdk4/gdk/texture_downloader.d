module gdk.texture_downloader;

import gdk.c.functions;
import gdk.c.types;
import gdk.texture;
import gdk.types;
import gid.gid;
import glib.bytes;
import gobject.boxed;
import gobject.object;

/**
 * The `GdkTextureDownloader` is used to download the contents of a
 * [Gdk.Texture].
 * It is intended to be created as a short-term object for a single download,
 * but can be used for multiple downloads of different textures or with different
 * settings.
 * `GdkTextureDownloader` can be used to convert data between different formats.
 * Create a `GdkTexture` for the existing format and then download it in a
 * different format.
 */
class TextureDownloader : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_texture_downloader_get_type != &gidSymbolNotFound ? gdk_texture_downloader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new texture downloader for texture.
   * Params:
   *   texture = texture to download
   * Returns: A new texture downloader
   */
  this(Texture texture)
  {
    GdkTextureDownloader* _cretval;
    _cretval = gdk_texture_downloader_new(texture ? cast(GdkTexture*)texture.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a copy of the downloader.
   * This function is meant for language bindings.
   * Returns: A copy of the downloader
   */
  TextureDownloader copy()
  {
    GdkTextureDownloader* _cretval;
    _cretval = gdk_texture_downloader_copy(cast(GdkTextureDownloader*)cPtr);
    auto _retval = _cretval ? new TextureDownloader(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Downloads the given texture pixels into a `GBytes`. The rowstride will
   * be stored in the stride value.
   * This function will abort if it tries to download a large texture and
   * fails to allocate memory. If you think that may happen, you should handle
   * memory allocation yourself and use [Gdk.TextureDownloader.downloadInto]
   * once allocation succeeded.
   * Params:
   *   outStride = The stride of the resulting data in bytes
   * Returns: The downloaded pixels
   */
  Bytes downloadBytes(out size_t outStride)
  {
    GBytes* _cretval;
    _cretval = gdk_texture_downloader_download_bytes(cast(GdkTextureDownloader*)cPtr, cast(size_t*)&outStride);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the format that the data will be downloaded in.
   * Returns: The format of the download
   */
  MemoryFormat getFormat()
  {
    GdkMemoryFormat _cretval;
    _cretval = gdk_texture_downloader_get_format(cast(GdkTextureDownloader*)cPtr);
    MemoryFormat _retval = cast(MemoryFormat)_cretval;
    return _retval;
  }

  /**
   * Gets the texture that the downloader will download.
   * Returns: The texture to download
   */
  Texture getTexture()
  {
    GdkTexture* _cretval;
    _cretval = gdk_texture_downloader_get_texture(cast(GdkTextureDownloader*)cPtr);
    auto _retval = ObjectG.getDObject!Texture(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the format the downloader will download.
   * By default, GDK_MEMORY_DEFAULT is set.
   * Params:
   *   format = the format to use
   */
  void setFormat(MemoryFormat format)
  {
    gdk_texture_downloader_set_format(cast(GdkTextureDownloader*)cPtr, format);
  }

  /**
   * Changes the texture the downloader will download.
   * Params:
   *   texture = the new texture to download
   */
  void setTexture(Texture texture)
  {
    gdk_texture_downloader_set_texture(cast(GdkTextureDownloader*)cPtr, texture ? cast(GdkTexture*)texture.cPtr(No.Dup) : null);
  }
}
