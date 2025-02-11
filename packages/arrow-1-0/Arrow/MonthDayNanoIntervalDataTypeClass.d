module Arrow.MonthDayNanoIntervalDataTypeClass;

import Arrow.IntervalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MonthDayNanoIntervalDataTypeClass
{
  GArrowMonthDayNanoIntervalDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MonthDayNanoIntervalDataTypeClass");

    cInstance = *cast(GArrowMonthDayNanoIntervalDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntervalDataTypeClass parentClass()
  {
    return new IntervalDataTypeClass(cast(GArrowIntervalDataTypeClass*)&(cast(GArrowMonthDayNanoIntervalDataTypeClass*)cPtr).parentClass);
  }
}
