module Arrow.Int32ArrayBuilderClass;

import Arrow.ArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int32ArrayBuilderClass
{
  GArrowInt32ArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Int32ArrayBuilderClass");

    cInstance = *cast(GArrowInt32ArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayBuilderClass parentClass()
  {
    return new ArrayBuilderClass(cast(GArrowArrayBuilderClass*)&(cast(GArrowInt32ArrayBuilderClass*)cPtr).parentClass);
  }
}
