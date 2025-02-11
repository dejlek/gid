module Arrow.S3GlobalOptionsClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class S3GlobalOptionsClass
{
  GArrowS3GlobalOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.S3GlobalOptionsClass");

    cInstance = *cast(GArrowS3GlobalOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowS3GlobalOptionsClass*)cPtr).parentClass);
  }
}
