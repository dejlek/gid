module gobject.flags_class;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.flags_value;
import gobject.types;

/**
 * The class of a flags type holds information about its
 * possible values.
 */
class FlagsClass
{
  GFlagsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.FlagsClass");

    cInstance = *cast(GFlagsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint mask()
  {
    return (cast(GFlagsClass*)cPtr).mask;
  }

  @property void mask(uint propval)
  {
    (cast(GFlagsClass*)cPtr).mask = propval;
  }

  @property uint nValues()
  {
    return (cast(GFlagsClass*)cPtr).nValues;
  }

  @property void nValues(uint propval)
  {
    (cast(GFlagsClass*)cPtr).nValues = propval;
  }

  @property gobject.flags_value.FlagsValue values()
  {
    return new gobject.flags_value.FlagsValue(cast(GFlagsValue*)(cast(GFlagsClass*)cPtr).values);
  }
}
