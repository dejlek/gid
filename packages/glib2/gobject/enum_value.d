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
      gFree(ptr);
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
    return cToD!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueName);
  }

  @property void valueName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueName);
    dToC(propval, cast(void*)&(cast(GEnumValue*)cPtr).valueName);
  }

  @property string valueNick()
  {
    return cToD!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueNick);
  }

  @property void valueNick(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueNick);
    dToC(propval, cast(void*)&(cast(GEnumValue*)cPtr).valueNick);
  }
}
