module Arrow.QuantileOptionsClass;

import Arrow.FunctionOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class QuantileOptionsClass
{
  GArrowQuantileOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.QuantileOptionsClass");

    cInstance = *cast(GArrowQuantileOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FunctionOptionsClass parentClass()
  {
    return new FunctionOptionsClass(cast(GArrowFunctionOptionsClass*)&(cast(GArrowQuantileOptionsClass*)cPtr).parentClass);
  }
}
