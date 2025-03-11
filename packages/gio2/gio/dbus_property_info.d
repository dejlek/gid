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
    super(gMalloc(GDBusPropertyInfo.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
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
    return cToD!(string)(cast(void*)(cast(GDBusPropertyInfo*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusPropertyInfo*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusPropertyInfo*)cPtr).name);
  }

  @property string signature()
  {
    return cToD!(string)(cast(void*)(cast(GDBusPropertyInfo*)cPtr).signature);
  }

  @property void signature(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusPropertyInfo*)cPtr).signature);
    dToC(propval, cast(void*)&(cast(GDBusPropertyInfo*)cPtr).signature);
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
