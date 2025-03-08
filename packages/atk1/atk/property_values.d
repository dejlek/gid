module atk.property_values;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.value;

/**
    Note: @old_value field of #AtkPropertyValues will not contain a
  valid value. This is a field defined with the purpose of contain
  the previous value of the property, but is not used anymore.
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

  @property gobject.value.Value oldValue()
  {
    return new gobject.value.Value(cast(GValue*)&(cast(AtkPropertyValues*)cPtr).oldValue);
  }

  @property gobject.value.Value newValue()
  {
    return new gobject.value.Value(cast(GValue*)&(cast(AtkPropertyValues*)cPtr).newValue);
  }
}
