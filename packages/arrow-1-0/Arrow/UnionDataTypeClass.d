module Arrow.UnionDataTypeClass;

import Arrow.DataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UnionDataTypeClass
{
  GArrowUnionDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UnionDataTypeClass");

    cInstance = *cast(GArrowUnionDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DataTypeClass parentClass()
  {
    return new DataTypeClass(cast(GArrowDataTypeClass*)&(cast(GArrowUnionDataTypeClass*)cPtr).parentClass);
  }
}
