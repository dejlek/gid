module gio.dbus_annotation_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
 * Information about an annotation.
 */
class DBusAnnotationInfo : Boxed
{

  this()
  {
    super(safeMalloc(GDBusAnnotationInfo.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_annotation_info_get_type != &gidSymbolNotFound ? g_dbus_annotation_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property int refCount()
  {
    return (cast(GDBusAnnotationInfo*)cPtr).refCount;
  }

  @property void refCount(int propval)
  {
    (cast(GDBusAnnotationInfo*)cPtr).refCount = propval;
  }

  @property string key()
  {
    return (cast(GDBusAnnotationInfo*)cPtr).key.fromCString(No.Free);
  }

  @property void key(string propval)
  {
    safeFree(cast(void*)(cast(GDBusAnnotationInfo*)cPtr).key);
    (cast(GDBusAnnotationInfo*)cPtr).key = propval.toCString(Yes.Alloc);
  }

  @property string value()
  {
    return (cast(GDBusAnnotationInfo*)cPtr).value.fromCString(No.Free);
  }

  @property void value(string propval)
  {
    safeFree(cast(void*)(cast(GDBusAnnotationInfo*)cPtr).value);
    (cast(GDBusAnnotationInfo*)cPtr).value = propval.toCString(Yes.Alloc);
  }

  /**
   * Looks up the value of an annotation.
   * The cost of this function is O$(LPAREN)n$(RPAREN) in number of annotations.
   * Params:
   *   annotations = A %NULL-terminated array of annotations or %NULL.
   *   name = The name of the annotation to look up.
   * Returns: The value or %NULL if not found. Do not free, it is owned by annotations.
   */
  static string lookup(DBusAnnotationInfo[] annotations, string name)
  {
    const(char)* _cretval;
    GDBusAnnotationInfo*[] _tmpannotations;
    foreach (obj; annotations)
      _tmpannotations ~= cast(GDBusAnnotationInfo*)obj.cPtr;
    _tmpannotations.length++;
    GDBusAnnotationInfo** _annotations = _tmpannotations.ptr;

    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_annotation_info_lookup(_annotations, _name);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }
}
