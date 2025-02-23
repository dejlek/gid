module gio.dbus_arg_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
 * Information about an argument for a method or a signal.
 */
class DBusArgInfo : Boxed
{

  this()
  {
    super(safeMalloc(GDBusArgInfo.sizeof), Yes.Take);
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
    return cast(void function())g_dbus_arg_info_get_type != &gidSymbolNotFound ? g_dbus_arg_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property int refCount()
  {
    return (cast(GDBusArgInfo*)cPtr).refCount;
  }

  @property void refCount(int propval)
  {
    (cast(GDBusArgInfo*)cPtr).refCount = propval;
  }

  @property string name()
  {
    return (cast(GDBusArgInfo*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusArgInfo*)cPtr).name);
    (cast(GDBusArgInfo*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string signature()
  {
    return (cast(GDBusArgInfo*)cPtr).signature.fromCString(No.Free);
  }

  @property void signature(string propval)
  {
    safeFree(cast(void*)(cast(GDBusArgInfo*)cPtr).signature);
    (cast(GDBusArgInfo*)cPtr).signature = propval.toCString(Yes.Alloc);
  }
}
