module Arrow.Decimal128ScalarClass;

import Arrow.ScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal128ScalarClass
{
  GArrowDecimal128ScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal128ScalarClass");

    cInstance = *cast(GArrowDecimal128ScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ScalarClass parentClass()
  {
    return new ScalarClass(cast(GArrowScalarClass*)&(cast(GArrowDecimal128ScalarClass*)cPtr).parentClass);
  }
}
