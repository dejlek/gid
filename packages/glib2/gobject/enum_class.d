module gobject.enum_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.enum_value;
import gobject.types;

/**
    The class of an enumeration type holds information about its
  possible values.
*/
class EnumClass
{
  GEnumClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.EnumClass");

    cInstance = *cast(GEnumClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int minimum()
  {
    return (cast(GEnumClass*)cPtr).minimum;
  }

  @property void minimum(int propval)
  {
    (cast(GEnumClass*)cPtr).minimum = propval;
  }

  @property int maximum()
  {
    return (cast(GEnumClass*)cPtr).maximum;
  }

  @property void maximum(int propval)
  {
    (cast(GEnumClass*)cPtr).maximum = propval;
  }

  @property uint nValues()
  {
    return (cast(GEnumClass*)cPtr).nValues;
  }

  @property void nValues(uint propval)
  {
    (cast(GEnumClass*)cPtr).nValues = propval;
  }

  @property gobject.enum_value.EnumValue values()
  {
    return new gobject.enum_value.EnumValue(cast(GEnumValue*)(cast(GEnumClass*)cPtr).values);
  }
}
