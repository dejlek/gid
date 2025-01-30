module GObject.FlagsClass;

import GObject.FlagsValue;
import GObject.TypeClass;
import GObject.Types;
import GObject.c.functions;
import GObject.c.types;
import Gid.gid;

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

  @property TypeClass gTypeClass()
  {
    return new TypeClass(cast(GTypeClass*)&(cast(GFlagsClass*)cPtr).gTypeClass);
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

  @property FlagsValue values()
  {
    return new FlagsValue(cast(GFlagsValue*)(cast(GFlagsClass*)cPtr).values);
  }
}
