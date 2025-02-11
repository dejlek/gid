module Arrow.Decimal32DataTypeClass;

import Arrow.DecimalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal32DataTypeClass
{
  GArrowDecimal32DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal32DataTypeClass");

    cInstance = *cast(GArrowDecimal32DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DecimalDataTypeClass parentClass()
  {
    return new DecimalDataTypeClass(cast(GArrowDecimalDataTypeClass*)&(cast(GArrowDecimal32DataTypeClass*)cPtr).parentClass);
  }
}
