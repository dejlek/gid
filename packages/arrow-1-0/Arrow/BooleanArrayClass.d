module Arrow.BooleanArrayClass;

import Arrow.PrimitiveArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BooleanArrayClass
{
  GArrowBooleanArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.BooleanArrayClass");

    cInstance = *cast(GArrowBooleanArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property PrimitiveArrayClass parentClass()
  {
    return new PrimitiveArrayClass(cast(GArrowPrimitiveArrayClass*)&(cast(GArrowBooleanArrayClass*)cPtr).parentClass);
  }
}
