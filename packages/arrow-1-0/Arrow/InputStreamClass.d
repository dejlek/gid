module Arrow.InputStreamClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;
import Gio.InputStreamClass : DGioInputStreamClass = InputStreamClass;

class InputStreamClass
{
  GArrowInputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.InputStreamClass");

    cInstance = *cast(GArrowInputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DGioInputStreamClass parentClass()
  {
    return new DGioInputStreamClass(cast(GInputStreamClass*)&(cast(GArrowInputStreamClass*)cPtr).parentClass);
  }
}
