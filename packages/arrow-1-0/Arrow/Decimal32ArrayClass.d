module Arrow.Decimal32ArrayClass;

import Arrow.FixedSizeBinaryArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal32ArrayClass
{
  GArrowDecimal32ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal32ArrayClass");

    cInstance = *cast(GArrowDecimal32ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayClass parentClass()
  {
    return new FixedSizeBinaryArrayClass(cast(GArrowFixedSizeBinaryArrayClass*)&(cast(GArrowDecimal32ArrayClass*)cPtr).parentClass);
  }
}
