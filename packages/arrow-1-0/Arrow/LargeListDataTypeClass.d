module Arrow.LargeListDataTypeClass;

import Arrow.DataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeListDataTypeClass
{
  GArrowLargeListDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeListDataTypeClass");

    cInstance = *cast(GArrowLargeListDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DataTypeClass parentClass()
  {
    return new DataTypeClass(cast(GArrowDataTypeClass*)&(cast(GArrowLargeListDataTypeClass*)cPtr).parentClass);
  }
}
