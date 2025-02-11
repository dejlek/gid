module Arrow.StructFieldOptionsClass;

import Arrow.FunctionOptionsClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StructFieldOptionsClass
{
  GArrowStructFieldOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StructFieldOptionsClass");

    cInstance = *cast(GArrowStructFieldOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FunctionOptionsClass parentClass()
  {
    return new FunctionOptionsClass(cast(GArrowFunctionOptionsClass*)&(cast(GArrowStructFieldOptionsClass*)cPtr).parentClass);
  }
}
