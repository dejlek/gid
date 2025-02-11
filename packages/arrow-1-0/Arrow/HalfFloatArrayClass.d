module Arrow.HalfFloatArrayClass;

import Arrow.NumericArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class HalfFloatArrayClass
{
  GArrowHalfFloatArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.HalfFloatArrayClass");

    cInstance = *cast(GArrowHalfFloatArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property NumericArrayClass parentClass()
  {
    return new NumericArrayClass(cast(GArrowNumericArrayClass*)&(cast(GArrowHalfFloatArrayClass*)cPtr).parentClass);
  }
}
