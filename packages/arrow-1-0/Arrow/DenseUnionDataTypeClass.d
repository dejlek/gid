module Arrow.DenseUnionDataTypeClass;

import Arrow.Types;
import Arrow.UnionDataTypeClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DenseUnionDataTypeClass
{
  GArrowDenseUnionDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DenseUnionDataTypeClass");

    cInstance = *cast(GArrowDenseUnionDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionDataTypeClass parentClass()
  {
    return new UnionDataTypeClass(cast(GArrowUnionDataTypeClass*)&(cast(GArrowDenseUnionDataTypeClass*)cPtr).parentClass);
  }
}
