module Arrow.UInt64DataTypeClass;

import Arrow.IntegerDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt64DataTypeClass
{
  GArrowUInt64DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UInt64DataTypeClass");

    cInstance = *cast(GArrowUInt64DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntegerDataTypeClass parentClass()
  {
    return new IntegerDataTypeClass(cast(GArrowIntegerDataTypeClass*)&(cast(GArrowUInt64DataTypeClass*)cPtr).parentClass);
  }
}
