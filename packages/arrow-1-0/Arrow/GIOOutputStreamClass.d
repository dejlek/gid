module Arrow.GIOOutputStreamClass;

import Arrow.OutputStreamClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class GIOOutputStreamClass
{
  GArrowGIOOutputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.GIOOutputStreamClass");

    cInstance = *cast(GArrowGIOOutputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property OutputStreamClass parentClass()
  {
    return new OutputStreamClass(cast(GArrowOutputStreamClass*)&(cast(GArrowGIOOutputStreamClass*)cPtr).parentClass);
  }
}
