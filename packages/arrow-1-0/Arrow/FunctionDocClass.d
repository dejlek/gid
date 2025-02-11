module Arrow.FunctionDocClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class FunctionDocClass
{
  GArrowFunctionDocClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FunctionDocClass");

    cInstance = *cast(GArrowFunctionDocClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowFunctionDocClass*)cPtr).parentClass);
  }
}
