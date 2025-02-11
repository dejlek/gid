module Arrow.LiteralExpressionClass;

import Arrow.ExpressionClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LiteralExpressionClass
{
  GArrowLiteralExpressionClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LiteralExpressionClass");

    cInstance = *cast(GArrowLiteralExpressionClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ExpressionClass parentClass()
  {
    return new ExpressionClass(cast(GArrowExpressionClass*)&(cast(GArrowLiteralExpressionClass*)cPtr).parentClass);
  }
}
