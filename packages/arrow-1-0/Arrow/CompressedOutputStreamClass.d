module Arrow.CompressedOutputStreamClass;

import Arrow.OutputStreamClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class CompressedOutputStreamClass
{
  GArrowCompressedOutputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.CompressedOutputStreamClass");

    cInstance = *cast(GArrowCompressedOutputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property OutputStreamClass parentClass()
  {
    return new OutputStreamClass(cast(GArrowOutputStreamClass*)&(cast(GArrowCompressedOutputStreamClass*)cPtr).parentClass);
  }
}
