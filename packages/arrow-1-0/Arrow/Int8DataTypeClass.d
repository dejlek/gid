module Arrow.Int8DataTypeClass;

import Arrow.IntegerDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int8DataTypeClass
{
  GArrowInt8DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Int8DataTypeClass");

    cInstance = *cast(GArrowInt8DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntegerDataTypeClass parentClass()
  {
    return new IntegerDataTypeClass(cast(GArrowIntegerDataTypeClass*)&(cast(GArrowInt8DataTypeClass*)cPtr).parentClass);
  }
}
