module Arrow.Decimal128ArrayBuilderClass;

import Arrow.FixedSizeBinaryArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal128ArrayBuilderClass
{
  GArrowDecimal128ArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal128ArrayBuilderClass");

    cInstance = *cast(GArrowDecimal128ArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayBuilderClass parentClass()
  {
    return new FixedSizeBinaryArrayBuilderClass(cast(GArrowFixedSizeBinaryArrayBuilderClass*)&(cast(GArrowDecimal128ArrayBuilderClass*)cPtr).parentClass);
  }
}
