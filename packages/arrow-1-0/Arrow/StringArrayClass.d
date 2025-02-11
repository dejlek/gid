module Arrow.StringArrayClass;

import Arrow.BinaryArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringArrayClass
{
  GArrowStringArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StringArrayClass");

    cInstance = *cast(GArrowStringArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BinaryArrayClass parentClass()
  {
    return new BinaryArrayClass(cast(GArrowBinaryArrayClass*)&(cast(GArrowStringArrayClass*)cPtr).parentClass);
  }
}
