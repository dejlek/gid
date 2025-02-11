module Arrow.DenseUnionScalarClass;

import Arrow.Types;
import Arrow.UnionScalarClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DenseUnionScalarClass
{
  GArrowDenseUnionScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DenseUnionScalarClass");

    cInstance = *cast(GArrowDenseUnionScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionScalarClass parentClass()
  {
    return new UnionScalarClass(cast(GArrowUnionScalarClass*)&(cast(GArrowDenseUnionScalarClass*)cPtr).parentClass);
  }
}
