module Arrow.LargeStringArrayBuilderClass;

import Arrow.LargeBinaryArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeStringArrayBuilderClass
{
  GArrowLargeStringArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LargeStringArrayBuilderClass");

    cInstance = *cast(GArrowLargeStringArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property LargeBinaryArrayBuilderClass parentClass()
  {
    return new LargeBinaryArrayBuilderClass(cast(GArrowLargeBinaryArrayBuilderClass*)&(cast(GArrowLargeStringArrayBuilderClass*)cPtr).parentClass);
  }
}
