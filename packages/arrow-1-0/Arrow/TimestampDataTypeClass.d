module Arrow.TimestampDataTypeClass;

import Arrow.TemporalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TimestampDataTypeClass
{
  GArrowTimestampDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.TimestampDataTypeClass");

    cInstance = *cast(GArrowTimestampDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TemporalDataTypeClass parentClass()
  {
    return new TemporalDataTypeClass(cast(GArrowTemporalDataTypeClass*)&(cast(GArrowTimestampDataTypeClass*)cPtr).parentClass);
  }
}
