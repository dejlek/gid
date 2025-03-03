module gio.dbus_property_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
 * Information about a D-Bus property on a D-Bus interface.
 */
class DBusPropertyInfo : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GDBusPropertyInfo.sizeof), Yes.Take);
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
    return cast(void function())g_dbus_property_info_get_type != &gidSymbolNotFound ? g_dbus_property_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property int refCount()
  {
    return (cast(GDBusPropertyInfo*)cPtr).refCount;
  }

  @property void refCount(int propval)
  {
    (cast(GDBusPropertyInfo*)cPtr).refCount = propval;
  }

  @property string name()
  {
    return (cast(GDBusPropertyInfo*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusPropertyInfo*)cPtr).name);
    (cast(GDBusPropertyInfo*)cPtr).name = propval.toCString(Yes.Alloc);
  }

  @property string signature()
  {
    return (cast(GDBusPropertyInfo*)cPtr).signature.fromCString(No.Free);
  }

  @property void signature(string propval)
  {
    safeFree(cast(void*)(cast(GDBusPropertyInfo*)cPtr).signature);
    (cast(GDBusPropertyInfo*)cPtr).signature = propval.toCString(Yes.Alloc);
  }

  @property gio.types.DBusPropertyInfoFlags flags()
  {
    return cast(gio.types.DBusPropertyInfoFlags)(cast(GDBusPropertyInfo*)cPtr).flags;
  }

  @property void flags(gio.types.DBusPropertyInfoFlags propval)
  {
    (cast(GDBusPropertyInfo*)cPtr).flags = cast(GDBusPropertyInfoFlags)propval;
  }
}
