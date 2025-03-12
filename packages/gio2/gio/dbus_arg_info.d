module gio.dbus_arg_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about an argument for a method or a signal.
*/
class DBusArgInfo : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(GDBusArgInfo.sizeof), Yes.Take);
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
    return cast(void function())g_dbus_arg_info_get_type != &gidSymbolNotFound ? g_dbus_arg_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override DBusArgInfo self()
  {
    return this;
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
    return cToD!(string)(cast(void*)(cast(GDBusArgInfo*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusArgInfo*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GDBusArgInfo*)cPtr).name);
  }

  @property string signature()
  {
    return cToD!(string)(cast(void*)(cast(GDBusArgInfo*)cPtr).signature);
  }

  @property void signature(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusArgInfo*)cPtr).signature);
    dToC(propval, cast(void*)&(cast(GDBusArgInfo*)cPtr).signature);
  }
}
