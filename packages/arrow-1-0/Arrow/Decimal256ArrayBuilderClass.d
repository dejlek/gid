module Arrow.Decimal256ArrayBuilderClass;

import Arrow.FixedSizeBinaryArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal256ArrayBuilderClass
{
  GArrowDecimal256ArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal256ArrayBuilderClass");

    cInstance = *cast(GArrowDecimal256ArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayBuilderClass parentClass()
  {
    return new FixedSizeBinaryArrayBuilderClass(cast(GArrowFixedSizeBinaryArrayBuilderClass*)&(cast(GArrowDecimal256ArrayBuilderClass*)cPtr).parentClass);
  }
}
