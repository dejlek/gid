module Arrow.DoubleDataTypeClass;

import Arrow.FloatingPointDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DoubleDataTypeClass
{
  GArrowDoubleDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DoubleDataTypeClass");

    cInstance = *cast(GArrowDoubleDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FloatingPointDataTypeClass parentClass()
  {
    return new FloatingPointDataTypeClass(cast(GArrowFloatingPointDataTypeClass*)&(cast(GArrowDoubleDataTypeClass*)cPtr).parentClass);
  }
}
