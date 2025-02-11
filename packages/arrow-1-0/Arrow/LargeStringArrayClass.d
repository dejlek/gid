module Arrow.LargeStringArrayClass;

import Arrow.LargeBinaryArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeStringArrayClass
{
  GArrowLargeStringArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeStringArrayClass");

    cInstance = *cast(GArrowLargeStringArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property LargeBinaryArrayClass parentClass()
  {
    return new LargeBinaryArrayClass(cast(GArrowLargeBinaryArrayClass*)&(cast(GArrowLargeStringArrayClass*)cPtr).parentClass);
  }
}
