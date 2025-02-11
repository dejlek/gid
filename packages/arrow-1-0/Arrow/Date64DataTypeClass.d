module Arrow.Date64DataTypeClass;

import Arrow.TemporalDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Date64DataTypeClass
{
  GArrowDate64DataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Date64DataTypeClass");

    cInstance = *cast(GArrowDate64DataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TemporalDataTypeClass parentClass()
  {
    return new TemporalDataTypeClass(cast(GArrowTemporalDataTypeClass*)&(cast(GArrowDate64DataTypeClass*)cPtr).parentClass);
  }
}
