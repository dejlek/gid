module Arrow.StringArrayBuilderClass;

import Arrow.BinaryArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringArrayBuilderClass
{
  GArrowStringArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.StringArrayBuilderClass");

    cInstance = *cast(GArrowStringArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BinaryArrayBuilderClass parentClass()
  {
    return new BinaryArrayBuilderClass(cast(GArrowBinaryArrayBuilderClass*)&(cast(GArrowStringArrayBuilderClass*)cPtr).parentClass);
  }
}
