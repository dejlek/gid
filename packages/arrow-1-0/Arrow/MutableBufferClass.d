module Arrow.MutableBufferClass;

import Arrow.BufferClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MutableBufferClass
{
  GArrowMutableBufferClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.MutableBufferClass");

    cInstance = *cast(GArrowMutableBufferClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property BufferClass parentClass()
  {
    return new BufferClass(cast(GArrowBufferClass*)&(cast(GArrowMutableBufferClass*)cPtr).parentClass);
  }
}
