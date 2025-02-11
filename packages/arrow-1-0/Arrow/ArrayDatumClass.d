module Arrow.ArrayDatumClass;

import Arrow.DatumClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ArrayDatumClass
{
  GArrowArrayDatumClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ArrayDatumClass");

    cInstance = *cast(GArrowArrayDatumClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DatumClass parentClass()
  {
    return new DatumClass(cast(GArrowDatumClass*)&(cast(GArrowArrayDatumClass*)cPtr).parentClass);
  }
}
