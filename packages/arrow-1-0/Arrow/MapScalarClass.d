module Arrow.MapScalarClass;

import Arrow.BaseListScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MapScalarClass
{
  GArrowMapScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MapScalarClass");

    cInstance = *cast(GArrowMapScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BaseListScalarClass parentClass()
  {
    return new BaseListScalarClass(cast(GArrowBaseListScalarClass*)&(cast(GArrowMapScalarClass*)cPtr).parentClass);
  }
}
