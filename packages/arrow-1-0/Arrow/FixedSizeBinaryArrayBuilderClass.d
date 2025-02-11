module Arrow.FixedSizeBinaryArrayBuilderClass;

import Arrow.ArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FixedSizeBinaryArrayBuilderClass
{
  GArrowFixedSizeBinaryArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FixedSizeBinaryArrayBuilderClass");

    cInstance = *cast(GArrowFixedSizeBinaryArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayBuilderClass parentClass()
  {
    return new ArrayBuilderClass(cast(GArrowArrayBuilderClass*)&(cast(GArrowFixedSizeBinaryArrayBuilderClass*)cPtr).parentClass);
  }
}
