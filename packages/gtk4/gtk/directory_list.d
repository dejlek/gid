module gtk.directory_list;

import gid.gid;
import gio.file;
import gio.list_model;
import gio.list_model_mixin;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * `GtkDirectoryList` is a list model that wraps [gio.file.File.enumerateChildrenAsync].
 * It presents a `GListModel` and fills it asynchronously with the `GFileInfo`s
 * returned from that function.
 * Enumeration will start automatically when the
 * [gtk.directory_list.DirectoryList.Gio.File] property is set.
 * While the `GtkDirectoryList` is being filled, the
 * [gtk.directory_list.DirectoryList.gboolean] property will be set to %TRUE. You can
 * listen to that property if you want to show information like a `GtkSpinner`
 * or a "Loading..." text.
 * If loading fails at any point, the [gtk.directory_list.DirectoryList.GLib.Error]
 * property will be set to give more indication about the failure.
 * The `GFileInfo`s returned from a `GtkDirectoryList` have the "standard::file"
 * attribute set to the `GFile` they refer to. This way you can get at the file
 * that is referred to in the same way you would via [gio.file_enumerator.FileEnumerator.getChild].
 * This means you do not need access to the `GtkDirectoryList`, but can access
 * the `GFile` directly from the `GFileInfo` when operating with a `GtkListView`
 * or similar.
 */
class DirectoryList : gobject.object.ObjectG, gio.list_model.ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_directory_list_get_type != &gidSymbolNotFound ? gtk_directory_list_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();

  /**
   * Creates a new `GtkDirectoryList`.
   * The `GtkDirectoryList` is querying the given file
   * with the given attributes.
   * Params:
   *   attributes = The attributes to query with
   *   file = The file to query
   * Returns: a new `GtkDirectoryList`
   */
  this(string attributes = null, gio.file.File file = null)
  {
    GtkDirectoryList* _cretval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
    _cretval = gtk_directory_list_new(_attributes, file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the attributes queried on the children.
   * Returns: The queried attributes
   */
  string getAttributes()
  {
    const(char)* _cretval;
    _cretval = gtk_directory_list_get_attributes(cast(GtkDirectoryList*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the loading error, if any.
   * If an error occurs during the loading process, the loading process
   * will finish and this property allows querying the error that happened.
   * This error will persist until a file is loaded again.
   * An error being set does not mean that no files were loaded, and all
   * successfully queried files will remain in the list.
   * Returns: The loading error or %NULL if
   *   loading finished successfully
   */
  glib.error.ErrorG getError()
  {
    const(GError)* _cretval;
    _cretval = gtk_directory_list_get_error(cast(GtkDirectoryList*)cPtr);
    auto _retval = _cretval ? new glib.error.ErrorG(cast(GError*)_cretval) : null;
    return _retval;
  }

  /**
   * Gets the file whose children are currently enumerated.
   * Returns: The file whose children are enumerated
   */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_directory_list_get_file(cast(GtkDirectoryList*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the IO priority set via [gtk.directory_list.DirectoryList.setIoPriority].
   * Returns: The IO priority.
   */
  int getIoPriority()
  {
    int _retval;
    _retval = gtk_directory_list_get_io_priority(cast(GtkDirectoryList*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the directory list is monitoring
   * the directory for changes.
   * Returns: %TRUE if the directory is monitored
   */
  bool getMonitored()
  {
    bool _retval;
    _retval = gtk_directory_list_get_monitored(cast(GtkDirectoryList*)cPtr);
    return _retval;
  }

  /**
   * Returns %TRUE if the children enumeration is currently in
   * progress.
   * Files will be added to self from time to time while loading is
   * going on. The order in which are added is undefined and may change
   * in between runs.
   * Returns: %TRUE if self is loading
   */
  bool isLoading()
  {
    bool _retval;
    _retval = gtk_directory_list_is_loading(cast(GtkDirectoryList*)cPtr);
    return _retval;
  }

  /**
   * Sets the attributes to be enumerated and starts the enumeration.
   * If attributes is %NULL, the list of file infos will still be created, it will just
   * not contain any extra attributes.
   * Params:
   *   attributes = the attributes to enumerate
   */
  void setAttributes(string attributes = null)
  {
    const(char)* _attributes = attributes.toCString(No.Alloc);
    gtk_directory_list_set_attributes(cast(GtkDirectoryList*)cPtr, _attributes);
  }

  /**
   * Sets the file to be enumerated and starts the enumeration.
   * If file is %NULL, the result will be an empty list.
   * Params:
   *   file = the `GFile` to be enumerated
   */
  void setFile(gio.file.File file = null)
  {
    gtk_directory_list_set_file(cast(GtkDirectoryList*)cPtr, file ? cast(GFile*)(cast(ObjectG)file).cPtr(No.Dup) : null);
  }

  /**
   * Sets the IO priority to use while loading directories.
   * Setting the priority while self is loading will reprioritize the
   * ongoing load as soon as possible.
   * The default IO priority is %G_PRIORITY_DEFAULT, which is higher than
   * the GTK redraw priority. If you are loading a lot of directories in
   * parallel, lowering it to something like %G_PRIORITY_DEFAULT_IDLE
   * may increase responsiveness.
   * Params:
   *   ioPriority = IO priority to use
   */
  void setIoPriority(int ioPriority)
  {
    gtk_directory_list_set_io_priority(cast(GtkDirectoryList*)cPtr, ioPriority);
  }

  /**
   * Sets whether the directory list will monitor the directory
   * for changes.
   * If monitoring is enabled, the ::items-changed signal will
   * be emitted when the directory contents change.
   * When monitoring is turned on after the initial creation
   * of the directory list, the directory is reloaded to avoid
   * missing files that appeared between the initial loading
   * and when monitoring was turned on.
   * Params:
   *   monitored = %TRUE to monitor the directory for changes
   */
  void setMonitored(bool monitored)
  {
    gtk_directory_list_set_monitored(cast(GtkDirectoryList*)cPtr, monitored);
  }
}
