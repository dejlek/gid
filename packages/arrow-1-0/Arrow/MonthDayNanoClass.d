module Arrow.MonthDayNanoClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class MonthDayNanoClass
{
  GArrowMonthDayNanoClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MonthDayNanoClass");

    cInstance = *cast(GArrowMonthDayNanoClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowMonthDayNanoClass*)cPtr).parentClass);
  }
}
