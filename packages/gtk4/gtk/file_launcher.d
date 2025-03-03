module gtk.file_launcher;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
 * A `GtkFileLauncher` object collects the arguments that are needed to open a
 * file with an application.
 * Depending on system configuration, user preferences and available APIs, this
 * may or may not show an app chooser dialog or launch the default application
 * right away.
 * The operation is started with the [gtk.file_launcher.FileLauncher.launch] function.
 * This API follows the GIO async pattern, and the result can be obtained by
 * calling [gtk.file_launcher.FileLauncher.launchFinish].
 * To launch uris that don't represent files, use [gtk.uri_launcher.UriLauncher].
 */
class FileLauncher : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_file_launcher_get_type != &gidSymbolNotFound ? gtk_file_launcher_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkFileLauncher` object.
   * Params:
   *   file = the file to open
   * Returns: the new `GtkFileLauncher`
   */
  this(gio.file.File file)
  {
    GtkFileLauncher* _cretval;
    _cretval = gtk_file_launcher_new(file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns whether to ask the user to choose an app for opening the file.
   * Returns: `TRUE` if always asking for app
   */
  bool getAlwaysAsk()
  {
    bool _retval;
    _retval = gtk_file_launcher_get_always_ask(cast(GtkFileLauncher*)cPtr);
    return _retval;
  }

  /**
   * Gets the file that will be opened.
   * Returns: the file
   */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_file_launcher_get_file(cast(GtkFileLauncher*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether to make the file writable for the handler.
   * Returns: `TRUE` if the file will be made writable
   */
  bool getWritable()
  {
    bool _retval;
    _retval = gtk_file_launcher_get_writable(cast(GtkFileLauncher*)cPtr);
    return _retval;
  }

  /**
   * Launch an application to open the file.
   * This may present an app chooser dialog to the user.
   * The callback will be called when the operation is completed.
   * It should call [gtk.file_launcher.FileLauncher.launchFinish] to obtain
   * the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void launch(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_launcher_launch(cast(GtkFileLauncher*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_launcher.FileLauncher.launch] call and
   * returns the result.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: `TRUE` if an application was launched,
   *   or `FALSE` and error is set
   */
  bool launchFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_file_launcher_launch_finish(cast(GtkFileLauncher*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Launch a file manager to show the file in its parent directory.
   * This is only supported native files. It will fail if file
   * is e.g. a http:// uri.
   * The callback will be called when the operation is completed.
   * It should call [gtk.file_launcher.FileLauncher.openContainingFolderFinish]
   * to obtain the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void openContainingFolder(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_launcher_open_containing_folder(cast(GtkFileLauncher*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_launcher.FileLauncher.openContainingFolder]
   * call and returns the result.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: `TRUE` if an application was launched,
   *   or `FALSE` and error is set
   */
  bool openContainingFolderFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_file_launcher_open_containing_folder_finish(cast(GtkFileLauncher*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Sets whether to awlays ask the user to choose an app for opening the file.
   * If `FALSE`, the file might be opened with a default app or the previous choice.
   * Params:
   *   alwaysAsk = a `gboolean`
   */
  void setAlwaysAsk(bool alwaysAsk)
  {
    gtk_file_launcher_set_always_ask(cast(GtkFileLauncher*)cPtr, alwaysAsk);
  }

  /**
   * Sets the file that will be opened.
   * Params:
   *   file = a `GFile`
   */
  void setFile(gio.file.File file)
  {
    gtk_file_launcher_set_file(cast(GtkFileLauncher*)cPtr, file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
  }

  /**
   * Sets whether to make the file writable for the handler.
   * Params:
   *   writable = a `gboolean`
   */
  void setWritable(bool writable)
  {
    gtk_file_launcher_set_writable(cast(GtkFileLauncher*)cPtr, writable);
  }
}
