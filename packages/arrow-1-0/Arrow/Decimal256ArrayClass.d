module Arrow.Decimal256ArrayClass;

import Arrow.FixedSizeBinaryArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal256ArrayClass
{
  GArrowDecimal256ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal256ArrayClass");

    cInstance = *cast(GArrowDecimal256ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayClass parentClass()
  {
    return new FixedSizeBinaryArrayClass(cast(GArrowFixedSizeBinaryArrayClass*)&(cast(GArrowDecimal256ArrayClass*)cPtr).parentClass);
  }
}
