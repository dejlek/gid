module GtkSource.FileLoader;

import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;
import Gio.AsyncResult;
import Gio.AsyncResultT;
import Gio.Cancellable;
import Gio.File : DGioFile = File;
import Gio.FileT : DGioFileT = FileT;
import Gio.InputStream;
import Gio.Types;
import GtkSource.Buffer;
import GtkSource.Encoding;
import GtkSource.File;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Load a file into a GtkSourceBuffer.
 * A `GtkSourceFileLoader` object permits to load the contents of a [Gio.DGioFile] or a
 * [Gio.InputStream] into a class@Buffer.
 * A file loader should be used only for one load operation, including errors
 * handling. If an error occurs, you can reconfigure the loader and relaunch the
 * operation with [GtkSource.FileLoader.loadAsync].
 * Running a `GtkSourceFileLoader` is an undoable action for the
 * class@Buffer.
 * After a file loading, the buffer is reset to the contents provided by the
 * [Gio.DGioFile] or [Gio.InputStream], so the buffer is set as “unmodified”, that is,
 * [Gtk.TextBuffer.setModified] is called with %FALSE. If the contents isn't
 * saved somewhere $(LPAREN)for example if you load from stdin$(RPAREN), then you should
 * probably call [Gtk.TextBuffer.setModified] with %TRUE after calling
 * [GtkSource.FileLoader.loadFinish].
 */
class FileLoader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_file_loader_get_type != &gidSymbolNotFound ? gtk_source_file_loader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkSourceFileLoader` object. The contents is read from the
   * classFile's location.
   * If not already done, call [GtkSource.File.setLocation] before calling this constructor.
   * The previous location is anyway not needed, because as soon as the file loading begins,
   * the buffer is emptied.
   * Params:
   *   buffer = the #GtkSourceBuffer to load the contents into.
   *   file = the #GtkSourceFile.
   * Returns: a new #GtkSourceFileLoader object.
   */
  this(Buffer buffer, File file)
  {
    GtkSourceFileLoader* _cretval;
    _cretval = gtk_source_file_loader_new(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new #GtkSourceFileLoader object. The contents is read from stream.
   * Params:
   *   buffer = the #GtkSourceBuffer to load the contents into.
   *   file = the #GtkSourceFile.
   *   stream = the #GInputStream to load, e.g. stdin.
   * Returns: a new #GtkSourceFileLoader object.
   */
  static FileLoader newFromStream(Buffer buffer, File file, InputStream stream)
  {
    GtkSourceFileLoader* _cretval;
    _cretval = gtk_source_file_loader_new_from_stream(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null, file ? cast(GtkSourceFile*)file.cPtr(No.Dup) : null, stream ? cast(GInputStream*)stream.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!FileLoader(cast(GtkSourceFileLoader*)_cretval, Yes.Take);
    return _retval;
  }

  Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_file_loader_get_buffer(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  CompressionType getCompressionType()
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_loader_get_compression_type(cast(GtkSourceFileLoader*)cPtr);
    CompressionType _retval = cast(CompressionType)_cretval;
    return _retval;
  }

  Encoding getEncoding()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_loader_get_encoding(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = _cretval ? new Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  File getFile()
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_loader_get_file(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!File(cast(GtkSourceFile*)_cretval, No.Take);
    return _retval;
  }

  InputStream getInputStream()
  {
    GInputStream* _cretval;
    _cretval = gtk_source_file_loader_get_input_stream(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!InputStream(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  DGioFile getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_source_file_loader_get_location(cast(GtkSourceFileLoader*)cPtr);
    auto _retval = ObjectG.getDObject!DGioFile(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  NewlineType getNewlineType()
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_loader_get_newline_type(cast(GtkSourceFileLoader*)cPtr);
    NewlineType _retval = cast(NewlineType)_cretval;
    return _retval;
  }

  /**
   * Loads asynchronously the file or input stream contents into the classBuffer.
   * See the [Gio.AsyncResult] documentation to know how to use this
   * function.
   * Params:
   *   ioPriority = the I/O priority of the request. E.g. %G_PRIORITY_LOW,
   *     %G_PRIORITY_DEFAULT or %G_PRIORITY_HIGH.
   *   cancellable = optional #GCancellable object, %NULL to ignore.
   *   progressCallback = function to call back with
   *     progress information, or %NULL if progress information is not needed.
   *   callback = a #GAsyncReadyCallback to call when the request is
   *     satisfied.
   */
  void loadAsync(int ioPriority, Cancellable cancellable, FileProgressCallback progressCallback, AsyncReadyCallback callback)
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
    gtk_source_file_loader_load_async(cast(GtkSourceFileLoader*)cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _progressCallbackCB, _progressCallback, _progressCallbackDestroyCB, _callbackCB, _callback);
  }

  /**
   * Finishes a file loading started with [GtkSource.FileLoader.loadAsync].
   * If the contents has been loaded, the following classFile properties will
   * be updated: the location, the encoding, the newline type and the compression
   * type.
   * Params:
   *   result = a #GAsyncResult.
   * Returns: whether the contents has been loaded successfully.
   */
  bool loadFinish(AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_source_file_loader_load_finish(cast(GtkSourceFileLoader*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Sets the candidate encodings for the file loading.
   * The encodings are tried in the same order as the list.
   * For convenience, candidate_encodings can contain duplicates. Only the first
   * occurrence of a duplicated encoding is kept in the list.
   * By default the candidate encodings are $(LPAREN)in that order in the list$(RPAREN):
   * 1. If set, the classFile's encoding as returned by [GtkSource.File.getEncoding].
   * 2. The default candidates as returned by [GtkSource.Encoding.getDefaultCandidates].
   * Params:
   *   candidateEncodings = a list of
   *     #GtkSourceEncoding<!-- -->s.
   */
  void setCandidateEncodings(Encoding[] candidateEncodings)
  {
    auto _candidateEncodings = gSListFromD!(Encoding)(candidateEncodings);
    scope(exit) containerFree!(GSList*, Encoding, GidOwnership.None)(_candidateEncodings);
    gtk_source_file_loader_set_candidate_encodings(cast(GtkSourceFileLoader*)cPtr, _candidateEncodings);
  }
}
