module Arrow.LargeBinaryArrayBuilderClass;

import Arrow.ArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeBinaryArrayBuilderClass
{
  GArrowLargeBinaryArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeBinaryArrayBuilderClass");

    cInstance = *cast(GArrowLargeBinaryArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayBuilderClass parentClass()
  {
    return new ArrayBuilderClass(cast(GArrowArrayBuilderClass*)&(cast(GArrowLargeBinaryArrayBuilderClass*)cPtr).parentClass);
  }
}
