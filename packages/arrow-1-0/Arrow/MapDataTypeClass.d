module Arrow.MapDataTypeClass;

import Arrow.ListDataTypeClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MapDataTypeClass
{
  GArrowMapDataTypeClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MapDataTypeClass");

    cInstance = *cast(GArrowMapDataTypeClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ListDataTypeClass parentClass()
  {
    return new ListDataTypeClass(cast(GArrowListDataTypeClass*)&(cast(GArrowMapDataTypeClass*)cPtr).parentClass);
  }
}
