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
    super(safeMalloc(GDBusArgInfo.sizeof), Yes.take);
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
    return cast(void function())g_dbus_arg_info_get_type != &gidSymbolNotFound ? g_dbus_arg_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
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
    return (cast(GDBusArgInfo*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GDBusArgInfo*)cPtr).name);
    (cast(GDBusArgInfo*)cPtr).name = propval.toCString(Yes.alloc);
  }

  @property string signature()
  {
    return (cast(GDBusArgInfo*)cPtr).signature.fromCString(No.free);
  }

  @property void signature(string propval)
  {
    safeFree(cast(void*)(cast(GDBusArgInfo*)cPtr).signature);
    (cast(GDBusArgInfo*)cPtr).signature = propval.toCString(Yes.alloc);
  }
}
