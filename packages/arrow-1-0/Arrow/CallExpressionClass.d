module Arrow.CallExpressionClass;

import Arrow.ExpressionClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class CallExpressionClass
{
  GArrowCallExpressionClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.CallExpressionClass");

    cInstance = *cast(GArrowCallExpressionClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ExpressionClass parentClass()
  {
    return new ExpressionClass(cast(GArrowExpressionClass*)&(cast(GArrowCallExpressionClass*)cPtr).parentClass);
  }
}
