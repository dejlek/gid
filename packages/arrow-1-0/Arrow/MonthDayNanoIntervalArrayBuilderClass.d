module Arrow.MonthDayNanoIntervalArrayBuilderClass;

import Arrow.ArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MonthDayNanoIntervalArrayBuilderClass
{
  GArrowMonthDayNanoIntervalArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MonthDayNanoIntervalArrayBuilderClass");

    cInstance = *cast(GArrowMonthDayNanoIntervalArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayBuilderClass parentClass()
  {
    return new ArrayBuilderClass(cast(GArrowArrayBuilderClass*)&(cast(GArrowMonthDayNanoIntervalArrayBuilderClass*)cPtr).parentClass);
  }
}
