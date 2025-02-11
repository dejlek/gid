module Arrow.DayTimeIntervalDataTypeClass;

import Arrow.IntervalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DayTimeIntervalDataTypeClass
{
  GArrowDayTimeIntervalDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DayTimeIntervalDataTypeClass");

    cInstance = *cast(GArrowDayTimeIntervalDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntervalDataTypeClass parentClass()
  {
    return new IntervalDataTypeClass(cast(GArrowIntervalDataTypeClass*)&(cast(GArrowDayTimeIntervalDataTypeClass*)cPtr).parentClass);
  }
}
