module Arrow.ScalarAggregateOptionsClass;

import Arrow.FunctionOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ScalarAggregateOptionsClass
{
  GArrowScalarAggregateOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ScalarAggregateOptionsClass");

    cInstance = *cast(GArrowScalarAggregateOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FunctionOptionsClass parentClass()
  {
    return new FunctionOptionsClass(cast(GArrowFunctionOptionsClass*)&(cast(GArrowScalarAggregateOptionsClass*)cPtr).parentClass);
  }
}
