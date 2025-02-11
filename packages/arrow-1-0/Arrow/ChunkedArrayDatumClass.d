module Arrow.ChunkedArrayDatumClass;

import Arrow.DatumClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ChunkedArrayDatumClass
{
  GArrowChunkedArrayDatumClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ChunkedArrayDatumClass");

    cInstance = *cast(GArrowChunkedArrayDatumClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DatumClass parentClass()
  {
    return new DatumClass(cast(GArrowDatumClass*)&(cast(GArrowChunkedArrayDatumClass*)cPtr).parentClass);
  }
}
