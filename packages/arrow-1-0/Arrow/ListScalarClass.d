module Arrow.ListScalarClass;

import Arrow.BaseListScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ListScalarClass
{
  GArrowListScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ListScalarClass");

    cInstance = *cast(GArrowListScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BaseListScalarClass parentClass()
  {
    return new BaseListScalarClass(cast(GArrowBaseListScalarClass*)&(cast(GArrowListScalarClass*)cPtr).parentClass);
  }
}
