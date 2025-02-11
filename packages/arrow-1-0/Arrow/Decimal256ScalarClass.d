module Arrow.Decimal256ScalarClass;

import Arrow.ScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal256ScalarClass
{
  GArrowDecimal256ScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal256ScalarClass");

    cInstance = *cast(GArrowDecimal256ScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ScalarClass parentClass()
  {
    return new ScalarClass(cast(GArrowScalarClass*)&(cast(GArrowDecimal256ScalarClass*)cPtr).parentClass);
  }
}
