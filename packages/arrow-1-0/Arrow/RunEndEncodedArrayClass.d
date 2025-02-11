module Arrow.RunEndEncodedArrayClass;

import Arrow.ArrayClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RunEndEncodedArrayClass
{
  GArrowRunEndEncodedArrayClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.RunEndEncodedArrayClass");

    cInstance = *cast(GArrowRunEndEncodedArrayClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ArrayClass parentClass()
  {
    return new ArrayClass(cast(GArrowArrayClass*)&(cast(GArrowRunEndEncodedArrayClass*)cPtr).parentClass);
  }
}
