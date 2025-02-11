module Arrow.UInt8DataTypeClass;

import Arrow.IntegerDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt8DataTypeClass
{
  GArrowUInt8DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UInt8DataTypeClass");

    cInstance = *cast(GArrowUInt8DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntegerDataTypeClass parentClass()
  {
    return new IntegerDataTypeClass(cast(GArrowIntegerDataTypeClass*)&(cast(GArrowUInt8DataTypeClass*)cPtr).parentClass);
  }
}
