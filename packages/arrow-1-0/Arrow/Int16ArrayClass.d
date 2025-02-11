module Arrow.Int16ArrayClass;

import Arrow.NumericArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int16ArrayClass
{
  GArrowInt16ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Int16ArrayClass");

    cInstance = *cast(GArrowInt16ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property NumericArrayClass parentClass()
  {
    return new NumericArrayClass(cast(GArrowNumericArrayClass*)&(cast(GArrowInt16ArrayClass*)cPtr).parentClass);
  }
}
