module Arrow.FilterOptionsClass;

import Arrow.FunctionOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FilterOptionsClass
{
  GArrowFilterOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FilterOptionsClass");

    cInstance = *cast(GArrowFilterOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FunctionOptionsClass parentClass()
  {
    return new FunctionOptionsClass(cast(GArrowFunctionOptionsClass*)&(cast(GArrowFilterOptionsClass*)cPtr).parentClass);
  }
}
