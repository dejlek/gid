module Arrow.DenseUnionArrayClass;

import Arrow.Types;
import Arrow.UnionArrayClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DenseUnionArrayClass
{
  GArrowDenseUnionArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DenseUnionArrayClass");

    cInstance = *cast(GArrowDenseUnionArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionArrayClass parentClass()
  {
    return new UnionArrayClass(cast(GArrowUnionArrayClass*)&(cast(GArrowDenseUnionArrayClass*)cPtr).parentClass);
  }
}
