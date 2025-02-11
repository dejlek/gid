module Arrow.DecimalDataTypeClass;

import Arrow.FixedSizeBinaryDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DecimalDataTypeClass
{
  GArrowDecimalDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DecimalDataTypeClass");

    cInstance = *cast(GArrowDecimalDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryDataTypeClass parentClass()
  {
    return new FixedSizeBinaryDataTypeClass(cast(GArrowFixedSizeBinaryDataTypeClass*)&(cast(GArrowDecimalDataTypeClass*)cPtr).parentClass);
  }
}
