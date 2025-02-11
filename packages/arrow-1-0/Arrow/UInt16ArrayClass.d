module Arrow.UInt16ArrayClass;

import Arrow.NumericArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt16ArrayClass
{
  GArrowUInt16ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UInt16ArrayClass");

    cInstance = *cast(GArrowUInt16ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property NumericArrayClass parentClass()
  {
    return new NumericArrayClass(cast(GArrowNumericArrayClass*)&(cast(GArrowUInt16ArrayClass*)cPtr).parentClass);
  }
}
