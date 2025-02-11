module Arrow.UTF8NormalizeOptionsClass;

import Arrow.FunctionOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UTF8NormalizeOptionsClass
{
  GArrowUTF8NormalizeOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.UTF8NormalizeOptionsClass");

    cInstance = *cast(GArrowUTF8NormalizeOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FunctionOptionsClass parentClass()
  {
    return new FunctionOptionsClass(cast(GArrowFunctionOptionsClass*)&(cast(GArrowUTF8NormalizeOptionsClass*)cPtr).parentClass);
  }
}
