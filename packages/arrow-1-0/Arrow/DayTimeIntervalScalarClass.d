module Arrow.DayTimeIntervalScalarClass;

import Arrow.ScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DayTimeIntervalScalarClass
{
  GArrowDayTimeIntervalScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DayTimeIntervalScalarClass");

    cInstance = *cast(GArrowDayTimeIntervalScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ScalarClass parentClass()
  {
    return new ScalarClass(cast(GArrowScalarClass*)&(cast(GArrowDayTimeIntervalScalarClass*)cPtr).parentClass);
  }
}
