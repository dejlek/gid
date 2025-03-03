module gtk.buildable_mixin;

public import gtk.buildable_iface_proxy;
public import gid.gid;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * `GtkBuildable` allows objects to extend and customize their deserialization
 * from ui files.
 * The interface includes methods for setting names and properties of objects,
 * parsing custom tags and constructing child objects.
 * The `GtkBuildable` interface is implemented by all widgets and
 * many of the non-widget objects that are provided by GTK. The
 * main user of this interface is [gtk.builder.Builder]. There should be
 * very little need for applications to call any of these functions directly.
 * An object only needs to implement this interface if it needs to extend the
 * `GtkBuilder` XML format or run any extra routines at deserialization time.
 */
template BuildableT()
{

  /**
   * Gets the ID of the buildable object.
   * `GtkBuilder` sets the name based on the ID attribute
   * of the `<object>` tag used to construct the buildable.
   * Returns: the ID of the buildable object
   */
  override string getBuildableId()
  {
    const(char)* _cretval;
    _cretval = gtk_buildable_get_buildable_id(cast(GtkBuildable*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
