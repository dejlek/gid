module Arrow.SparseUnionDataTypeClass;

import Arrow.Types;
import Arrow.UnionDataTypeClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SparseUnionDataTypeClass
{
  GArrowSparseUnionDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.SparseUnionDataTypeClass");

    cInstance = *cast(GArrowSparseUnionDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionDataTypeClass parentClass()
  {
    return new UnionDataTypeClass(cast(GArrowUnionDataTypeClass*)&(cast(GArrowSparseUnionDataTypeClass*)cPtr).parentClass);
  }
}
