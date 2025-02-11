module Arrow.Date32DataTypeClass;

import Arrow.TemporalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Date32DataTypeClass
{
  GArrowDate32DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Date32DataTypeClass");

    cInstance = *cast(GArrowDate32DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TemporalDataTypeClass parentClass()
  {
    return new TemporalDataTypeClass(cast(GArrowTemporalDataTypeClass*)&(cast(GArrowDate32DataTypeClass*)cPtr).parentClass);
  }
}
