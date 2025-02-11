module Arrow.LargeListScalarClass;

import Arrow.BaseListScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeListScalarClass
{
  GArrowLargeListScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeListScalarClass");

    cInstance = *cast(GArrowLargeListScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BaseListScalarClass parentClass()
  {
    return new BaseListScalarClass(cast(GArrowBaseListScalarClass*)&(cast(GArrowLargeListScalarClass*)cPtr).parentClass);
  }
}
