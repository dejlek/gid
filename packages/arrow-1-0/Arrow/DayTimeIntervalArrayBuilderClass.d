module Arrow.DayTimeIntervalArrayBuilderClass;

import Arrow.ArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DayTimeIntervalArrayBuilderClass
{
  GArrowDayTimeIntervalArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DayTimeIntervalArrayBuilderClass");

    cInstance = *cast(GArrowDayTimeIntervalArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayBuilderClass parentClass()
  {
    return new ArrayBuilderClass(cast(GArrowArrayBuilderClass*)&(cast(GArrowDayTimeIntervalArrayBuilderClass*)cPtr).parentClass);
  }
}
