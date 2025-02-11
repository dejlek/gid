module Arrow.FixedSizeBinaryArrayClass;

import Arrow.PrimitiveArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FixedSizeBinaryArrayClass
{
  GArrowFixedSizeBinaryArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FixedSizeBinaryArrayClass");

    cInstance = *cast(GArrowFixedSizeBinaryArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property PrimitiveArrayClass parentClass()
  {
    return new PrimitiveArrayClass(cast(GArrowPrimitiveArrayClass*)&(cast(GArrowFixedSizeBinaryArrayClass*)cPtr).parentClass);
  }
}
