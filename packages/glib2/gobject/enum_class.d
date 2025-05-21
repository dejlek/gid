/// Module for [EnumClass] class
module gobject.enum_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.enum_value;
import gobject.type_class;
import gobject.types;

/**
    The class of an enumeration type holds information about its
    possible values.
*/
class EnumClass
{
  GEnumClass cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.enum_class.EnumClass");

    cInstance = *cast(GEnumClass*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `gTypeClass` field.
      Returns: the parent class
  */
  @property gobject.type_class.TypeClass gTypeClass()
  {
    return new gobject.type_class.TypeClass(cast(GTypeClass*)&(cast(GEnumClass*)this._cPtr).gTypeClass, No.Take);
  }

  /**
      Get `minimum` field.
      Returns: the smallest possible value.
  */
  @property int minimum()
  {
    return (cast(GEnumClass*)this._cPtr).minimum;
  }

  /**
      Set `minimum` field.
      Params:
        propval = the smallest possible value.
  */
  @property void minimum(int propval)
  {
    (cast(GEnumClass*)this._cPtr).minimum = propval;
  }

  /**
      Get `maximum` field.
      Returns: the largest possible value.
  */
  @property int maximum()
  {
    return (cast(GEnumClass*)this._cPtr).maximum;
  }

  /**
      Set `maximum` field.
      Params:
        propval = the largest possible value.
  */
  @property void maximum(int propval)
  {
    (cast(GEnumClass*)this._cPtr).maximum = propval;
  }

  /**
      Get `nValues` field.
      Returns: the number of possible values.
  */
  @property uint nValues()
  {
    return (cast(GEnumClass*)this._cPtr).nValues;
  }

  /**
      Set `nValues` field.
      Params:
        propval = the number of possible values.
  */
  @property void nValues(uint propval)
  {
    (cast(GEnumClass*)this._cPtr).nValues = propval;
  }

  /**
      Get `values` field.
      Returns: an array of #GEnumValue structs describing the
       individual values.
  */
  @property gobject.enum_value.EnumValue values()
  {
    return new gobject.enum_value.EnumValue(cast(GEnumValue*)(cast(GEnumClass*)this._cPtr).values, No.Take);
  }
}
