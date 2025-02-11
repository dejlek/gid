module Arrow.FilterNodeOptionsClass;

import Arrow.ExecuteNodeOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FilterNodeOptionsClass
{
  GArrowFilterNodeOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FilterNodeOptionsClass");

    cInstance = *cast(GArrowFilterNodeOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ExecuteNodeOptionsClass parentClass()
  {
    return new ExecuteNodeOptionsClass(cast(GArrowExecuteNodeOptionsClass*)&(cast(GArrowFilterNodeOptionsClass*)cPtr).parentClass);
  }
}
