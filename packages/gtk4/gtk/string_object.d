/// Module for [StringObject] class
module gtk.string_object;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.string_object.StringObject] is the type of items in a [gtk.string_list.StringList].
    
    A [gtk.string_object.StringObject] is a wrapper around a `const char*`; it has
    a [gtk.string_object.StringObject.utf8] property that can be used
    for property bindings and expressions.
*/
class StringObject : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_string_object_get_type != &gidSymbolNotFound ? gtk_string_object_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override StringObject self()
  {
    return this;
  }

  /**
      Wraps a string in an object for use with [gio.list_model.ListModel].
  
      Params:
        string_ = The string to wrap
      Returns: a new [gtk.string_object.StringObject]
  */
  this(string string_)
  {
    GtkStringObject* _cretval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _cretval = gtk_string_object_new(_string_);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the string contained in a [gtk.string_object.StringObject].
      Returns: the string of self
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = gtk_string_object_get_string(cast(GtkStringObject*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
