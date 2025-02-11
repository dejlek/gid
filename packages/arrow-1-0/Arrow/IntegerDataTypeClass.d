module Arrow.IntegerDataTypeClass;

import Arrow.NumericDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class IntegerDataTypeClass
{
  GArrowIntegerDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.IntegerDataTypeClass");

    cInstance = *cast(GArrowIntegerDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property NumericDataTypeClass parentClass()
  {
    return new NumericDataTypeClass(cast(GArrowNumericDataTypeClass*)&(cast(GArrowIntegerDataTypeClass*)cPtr).parentClass);
  }
}
