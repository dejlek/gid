module Arrow.Decimal32ScalarClass;

import Arrow.ScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal32ScalarClass
{
  GArrowDecimal32ScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal32ScalarClass");

    cInstance = *cast(GArrowDecimal32ScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ScalarClass parentClass()
  {
    return new ScalarClass(cast(GArrowScalarClass*)&(cast(GArrowDecimal32ScalarClass*)cPtr).parentClass);
  }
}
