module gtk.file_dialog;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.file;
import gio.list_model;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.file_filter;
import gtk.types;
import gtk.window;

/**
 * A `GtkFileDialog` object collects the arguments that
 * are needed to present a file chooser dialog to the
 * user, such as a title for the dialog and whether it
 * should be modal.
 * The dialog is shown with [gtk.file_dialog.FileDialog.open],
 * [gtk.file_dialog.FileDialog.save], etc. These APIs follow the
 * GIO async pattern, and the result can be obtained by calling
 * the corresponding finish function, for example
 * [gtk.file_dialog.FileDialog.openFinish].
 */
class FileDialog : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_file_dialog_get_type != &gidSymbolNotFound ? gtk_file_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkFileDialog` object.
   * Returns: the new `GtkFileDialog`
   */
  this()
  {
    GtkFileDialog* _cretval;
    _cretval = gtk_file_dialog_new();
    this(_cretval, Yes.Take);
  }

  string getAcceptLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_accept_label(cast(GtkFileDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the filter that will be selected by default
   * in the file chooser dialog.
   * Returns: the current filter
   */
  gtk.file_filter.FileFilter getDefaultFilter()
  {
    GtkFileFilter* _cretval;
    _cretval = gtk_file_dialog_get_default_filter(cast(GtkFileDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.file_filter.FileFilter)(cast(GtkFileFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the filters that will be offered to the user
   * in the file chooser dialog.
   * Returns: the filters, as
   *   a `GListModel` of `GtkFileFilters`
   */
  gio.list_model.ListModel getFilters()
  {
    GListModel* _cretval;
    _cretval = gtk_file_dialog_get_filters(cast(GtkFileDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the file that will be initially selected in
   * the file chooser dialog.
   * Returns: the file
   */
  gio.file.File getInitialFile()
  {
    GFile* _cretval;
    _cretval = gtk_file_dialog_get_initial_file(cast(GtkFileDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the folder that will be set as the
   * initial folder in the file chooser dialog.
   * Returns: the folder
   */
  gio.file.File getInitialFolder()
  {
    GFile* _cretval;
    _cretval = gtk_file_dialog_get_initial_folder(cast(GtkFileDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the name for the file that should be initially set.
   * Returns: the name
   */
  string getInitialName()
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_initial_name(cast(GtkFileDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Returns whether the file chooser dialog
   * blocks interaction with the parent window
   * while it is presented.
   * Returns: `TRUE` if the file chooser dialog is modal
   */
  bool getModal()
  {
    bool _retval;
    _retval = gtk_file_dialog_get_modal(cast(GtkFileDialog*)cPtr);
    return _retval;
  }

  /**
   * Returns the title that will be shown on the
   * file chooser dialog.
   * Returns: the title
   */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_file_dialog_get_title(cast(GtkFileDialog*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * This function initiates a file selection operation by
   * presenting a file chooser dialog to the user.
   * The callback will be called when the dialog is dismissed.
   * It should call [gtk.file_dialog.FileDialog.openFinish]
   * to obtain the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void open(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open(cast(GtkFileDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_dialog.FileDialog.open] call and
   * returns the resulting file.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: the file that was selected.
   *   Otherwise, `NULL` is returned and error is set
   */
  gio.file.File openFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_open_finish(cast(GtkFileDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This function initiates a multi-file selection operation by
   * presenting a file chooser dialog to the user.
   * The file chooser will initially be opened in the directory
   * propertyGtk.FileDialog:initial-folder.
   * The callback will be called when the dialog is dismissed.
   * It should call [gtk.file_dialog.FileDialog.openMultipleFinish]
   * to obtain the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void openMultiple(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_open_multiple(cast(GtkFileDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_dialog.FileDialog.open] call and
   * returns the resulting files in a `GListModel`.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: the file that was selected,
   *   as a `GListModel` of `GFiles`. Otherwise, `NULL` is returned
   *   and error is set
   */
  gio.list_model.ListModel openMultipleFinish(gio.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_open_multiple_finish(cast(GtkFileDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This function initiates a file save operation by
   * presenting a file chooser dialog to the user.
   * The callback will be called when the dialog is dismissed.
   * It should call [gtk.file_dialog.FileDialog.saveFinish]
   * to obtain the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void save(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_save(cast(GtkFileDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_dialog.FileDialog.save] call and
   * returns the resulting file.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: the file that was selected.
   *   Otherwise, `NULL` is returned and error is set
   */
  gio.file.File saveFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_save_finish(cast(GtkFileDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This function initiates a directory selection operation by
   * presenting a file chooser dialog to the user.
   * If you pass initial_folder, the file chooser will initially be
   * opened in the parent directory of that folder, otherwise, it
   * will be in the directory propertyGtk.FileDialog:initial-folder.
   * The callback will be called when the dialog is dismissed.
   * It should call [gtk.file_dialog.FileDialog.selectFolderFinish]
   * to obtain the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void selectFolder(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_select_folder(cast(GtkFileDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_dialog.FileDialog.selectFolder] call and
   * returns the resulting file.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: the file that was selected.
   *   Otherwise, `NULL` is returned and error is set
   */
  gio.file.File selectFolderFinish(gio.async_result.AsyncResult result)
  {
    GFile* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_select_folder_finish(cast(GtkFileDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * This function initiates a multi-directory selection operation by
   * presenting a file chooser dialog to the user.
   * The file chooser will initially be opened in the directory
   * propertyGtk.FileDialog:initial-folder.
   * The callback will be called when the dialog is dismissed.
   * It should call [gtk.file_dialog.FileDialog.selectMultipleFoldersFinish]
   * to obtain the result.
   * Params:
   *   parent = the parent `GtkWindow`
   *   cancellable = a `GCancellable` to cancel the operation
   *   callback = a callback to call when the operation is complete
   */
  void selectMultipleFolders(gtk.window.Window parent, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_file_dialog_select_multiple_folders(cast(GtkFileDialog*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes the [gtk.file_dialog.FileDialog.selectMultipleFolders]
   * call and returns the resulting files in a `GListModel`.
   * Params:
   *   result = a `GAsyncResult`
   * Returns: the file that was selected,
   *   as a `GListModel` of `GFiles`. Otherwise, `NULL` is returned
   *   and error is set
   */
  gio.list_model.ListModel selectMultipleFoldersFinish(gio.async_result.AsyncResult result)
  {
    GListModel* _cretval;
    GError *_err;
    _cretval = gtk_file_dialog_select_multiple_folders_finish(cast(GtkFileDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets the label shown on the file chooser's accept button.
   * Leaving the accept label unset or setting it as `NULL` will fall back to
   * a default label, depending on what API is used to launch the file dialog.
   * Params:
   *   acceptLabel = the new accept label
   */
  void setAcceptLabel(string acceptLabel)
  {
    const(char)* _acceptLabel = acceptLabel.toCString(No.Alloc);
    gtk_file_dialog_set_accept_label(cast(GtkFileDialog*)cPtr, _acceptLabel);
  }

  /**
   * Sets the filter that will be selected by default
   * in the file chooser dialog.
   * If set to %NULL, the first item in [gtk.file_dialog.FileDialog.Gio.ListModel]
   * will be used as the default filter. If that list is empty, the dialog
   * will be unfiltered.
   * Params:
   *   filter = a `GtkFileFilter`
   */
  void setDefaultFilter(gtk.file_filter.FileFilter filter)
  {
    gtk_file_dialog_set_default_filter(cast(GtkFileDialog*)cPtr, filter ? cast(GtkFileFilter*)filter.cPtr(No.Dup) : null);
  }

  /**
   * Sets the filters that will be offered to the user
   * in the file chooser dialog.
   * Params:
   *   filters = a `GListModel` of `GtkFileFilters`
   */
  void setFilters(gio.list_model.ListModel filters)
  {
    gtk_file_dialog_set_filters(cast(GtkFileDialog*)cPtr, filters ? cast(GListModel*)(cast(ObjectG)filters).cPtr(No.Dup) : null);
  }

  /**
   * Sets the file that will be initially selected in
   * the file chooser dialog.
   * This function is a shortcut for calling both
   * [gtk.file_dialog.FileDialog.setInitialFolder] and
   * [gtk.file_dialog.FileDialog.setInitialName] with the directory and
   * name of file respectively.
   * Params:
   *   file = a `GFile`
   */
  void setInitialFile(gio.file.File file)
  {
    gtk_file_dialog_set_initial_file(cast(GtkFileDialog*)cPtr, file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
  }

  /**
   * Sets the folder that will be set as the
   * initial folder in the file chooser dialog.
   * Params:
   *   folder = a `GFile`
   */
  void setInitialFolder(gio.file.File folder)
  {
    gtk_file_dialog_set_initial_folder(cast(GtkFileDialog*)cPtr, folder ? cast(GFile*)(cast(ObjectG)folder).cPtr(No.Dup) : null);
  }

  /**
   * Sets the name for the file that should be initially set.
   * For saving dialogs, this will usually be pre-entered into the name field.
   * If a file with this name already exists in the directory set via
   * propertyGtk.FileDialog:initial-folder, the dialog should preselect it.
   * Params:
   *   name = a UTF8 string
   */
  void setInitialName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_file_dialog_set_initial_name(cast(GtkFileDialog*)cPtr, _name);
  }

  /**
   * Sets whether the file chooser dialog
   * blocks interaction with the parent window
   * while it is presented.
   * Params:
   *   modal = the new value
   */
  void setModal(bool modal)
  {
    gtk_file_dialog_set_modal(cast(GtkFileDialog*)cPtr, modal);
  }

  /**
   * Sets the title that will be shown on the
   * file chooser dialog.
   * Params:
   *   title = the new title
   */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_file_dialog_set_title(cast(GtkFileDialog*)cPtr, _title);
  }
}
