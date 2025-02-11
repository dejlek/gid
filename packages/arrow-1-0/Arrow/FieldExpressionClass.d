module Arrow.FieldExpressionClass;

import Arrow.ExpressionClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FieldExpressionClass
{
  GArrowFieldExpressionClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FieldExpressionClass");

    cInstance = *cast(GArrowFieldExpressionClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ExpressionClass parentClass()
  {
    return new ExpressionClass(cast(GArrowExpressionClass*)&(cast(GArrowFieldExpressionClass*)cPtr).parentClass);
  }
}
