module Arrow.FileOutputStreamClass;

import Arrow.OutputStreamClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FileOutputStreamClass
{
  GArrowFileOutputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FileOutputStreamClass");

    cInstance = *cast(GArrowFileOutputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property OutputStreamClass parentClass()
  {
    return new OutputStreamClass(cast(GArrowOutputStreamClass*)&(cast(GArrowFileOutputStreamClass*)cPtr).parentClass);
  }
}
