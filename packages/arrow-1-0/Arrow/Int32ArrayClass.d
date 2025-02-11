module Arrow.Int32ArrayClass;

import Arrow.NumericArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int32ArrayClass
{
  GArrowInt32ArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Int32ArrayClass");

    cInstance = *cast(GArrowInt32ArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property NumericArrayClass parentClass()
  {
    return new NumericArrayClass(cast(GArrowNumericArrayClass*)&(cast(GArrowInt32ArrayClass*)cPtr).parentClass);
  }
}
