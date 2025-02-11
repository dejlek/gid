module Arrow.MonthDayNanoIntervalScalarClass;

import Arrow.ScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MonthDayNanoIntervalScalarClass
{
  GArrowMonthDayNanoIntervalScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MonthDayNanoIntervalScalarClass");

    cInstance = *cast(GArrowMonthDayNanoIntervalScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ScalarClass parentClass()
  {
    return new ScalarClass(cast(GArrowScalarClass*)&(cast(GArrowMonthDayNanoIntervalScalarClass*)cPtr).parentClass);
  }
}
