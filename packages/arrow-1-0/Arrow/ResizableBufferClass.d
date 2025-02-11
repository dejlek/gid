module Arrow.ResizableBufferClass;

import Arrow.MutableBufferClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ResizableBufferClass
{
  GArrowResizableBufferClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.ResizableBufferClass");

    cInstance = *cast(GArrowResizableBufferClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property MutableBufferClass parentClass()
  {
    return new MutableBufferClass(cast(GArrowMutableBufferClass*)&(cast(GArrowResizableBufferClass*)cPtr).parentClass);
  }
}
