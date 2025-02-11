module Arrow.Decimal64ArrayClass;

import Arrow.FixedSizeBinaryArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal64ArrayClass
{
  GArrowDecimal64ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal64ArrayClass");

    cInstance = *cast(GArrowDecimal64ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayClass parentClass()
  {
    return new FixedSizeBinaryArrayClass(cast(GArrowFixedSizeBinaryArrayClass*)&(cast(GArrowDecimal64ArrayClass*)cPtr).parentClass);
  }
}
