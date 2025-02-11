module Arrow.DenseUnionArrayBuilderClass;

import Arrow.Types;
import Arrow.UnionArrayBuilderClass;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DenseUnionArrayBuilderClass
{
  GArrowDenseUnionArrayBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.DenseUnionArrayBuilderClass");

    cInstance = *cast(GArrowDenseUnionArrayBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property UnionArrayBuilderClass parentClass()
  {
    return new UnionArrayBuilderClass(cast(GArrowUnionArrayBuilderClass*)&(cast(GArrowDenseUnionArrayBuilderClass*)cPtr).parentClass);
  }
}
