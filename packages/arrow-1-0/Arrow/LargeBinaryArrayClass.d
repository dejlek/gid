module Arrow.LargeBinaryArrayClass;

import Arrow.ArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeBinaryArrayClass
{
  GArrowLargeBinaryArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeBinaryArrayClass");

    cInstance = *cast(GArrowLargeBinaryArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayClass parentClass()
  {
    return new ArrayClass(cast(GArrowArrayClass*)&(cast(GArrowLargeBinaryArrayClass*)cPtr).parentClass);
  }
}
