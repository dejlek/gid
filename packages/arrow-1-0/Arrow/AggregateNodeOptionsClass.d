module Arrow.AggregateNodeOptionsClass;

import Arrow.ExecuteNodeOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class AggregateNodeOptionsClass
{
  GArrowAggregateNodeOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.AggregateNodeOptionsClass");

    cInstance = *cast(GArrowAggregateNodeOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ExecuteNodeOptionsClass parentClass()
  {
    return new ExecuteNodeOptionsClass(cast(GArrowExecuteNodeOptionsClass*)&(cast(GArrowAggregateNodeOptionsClass*)cPtr).parentClass);
  }
}
