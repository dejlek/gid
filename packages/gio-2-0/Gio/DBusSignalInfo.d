module Gio.DBusSignalInfo;

import GObject.Boxed;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Information about a signal on a D-Bus interface.
 */
class DBusSignalInfo : Boxed
{

  this()
  {
    super(safeMalloc(GDBusSignalInfo.sizeof), Yes.Take);
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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_signal_info_get_type != &gidSymbolNotFound ? g_dbus_signal_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
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
    return (cast(GDBusSignalInfo*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusSignalInfo*)cPtr).name);
    (cast(GDBusSignalInfo*)cPtr).name = propval.toCString(Yes.Alloc);
  }
}
