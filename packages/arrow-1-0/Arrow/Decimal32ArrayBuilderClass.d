module Arrow.Decimal32ArrayBuilderClass;

import Arrow.FixedSizeBinaryArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal32ArrayBuilderClass
{
  GArrowDecimal32ArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal32ArrayBuilderClass");

    cInstance = *cast(GArrowDecimal32ArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayBuilderClass parentClass()
  {
    return new FixedSizeBinaryArrayBuilderClass(cast(GArrowFixedSizeBinaryArrayBuilderClass*)&(cast(GArrowDecimal32ArrayBuilderClass*)cPtr).parentClass);
  }
}
