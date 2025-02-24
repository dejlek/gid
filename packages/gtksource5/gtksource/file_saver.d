module gtksource.file_saver;

import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.cancellable;
import gio.file : DGioFile = File;
import gio.file_mixin : DGioFileT = FileT;
import gio.types;
import glib.error;
import gobject.object;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.encoding;
import gtksource.file;
import gtksource.types;

/**
 * Save a class@Buffer into a file.
 * A `GtkSourceFileSaver` object permits to save a class@Buffer into a
 * [Gio.DGioFile].
 * A file saver should be used only for one save operation, including errors
 * handling. If an error occurs, you can reconfigure the saver and relaunch the
 * operation with [GtkSource.FileSaver.saveAsync].
 */
class FileSaver : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_file_saver_get_type != &gidSymbolNotFound ? gtk_source_file_saver_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkSourceFileSaver object. The buffer will be saved to the
   * classFile's location.
   * This constructor is suitable for a simple "save" operation, when the file
   * already contains a non-%NULL propertyFile:location.
   * Params:
   *   buffer = the #GtkSourceBuffer to save.
   *   file = the #GtkSourceFile.
   * Returns: a new #GtkSourceFileSaver object.
   */
  this(Buffer buffer, File file)
  {
    GtkSourceFileSaver* _cretval;
    _cretval = gtk_source_file_saver_new(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new #GtkSourceFileSaver object with a target location.
   * When the file saving is finished successfully, target_location is set to the file's
   * propertyFile:location property. If an error occurs, the previous valid
   * location is still available in classFile.
   * This constructor is suitable for a "save as" operation, or for saving a new
   * buffer for the first time.
   * Params:
   *   buffer = the #GtkSourceBuffer to save.
   *   file = the #GtkSourceFile.
   *   targetLocation = the #GFile where to save the buffer to.
   * Returns: a new #GtkSourceFileSaver object.
   */
  static FileSaver newWithTarget(Buffer buffer, File file, DGioFile targetLocation)
  {
    GtkSourceFileSaver* _cretval;
    _cretval = gtk_source_file_saver_new_with_target(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file.cPtr(No.Dup) : null, targetLocation ? cast(GFile*)(cast(ObjectG)targetLocation).cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!FileSaver(cast(GtkSourceFileSaver*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_file_saver_get_buffer(cast(GtkSourceFileSaver*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  CompressionType getCompressionType()
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_saver_get_compression_type(cast(GtkSourceFileSaver*)cPtr);
    CompressionType _retval = cast(CompressionType)_cretval;
    return _retval;
  }

  Encoding getEncoding()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_saver_get_encoding(cast(GtkSourceFileSaver*)cPtr);
    auto _retval = _cretval ? new Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  File getFile()
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_saver_get_file(cast(GtkSourceFileSaver*)cPtr);
    auto _retval = ObjectG.getDObject!File(cast(GtkSourceFile*)_cretval, No.Take);
    return _retval;
  }

  FileSaverFlags getFlags()
  {
    GtkSourceFileSaverFlags _cretval;
    _cretval = gtk_source_file_saver_get_flags(cast(GtkSourceFileSaver*)cPtr);
    FileSaverFlags _retval = cast(FileSaverFlags)_cretval;
    return _retval;
  }

  DGioFile getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_source_file_saver_get_location(cast(GtkSourceFileSaver*)cPtr);
    auto _retval = ObjectG.getDObject!DGioFile(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  NewlineType getNewlineType()
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_saver_get_newline_type(cast(GtkSourceFileSaver*)cPtr);
    NewlineType _retval = cast(NewlineType)_cretval;
    return _retval;
  }

  /**
   * Saves asynchronously the buffer into the file.
   * See the [Gio.AsyncResult] documentation to know how to use this function.
   * Params:
   *   ioPriority = the I/O priority of the request. E.g. %G_PRIORITY_LOW,
   *     %G_PRIORITY_DEFAULT or %G_PRIORITY_HIGH.
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   progressCallback = function to call back with
   *     progress information, or %NULL if progress information is not needed.
   *   callback = a #GAsyncReadyCallback to call when the request is
   *     satisfied.
   */
  void saveAsync(int ioPriority, Cancellable cancellable, FileProgressCallback progressCallback, AsyncReadyCallback callback)
  {
    extern(C) void _progressCallbackCallback(long currentNumBytes, long totalNumBytes, void* data)
    {
      auto _dlg = cast(FileProgressCallback*)data;

      (*_dlg)(currentNumBytes, totalNumBytes);
    }
    auto _progressCallbackCB = progressCallback ? &_progressCallbackCallback : null;

    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _progressCallback = progressCallback ? freezeDelegate(cast(void*)&progressCallback) : null;
    GDestroyNotify _progressCallbackDestroyCB = progressCallback ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_file_saver_save_async(cast(GtkSourceFileSaver*)cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _progressCallbackDestroyCB, _callbackCB, _callback);
  }

  /**
   * Finishes a file saving started with [GtkSource.FileSaver.saveAsync].
   * If the file has been saved successfully, the following classFile
   * properties will be updated: the location, the encoding, the newline type and
   * the compression type.
   * Since the 3.20 version, [Gtk.TextBuffer.setModified] is called with %FALSE
   * if the file has been saved successfully.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: whether the file was saved successfully.
   */
  bool saveFinish(AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_source_file_saver_save_finish(cast(GtkSourceFileSaver*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Sets the compression type. By default the compression type is taken from the
   * #GtkSourceFile.
   * Params:
   *   compressionType = the new compression type.
   */
  void setCompressionType(CompressionType compressionType)
  {
    gtk_source_file_saver_set_compression_type(cast(GtkSourceFileSaver*)cPtr, compressionType);
  }

  /**
   * Sets the encoding. If encoding is %NULL, the UTF-8 encoding will be set.
   * By default the encoding is taken from the #GtkSourceFile.
   * Params:
   *   encoding = the new encoding, or %NULL for UTF-8.
   */
  void setEncoding(Encoding encoding)
  {
    gtk_source_file_saver_set_encoding(cast(GtkSourceFileSaver*)cPtr, encoding ? cast(GtkSourceEncoding*)encoding.cPtr(No.Dup) : null);
  }

  void setFlags(FileSaverFlags flags)
  {
    gtk_source_file_saver_set_flags(cast(GtkSourceFileSaver*)cPtr, flags);
  }

  /**
   * Sets the newline type. By default the newline type is taken from the
   * #GtkSourceFile.
   * Params:
   *   newlineType = the new newline type.
   */
  void setNewlineType(NewlineType newlineType)
  {
    gtk_source_file_saver_set_newline_type(cast(GtkSourceFileSaver*)cPtr, newlineType);
  }
}
