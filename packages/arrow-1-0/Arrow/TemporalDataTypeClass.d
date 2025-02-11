module Arrow.TemporalDataTypeClass;

import Arrow.FixedWidthDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TemporalDataTypeClass
{
  GArrowTemporalDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.TemporalDataTypeClass");

    cInstance = *cast(GArrowTemporalDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedWidthDataTypeClass parentClass()
  {
    return new FixedWidthDataTypeClass(cast(GArrowFixedWidthDataTypeClass*)&(cast(GArrowTemporalDataTypeClass*)cPtr).parentClass);
  }
}
