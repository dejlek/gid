module Arrow.SinkNodeOptionsClass;

import Arrow.ExecuteNodeOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SinkNodeOptionsClass
{
  GArrowSinkNodeOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.SinkNodeOptionsClass");

    cInstance = *cast(GArrowSinkNodeOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ExecuteNodeOptionsClass parentClass()
  {
    return new ExecuteNodeOptionsClass(cast(GArrowExecuteNodeOptionsClass*)&(cast(GArrowSinkNodeOptionsClass*)cPtr).parentClass);
  }
}
