/// Module for [EnumValue] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.enum_value.EnumValue");

    cInstance = *cast(GEnumValue*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `value` field.
      Returns: the enum value
  */
  @property int value()
  {
    return (cast(GEnumValue*)cPtr).value;
  }

  /**
      Set `value` field.
      Params:
        propval = the enum value
  */
  @property void value(int propval)
  {
    (cast(GEnumValue*)cPtr).value = propval;
  }

  /**
      Get `valueName` field.
      Returns: the name of the value
  */
  @property string valueName()
  {
    return cToD!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueName);
  }

  /**
      Set `valueName` field.
      Params:
        propval = the name of the value
  */
  @property void valueName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueName);
    dToC(propval, cast(void*)&(cast(GEnumValue*)cPtr).valueName);
  }

  /**
      Get `valueNick` field.
      Returns: the nickname of the value
  */
  @property string valueNick()
  {
    return cToD!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueNick);
  }

  /**
      Set `valueNick` field.
      Params:
        propval = the nickname of the value
  */
  @property void valueNick(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GEnumValue*)cPtr).valueNick);
    dToC(propval, cast(void*)&(cast(GEnumValue*)cPtr).valueNick);
  }
}
