module Arrow.Decimal64DataTypeClass;

import Arrow.DecimalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal64DataTypeClass
{
  GArrowDecimal64DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal64DataTypeClass");

    cInstance = *cast(GArrowDecimal64DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DecimalDataTypeClass parentClass()
  {
    return new DecimalDataTypeClass(cast(GArrowDecimalDataTypeClass*)&(cast(GArrowDecimal64DataTypeClass*)cPtr).parentClass);
  }
}
