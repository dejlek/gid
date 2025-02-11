module Arrow.ListArrayClass;

import Arrow.ArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ListArrayClass
{
  GArrowListArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ListArrayClass");

    cInstance = *cast(GArrowListArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayClass parentClass()
  {
    return new ArrayClass(cast(GArrowArrayClass*)&(cast(GArrowListArrayClass*)cPtr).parentClass);
  }
}
