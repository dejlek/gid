module Arrow.StringDataTypeClass;

import Arrow.BinaryDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringDataTypeClass
{
  GArrowStringDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StringDataTypeClass");

    cInstance = *cast(GArrowStringDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BinaryDataTypeClass parentClass()
  {
    return new BinaryDataTypeClass(cast(GArrowBinaryDataTypeClass*)&(cast(GArrowStringDataTypeClass*)cPtr).parentClass);
  }
}
