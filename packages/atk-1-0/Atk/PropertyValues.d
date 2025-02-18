module Atk.PropertyValues;

import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.Value;
import Gid.gid;

/**
 * Note: @old_value field of #AtkPropertyValues will not contain a
 * valid value. This is a field defined with the purpose of contain
 * the previous value of the property, but is not used anymore.
 */
class PropertyValues
{
  AtkPropertyValues cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Atk.PropertyValues");

    cInstance = *cast(AtkPropertyValues*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string propertyName()
  {
    return (cast(AtkPropertyValues*)cPtr).propertyName.fromCString(No.Free);
  }

  @property void propertyName(string propval)
  {
    safeFree(cast(void*)(cast(AtkPropertyValues*)cPtr).propertyName);
    (cast(AtkPropertyValues*)cPtr).propertyName = propval.toCString(Yes.Alloc);
  }

  @property Value oldValue()
  {
    return new Value(cast(GValue*)&(cast(AtkPropertyValues*)cPtr).oldValue);
  }

  @property Value newValue()
  {
    return new Value(cast(GValue*)&(cast(AtkPropertyValues*)cPtr).newValue);
  }
}
