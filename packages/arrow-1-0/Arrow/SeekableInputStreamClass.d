module Arrow.SeekableInputStreamClass;

import Arrow.InputStreamClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SeekableInputStreamClass
{
  GArrowSeekableInputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.SeekableInputStreamClass");

    cInstance = *cast(GArrowSeekableInputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property InputStreamClass parentClass()
  {
    return new InputStreamClass(cast(GArrowInputStreamClass*)&(cast(GArrowSeekableInputStreamClass*)cPtr).parentClass);
  }
}
