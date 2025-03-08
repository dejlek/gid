module gio.dbus_property_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about a D-Bus property on a D-Bus interface.
*/
class DBusPropertyInfo : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GDBusPropertyInfo.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_property_info_get_type != &gidSymbolNotFound ? g_dbus_property_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
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
    return (cast(GDBusPropertyInfo*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusPropertyInfo*)cPtr).name);
    (cast(GDBusPropertyInfo*)cPtr).name = propval.toCString(Yes.alloc);
  }

  @property string signature()
  {
    return (cast(GDBusPropertyInfo*)cPtr).signature.fromCString(No.free);
  }

  @property void signature(string propval)
  {
    safeFree(cast(void*)(cast(GDBusPropertyInfo*)cPtr).signature);
    (cast(GDBusPropertyInfo*)cPtr).signature = propval.toCString(Yes.alloc);
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
