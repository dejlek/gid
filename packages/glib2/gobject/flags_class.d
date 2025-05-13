/// Module for [FlagsClass] class
module gobject.flags_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.flags_value;
import gobject.type_class;
import gobject.types;

/**
    The class of a flags type holds information about its
    possible values.
*/
class FlagsClass
{
  GFlagsClass cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.flags_class.FlagsClass");

    cInstance = *cast(GFlagsClass*)ptr;

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
    return new gobject.type_class.TypeClass(cast(GTypeClass*)&(cast(GFlagsClass*)this._cPtr).gTypeClass);
  }

  /**
      Get `mask` field.
      Returns: a mask covering all possible values.
  */
  @property uint mask()
  {
    return (cast(GFlagsClass*)this._cPtr).mask;
  }

  /**
      Set `mask` field.
      Params:
        propval = a mask covering all possible values.
  */
  @property void mask(uint propval)
  {
    (cast(GFlagsClass*)this._cPtr).mask = propval;
  }

  /**
      Get `nValues` field.
      Returns: the number of possible values.
  */
  @property uint nValues()
  {
    return (cast(GFlagsClass*)this._cPtr).nValues;
  }

  /**
      Set `nValues` field.
      Params:
        propval = the number of possible values.
  */
  @property void nValues(uint propval)
  {
    (cast(GFlagsClass*)this._cPtr).nValues = propval;
  }

  /**
      Get `values` field.
      Returns: an array of #GFlagsValue structs describing the
       individual values.
  */
  @property gobject.flags_value.FlagsValue values()
  {
    return new gobject.flags_value.FlagsValue(cast(GFlagsValue*)(cast(GFlagsClass*)this._cPtr).values);
  }
}
