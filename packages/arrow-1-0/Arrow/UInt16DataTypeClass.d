module Arrow.UInt16DataTypeClass;

import Arrow.IntegerDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt16DataTypeClass
{
  GArrowUInt16DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UInt16DataTypeClass");

    cInstance = *cast(GArrowUInt16DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntegerDataTypeClass parentClass()
  {
    return new IntegerDataTypeClass(cast(GArrowIntegerDataTypeClass*)&(cast(GArrowUInt16DataTypeClass*)cPtr).parentClass);
  }
}
