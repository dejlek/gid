module Arrow.TimeDataTypeClass;

import Arrow.TemporalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TimeDataTypeClass
{
  GArrowTimeDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.TimeDataTypeClass");

    cInstance = *cast(GArrowTimeDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TemporalDataTypeClass parentClass()
  {
    return new TemporalDataTypeClass(cast(GArrowTemporalDataTypeClass*)&(cast(GArrowTimeDataTypeClass*)cPtr).parentClass);
  }
}
