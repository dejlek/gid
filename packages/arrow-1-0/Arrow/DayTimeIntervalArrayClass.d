module Arrow.DayTimeIntervalArrayClass;

import Arrow.PrimitiveArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DayTimeIntervalArrayClass
{
  GArrowDayTimeIntervalArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DayTimeIntervalArrayClass");

    cInstance = *cast(GArrowDayTimeIntervalArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property PrimitiveArrayClass parentClass()
  {
    return new PrimitiveArrayClass(cast(GArrowPrimitiveArrayClass*)&(cast(GArrowDayTimeIntervalArrayClass*)cPtr).parentClass);
  }
}
