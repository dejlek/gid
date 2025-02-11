module Arrow.StringScalarClass;

import Arrow.BaseBinaryScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringScalarClass
{
  GArrowStringScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StringScalarClass");

    cInstance = *cast(GArrowStringScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BaseBinaryScalarClass parentClass()
  {
    return new BaseBinaryScalarClass(cast(GArrowBaseBinaryScalarClass*)&(cast(GArrowStringScalarClass*)cPtr).parentClass);
  }
}
