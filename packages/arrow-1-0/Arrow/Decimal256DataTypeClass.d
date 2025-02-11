module Arrow.Decimal256DataTypeClass;

import Arrow.DecimalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal256DataTypeClass
{
  GArrowDecimal256DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal256DataTypeClass");

    cInstance = *cast(GArrowDecimal256DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DecimalDataTypeClass parentClass()
  {
    return new DecimalDataTypeClass(cast(GArrowDecimalDataTypeClass*)&(cast(GArrowDecimal256DataTypeClass*)cPtr).parentClass);
  }
}
