module Arrow.BinaryDataTypeClass;

import Arrow.DataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BinaryDataTypeClass
{
  GArrowBinaryDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.BinaryDataTypeClass");

    cInstance = *cast(GArrowBinaryDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DataTypeClass parentClass()
  {
    return new DataTypeClass(cast(GArrowDataTypeClass*)&(cast(GArrowBinaryDataTypeClass*)cPtr).parentClass);
  }
}
