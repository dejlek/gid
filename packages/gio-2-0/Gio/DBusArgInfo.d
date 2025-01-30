module Gio.DBusArgInfo;

import GLib.Boxed;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

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
    return g_dbus_arg_info_get_type();
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
