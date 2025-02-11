module Arrow.Decimal128ArrayClass;

import Arrow.FixedSizeBinaryArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal128ArrayClass
{
  GArrowDecimal128ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal128ArrayClass");

    cInstance = *cast(GArrowDecimal128ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayClass parentClass()
  {
    return new FixedSizeBinaryArrayClass(cast(GArrowFixedSizeBinaryArrayClass*)&(cast(GArrowDecimal128ArrayClass*)cPtr).parentClass);
  }
}
