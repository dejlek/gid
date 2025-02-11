module Arrow.HalfFloatDataTypeClass;

import Arrow.FloatingPointDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class HalfFloatDataTypeClass
{
  GArrowHalfFloatDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.HalfFloatDataTypeClass");

    cInstance = *cast(GArrowHalfFloatDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FloatingPointDataTypeClass parentClass()
  {
    return new FloatingPointDataTypeClass(cast(GArrowFloatingPointDataTypeClass*)&(cast(GArrowHalfFloatDataTypeClass*)cPtr).parentClass);
  }
}
