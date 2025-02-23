module gtk.string_object;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * `GtkStringObject` is the type of items in a `GtkStringList`.
 * A `GtkStringObject` is a wrapper around a `const char*`; it has
 * a [Gtk.StringObject.string] property that can be used
 * for property bindings and expressions.
 */
class StringObject : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_string_object_get_type != &gidSymbolNotFound ? gtk_string_object_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Wraps a string in an object for use with `GListModel`.
   * Params:
   *   string_ = The string to wrap
   * Returns: a new `GtkStringObject`
   */
  this(string string_)
  {
    GtkStringObject* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_string_object_new(_string_);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns the string contained in a `GtkStringObject`.
   * Returns: the string of self
   */
  string getString()
  {
    const(char)* _cretval;
    _cretval = gtk_string_object_get_string(cast(GtkStringObject*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }
}
