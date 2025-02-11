module Arrow.IntArrayBuilderClass;

import Arrow.ArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class IntArrayBuilderClass
{
  GArrowIntArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.IntArrayBuilderClass");

    cInstance = *cast(GArrowIntArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayBuilderClass parentClass()
  {
    return new ArrayBuilderClass(cast(GArrowArrayBuilderClass*)&(cast(GArrowIntArrayBuilderClass*)cPtr).parentClass);
  }
}
