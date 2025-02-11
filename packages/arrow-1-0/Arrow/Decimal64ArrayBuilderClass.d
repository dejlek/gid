module Arrow.Decimal64ArrayBuilderClass;

import Arrow.FixedSizeBinaryArrayBuilderClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Decimal64ArrayBuilderClass
{
  GArrowDecimal64ArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.Decimal64ArrayBuilderClass");

    cInstance = *cast(GArrowDecimal64ArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FixedSizeBinaryArrayBuilderClass parentClass()
  {
    return new FixedSizeBinaryArrayBuilderClass(cast(GArrowFixedSizeBinaryArrayBuilderClass*)&(cast(GArrowDecimal64ArrayBuilderClass*)cPtr).parentClass);
  }
}
