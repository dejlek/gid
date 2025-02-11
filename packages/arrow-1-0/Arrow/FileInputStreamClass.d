module Arrow.FileInputStreamClass;

import Arrow.SeekableInputStreamClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FileInputStreamClass
{
  GArrowFileInputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.FileInputStreamClass");

    cInstance = *cast(GArrowFileInputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SeekableInputStreamClass parentClass()
  {
    return new SeekableInputStreamClass(cast(GArrowSeekableInputStreamClass*)&(cast(GArrowFileInputStreamClass*)cPtr).parentClass);
  }
}
