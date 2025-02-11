module Arrow.MapArrayClass;

import Arrow.ListArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MapArrayClass
{
  GArrowMapArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MapArrayClass");

    cInstance = *cast(GArrowMapArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ListArrayClass parentClass()
  {
    return new ListArrayClass(cast(GArrowListArrayClass*)&(cast(GArrowMapArrayClass*)cPtr).parentClass);
  }
}
