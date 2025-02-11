module Arrow.FloatDataTypeClass;

import Arrow.FloatingPointDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FloatDataTypeClass
{
  GArrowFloatDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FloatDataTypeClass");

    cInstance = *cast(GArrowFloatDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FloatingPointDataTypeClass parentClass()
  {
    return new FloatingPointDataTypeClass(cast(GArrowFloatingPointDataTypeClass*)&(cast(GArrowFloatDataTypeClass*)cPtr).parentClass);
  }
}
