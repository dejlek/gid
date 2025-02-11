module Arrow.UnionScalarClass;

import Arrow.ScalarClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UnionScalarClass
{
  GArrowUnionScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UnionScalarClass");

    cInstance = *cast(GArrowUnionScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ScalarClass parentClass()
  {
    return new ScalarClass(cast(GArrowScalarClass*)&(cast(GArrowUnionScalarClass*)cPtr).parentClass);
  }
}
