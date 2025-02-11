module Arrow.LargeStringDataTypeClass;

import Arrow.LargeBinaryDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeStringDataTypeClass
{
  GArrowLargeStringDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeStringDataTypeClass");

    cInstance = *cast(GArrowLargeStringDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property LargeBinaryDataTypeClass parentClass()
  {
    return new LargeBinaryDataTypeClass(cast(GArrowLargeBinaryDataTypeClass*)&(cast(GArrowLargeStringDataTypeClass*)cPtr).parentClass);
  }
}
