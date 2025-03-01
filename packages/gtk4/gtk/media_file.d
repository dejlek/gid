module gtk.media_file;

import gdk.paintable;
import gdk.paintable_mixin;
import gid.global;
import gio.file;
import gio.file_mixin;
import gio.input_stream;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.media_stream;
import gtk.types;

/**
 * `GtkMediaFile` implements `GtkMediaStream` for files.
 * This provides a simple way to play back video files with GTK.
 * GTK provides a GIO extension point for `GtkMediaFile` implementations
 * to allow for external implementations using various media frameworks.
 * GTK itself includes an implementation using GStreamer.
 */
class MediaFile : MediaStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_media_file_get_type != &gidSymbolNotFound ? gtk_media_file_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new empty media file.
   * Returns: a new `GtkMediaFile`
   */
  this()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new media file to play file.
   * Params:
   *   file = The file to play
   * Returns: a new `GtkMediaFile` playing file
   */
  static MediaFile newForFile(File file)
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new_for_file(file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!MediaFile(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new media file for the given filename.
   * This is a utility function that converts the given filename
   * to a `GFile` and calls [gtk.media_file.MediaFile.newForFile].
   * Params:
   *   filename = filename to open
   * Returns: a new `GtkMediaFile` playing filename
   */
  static MediaFile newForFilename(string filename)
  {
    GtkMediaStream* _cretval;
    const(char)* _filename = filename.toCString(No.Alloc);
    _cretval = gtk_media_file_new_for_filename(_filename);
    auto _retval = ObjectG.getDObject!MediaFile(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new media file to play stream.
   * If you want the resulting media to be seekable,
   * the stream should implement the `GSeekable` interface.
   * Params:
   *   stream = The stream to play
   * Returns: a new `GtkMediaFile`
   */
  static MediaFile newForInputStream(InputStream stream)
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_file_new_for_input_stream(stream ? cast(GInputStream*)stream.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!MediaFile(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new new media file for the given resource.
   * This is a utility function that converts the given resource
   * to a `GFile` and calls [gtk.media_file.MediaFile.newForFile].
   * Params:
   *   resourcePath = resource path to open
   * Returns: a new `GtkMediaFile` playing resource_path
   */
  static MediaFile newForResource(string resourcePath)
  {
    GtkMediaStream* _cretval;
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    _cretval = gtk_media_file_new_for_resource(_resourcePath);
    auto _retval = ObjectG.getDObject!MediaFile(cast(GtkMediaStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Resets the media file to be empty.
   */
  void clear()
  {
    gtk_media_file_clear(cast(GtkMediaFile*)cPtr);
  }

  /**
   * Returns the file that self is currently playing from.
   * When self is not playing or not playing from a file,
   * %NULL is returned.
   * Returns: The currently playing file
   */
  File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_media_file_get_file(cast(GtkMediaFile*)cPtr);
    auto _retval = ObjectG.getDObject!File(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the stream that self is currently playing from.
   * When self is not playing or not playing from a stream,
   * %NULL is returned.
   * Returns: The currently playing stream
   */
  InputStream getInputStream()
  {
    GInputStream* _cretval;
    _cretval = gtk_media_file_get_input_stream(cast(GtkMediaFile*)cPtr);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the `GtkMediaFile` to play the given file.
   * If any file is still playing, stop playing it.
   * Params:
   *   file = the file to play
   */
  void setFile(File file)
  {
    gtk_media_file_set_file(cast(GtkMediaFile*)cPtr, file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
  }

  /**
   * Sets the `GtkMediaFile to play the given file.
   * This is a utility function that converts the given filename
   * to a `GFile` and calls [gtk.media_file.MediaFile.setFile].
   * Params:
   *   filename = name of file to play
   */
  void setFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    gtk_media_file_set_filename(cast(GtkMediaFile*)cPtr, _filename);
  }

  /**
   * Sets the `GtkMediaFile` to play the given stream.
   * If anything is still playing, stop playing it.
   * Full control about the stream is assumed for the duration of
   * playback. The stream will not be closed.
   * Params:
   *   stream = the stream to play from
   */
  void setInputStream(InputStream stream)
  {
    gtk_media_file_set_input_stream(cast(GtkMediaFile*)cPtr, stream ? cast(GInputStream*)stream.cPtr(No.Dup) : null);
  }

  /**
   * Sets the `GtkMediaFile to play the given resource.
   * This is a utility function that converts the given resource_path
   * to a `GFile` and calls [gtk.media_file.MediaFile.setFile].
   * Params:
   *   resourcePath = path to resource to play
   */
  void setResource(string resourcePath)
  {
    const(char)* _resourcePath = resourcePath.toCString(No.Alloc);
    gtk_media_file_set_resource(cast(GtkMediaFile*)cPtr, _resourcePath);
  }
}
