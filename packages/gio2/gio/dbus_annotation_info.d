/// Module for [DBusAnnotationInfo] class
module gio.dbus_annotation_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about an annotation.
*/
class DBusAnnotationInfo : gobject.boxed.Boxed
{

  /** */
  this()
  {
    super(gMalloc(GDBusAnnotationInfo.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_annotation_info_get_type != &gidSymbolNotFound ? g_dbus_annotation_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override DBusAnnotationInfo self()
  {
    return this;
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
    return cToD!(string)(cast(void*)(cast(GDBusAnnotationInfo*)cPtr).key);
  }

  @property void key(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusAnnotationInfo*)cPtr).key);
    dToC(propval, cast(void*)&(cast(GDBusAnnotationInfo*)cPtr).key);
  }

  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(GDBusAnnotationInfo*)cPtr).value);
  }

  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusAnnotationInfo*)cPtr).value);
    dToC(propval, cast(void*)&(cast(GDBusAnnotationInfo*)cPtr).value);
  }

  /**
      Looks up the value of an annotation.
      
      The cost of this function is O(n) in number of annotations.
  
      Params:
        annotations = A null-terminated array of annotations or null.
        name = The name of the annotation to look up.
      Returns: The value or null if not found. Do not free, it is owned by annotations.
  */
  static string lookup(gio.dbus_annotation_info.DBusAnnotationInfo[] annotations, string name)
  {
    const(char)* _cretval;
    GDBusAnnotationInfo*[] _tmpannotations;
    foreach (obj; annotations)
      _tmpannotations ~= cast(GDBusAnnotationInfo*)obj.cPtr;
    _tmpannotations.length++;
    GDBusAnnotationInfo** _annotations = _tmpannotations.ptr;

    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_dbus_annotation_info_lookup(_annotations, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}
