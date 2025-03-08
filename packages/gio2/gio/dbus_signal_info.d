module gio.dbus_signal_info;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.boxed;

/**
    Information about a signal on a D-Bus interface.
*/
class DBusSignalInfo : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GDBusSignalInfo.sizeof), Yes.take);
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
    return cast(void function())g_dbus_signal_info_get_type != &gidSymbolNotFound ? g_dbus_signal_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property int refCount()
  {
    return (cast(GDBusSignalInfo*)cPtr).refCount;
  }

  @property void refCount(int propval)
  {
    (cast(GDBusSignalInfo*)cPtr).refCount = propval;
  }

  @property string name()
  {
    return (cast(GDBusSignalInfo*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusSignalInfo*)cPtr).name);
    (cast(GDBusSignalInfo*)cPtr).name = propval.toCString(Yes.alloc);
  }
}
