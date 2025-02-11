module Arrow.Time64DataTypeClass;

import Arrow.TimeDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Time64DataTypeClass
{
  GArrowTime64DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Time64DataTypeClass");

    cInstance = *cast(GArrowTime64DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TimeDataTypeClass parentClass()
  {
    return new TimeDataTypeClass(cast(GArrowTimeDataTypeClass*)&(cast(GArrowTime64DataTypeClass*)cPtr).parentClass);
  }
}
