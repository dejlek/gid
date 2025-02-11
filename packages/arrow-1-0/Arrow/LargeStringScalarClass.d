module Arrow.LargeStringScalarClass;

import Arrow.BaseBinaryScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeStringScalarClass
{
  GArrowLargeStringScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeStringScalarClass");

    cInstance = *cast(GArrowLargeStringScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BaseBinaryScalarClass parentClass()
  {
    return new BaseBinaryScalarClass(cast(GArrowBaseBinaryScalarClass*)&(cast(GArrowLargeStringScalarClass*)cPtr).parentClass);
  }
}
