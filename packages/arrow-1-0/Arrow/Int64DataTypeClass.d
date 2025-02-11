module Arrow.Int64DataTypeClass;

import Arrow.IntegerDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int64DataTypeClass
{
  GArrowInt64DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Int64DataTypeClass");

    cInstance = *cast(GArrowInt64DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property IntegerDataTypeClass parentClass()
  {
    return new IntegerDataTypeClass(cast(GArrowIntegerDataTypeClass*)&(cast(GArrowInt64DataTypeClass*)cPtr).parentClass);
  }
}
