module Arrow.BufferInputStreamClass;

import Arrow.SeekableInputStreamClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BufferInputStreamClass
{
  GArrowBufferInputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.BufferInputStreamClass");

    cInstance = *cast(GArrowBufferInputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SeekableInputStreamClass parentClass()
  {
    return new SeekableInputStreamClass(cast(GArrowSeekableInputStreamClass*)&(cast(GArrowBufferInputStreamClass*)cPtr).parentClass);
  }
}
