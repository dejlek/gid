module gtksource.file;

import gid.gid;
import gio.file;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.encoding;
import gtksource.types;

/**
 * On-disk representation of a class@Buffer.
 * A `GtkSourceFile` object is the on-disk representation of a class@Buffer.
 * With a `GtkSourceFile`, you can create and configure a class@FileLoader
 * and class@FileSaver which take by default the values of the
 * `GtkSourceFile` properties $(LPAREN)except for the file loader which auto-detect some
 * properties$(RPAREN). On a successful load or save operation, the `GtkSourceFile`
 * properties are updated. If an operation fails, the `GtkSourceFile` properties
 * have still the previous valid values.
 */
class File : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_file_get_type != &gidSymbolNotFound ? gtk_source_file_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Checks synchronously the file on disk, to know whether the file is externally
   * modified, or has been deleted, and whether the file is read-only.
   * #GtkSourceFile doesn't create a [gio.file_monitor.FileMonitor] to track those properties, so
   * this function needs to be called instead. Creating lots of [gio.file_monitor.FileMonitor]'s
   * would take lots of resources.
   * Since this function is synchronous, it is advised to call it only on local
   * files. See [gtksource.file.File.isLocal].
   */
  void checkFileOnDisk()
  {
    gtk_source_file_check_file_on_disk(cast(GtkSourceFile*)cPtr);
  }

  gtksource.types.CompressionType getCompressionType()
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_get_compression_type(cast(GtkSourceFile*)cPtr);
    gtksource.types.CompressionType _retval = cast(gtksource.types.CompressionType)_cretval;
    return _retval;
  }

  /**
   * The encoding is initially %NULL. After a successful file loading or saving
   * operation, the encoding is non-%NULL.
   * Returns: the character encoding.
   */
  gtksource.encoding.Encoding getEncoding()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_get_encoding(cast(GtkSourceFile*)cPtr);
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  gio.file.File getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_source_file_get_location(cast(GtkSourceFile*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  gtksource.types.NewlineType getNewlineType()
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_get_newline_type(cast(GtkSourceFile*)cPtr);
    gtksource.types.NewlineType _retval = cast(gtksource.types.NewlineType)_cretval;
    return _retval;
  }

  /**
   * Returns whether the file has been deleted. If the
   * propertyFile:location is %NULL, returns %FALSE.
   * To have an up-to-date value, you must first call
   * [gtksource.file.File.checkFileOnDisk].
   * Returns: whether the file has been deleted.
   */
  bool isDeleted()
  {
    bool _retval;
    _retval = gtk_source_file_is_deleted(cast(GtkSourceFile*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the file is externally modified. If the
   * propertyFile:location is %NULL, returns %FALSE.
   * To have an up-to-date value, you must first call
   * [gtksource.file.File.checkFileOnDisk].
   * Returns: whether the file is externally modified.
   */
  bool isExternallyModified()
  {
    bool _retval;
    _retval = gtk_source_file_is_externally_modified(cast(GtkSourceFile*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the file is local. If the propertyFile:location is %NULL,
   * returns %FALSE.
   * Returns: whether the file is local.
   */
  bool isLocal()
  {
    bool _retval;
    _retval = gtk_source_file_is_local(cast(GtkSourceFile*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the file is read-only. If the
   * propertyFile:location is %NULL, returns %FALSE.
   * To have an up-to-date value, you must first call
   * [gtksource.file.File.checkFileOnDisk].
   * Returns: whether the file is read-only.
   */
  bool isReadonly()
  {
    bool _retval;
    _retval = gtk_source_file_is_readonly(cast(GtkSourceFile*)cPtr);
    return _retval;
  }

  /**
   * Sets the location.
   * Params:
   *   location = the new #GFile, or %NULL.
   */
  void setLocation(gio.file.File location = null)
  {
    gtk_source_file_set_location(cast(GtkSourceFile*)cPtr, location ? cast(GFile*)(cast(ObjectG)location).cPtr(No.Dup) : null);
  }
}
