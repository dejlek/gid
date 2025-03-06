module gobject.enum_value;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure which contains a single enum value, its name, and its
  nickname.
*/
class EnumValue
{
  GEnumValue cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.EnumValue");

    cInstance = *cast(GEnumValue*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int value()
  {
    return (cast(GEnumValue*)cPtr).value;
  }

  @property void value(int propval)
  {
    (cast(GEnumValue*)cPtr).value = propval;
  }

  @property string valueName()
  {
    return (cast(GEnumValue*)cPtr).valueName.fromCString(No.Free);
  }

  @property void valueName(string propval)
  {
    safeFree(cast(void*)(cast(GEnumValue*)cPtr).valueName);
    (cast(GEnumValue*)cPtr).valueName = propval.toCString(Yes.Alloc);
  }

  @property string valueNick()
  {
    return (cast(GEnumValue*)cPtr).valueNick.fromCString(No.Free);
  }

  @property void valueNick(string propval)
  {
    safeFree(cast(void*)(cast(GEnumValue*)cPtr).valueNick);
    (cast(GEnumValue*)cPtr).valueNick = propval.toCString(Yes.Alloc);
  }
}
