module Arrow.SparseUnionArrayBuilderClass;

import Arrow.Types;
import Arrow.UnionArrayBuilderClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SparseUnionArrayBuilderClass
{
  GArrowSparseUnionArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.SparseUnionArrayBuilderClass");

    cInstance = *cast(GArrowSparseUnionArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionArrayBuilderClass parentClass()
  {
    return new UnionArrayBuilderClass(cast(GArrowUnionArrayBuilderClass*)&(cast(GArrowSparseUnionArrayBuilderClass*)cPtr).parentClass);
  }
}
