module Arrow.Decimal128DataTypeClass;

import Arrow.DecimalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal128DataTypeClass
{
  GArrowDecimal128DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal128DataTypeClass");

    cInstance = *cast(GArrowDecimal128DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DecimalDataTypeClass parentClass()
  {
    return new DecimalDataTypeClass(cast(GArrowDecimalDataTypeClass*)&(cast(GArrowDecimal128DataTypeClass*)cPtr).parentClass);
  }
}
