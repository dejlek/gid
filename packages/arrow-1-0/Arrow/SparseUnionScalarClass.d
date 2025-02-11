module Arrow.SparseUnionScalarClass;

import Arrow.Types;
import Arrow.UnionScalarClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SparseUnionScalarClass
{
  GArrowSparseUnionScalarClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.SparseUnionScalarClass");

    cInstance = *cast(GArrowSparseUnionScalarClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionScalarClass parentClass()
  {
    return new UnionScalarClass(cast(GArrowUnionScalarClass*)&(cast(GArrowSparseUnionScalarClass*)cPtr).parentClass);
  }
}
