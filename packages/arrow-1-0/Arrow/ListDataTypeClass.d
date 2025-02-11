module Arrow.ListDataTypeClass;

import Arrow.DataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ListDataTypeClass
{
  GArrowListDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ListDataTypeClass");

    cInstance = *cast(GArrowListDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DataTypeClass parentClass()
  {
    return new DataTypeClass(cast(GArrowDataTypeClass*)&(cast(GArrowListDataTypeClass*)cPtr).parentClass);
  }
}
