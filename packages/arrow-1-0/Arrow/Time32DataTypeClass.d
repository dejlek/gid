module Arrow.Time32DataTypeClass;

import Arrow.TimeDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Time32DataTypeClass
{
  GArrowTime32DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Time32DataTypeClass");

    cInstance = *cast(GArrowTime32DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TimeDataTypeClass parentClass()
  {
    return new TimeDataTypeClass(cast(GArrowTimeDataTypeClass*)&(cast(GArrowTime32DataTypeClass*)cPtr).parentClass);
  }
}
