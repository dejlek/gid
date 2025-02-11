module Arrow.IntervalDataTypeClass;

import Arrow.TimeDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class IntervalDataTypeClass
{
  GArrowIntervalDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.IntervalDataTypeClass");

    cInstance = *cast(GArrowIntervalDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TimeDataTypeClass parentClass()
  {
    return new TimeDataTypeClass(cast(GArrowTimeDataTypeClass*)&(cast(GArrowIntervalDataTypeClass*)cPtr).parentClass);
  }
}
