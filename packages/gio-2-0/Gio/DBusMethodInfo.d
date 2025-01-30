module Gio.DBusMethodInfo;

import GLib.Boxed;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Information about a method on an D-Bus interface.
 */
class DBusMethodInfo : Boxed
{

  this()
  {
    super(safeMalloc(GDBusMethodInfo.sizeof), Yes.Take);
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
    return g_dbus_method_info_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  @property int refCount()
  {
    return (cast(GDBusMethodInfo*)cPtr).refCount;
  }

  @property void refCount(int propval)
  {
    (cast(GDBusMethodInfo*)cPtr).refCount = propval;
  }

  @property string name()
  {
    return (cast(GDBusMethodInfo*)cPtr).name.fromCString(No.Free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusMethodInfo*)cPtr).name);
    (cast(GDBusMethodInfo*)cPtr).name = propval.toCString(Yes.Alloc);
  }
}
