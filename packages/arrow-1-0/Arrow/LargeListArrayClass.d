module Arrow.LargeListArrayClass;

import Arrow.ArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeListArrayClass
{
  GArrowLargeListArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeListArrayClass");

    cInstance = *cast(GArrowLargeListArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayClass parentClass()
  {
    return new ArrayClass(cast(GArrowArrayClass*)&(cast(GArrowLargeListArrayClass*)cPtr).parentClass);
  }
}
