module gio.dbus_error_entry;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    Struct used in [gio.global.dbusErrorRegisterErrorDomain].
*/
class DBusErrorEntry
{
  GDBusErrorEntry cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DBusErrorEntry");

    cInstance = *cast(GDBusErrorEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int errorCode()
  {
    return (cast(GDBusErrorEntry*)cPtr).errorCode;
  }

  @property void errorCode(int propval)
  {
    (cast(GDBusErrorEntry*)cPtr).errorCode = propval;
  }

  @property string dbusErrorName()
  {
    return cToD!(string)(cast(void*)(cast(GDBusErrorEntry*)cPtr).dbusErrorName);
  }

  @property void dbusErrorName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GDBusErrorEntry*)cPtr).dbusErrorName);
    dToC(propval, cast(void*)&(cast(GDBusErrorEntry*)cPtr).dbusErrorName);
  }
}
