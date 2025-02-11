module Arrow.LocalFileSystemOptionsClass;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectClass;
import Gid.gid;

class LocalFileSystemOptionsClass
{
  GArrowLocalFileSystemOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LocalFileSystemOptionsClass");

    cInstance = *cast(GArrowLocalFileSystemOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GArrowLocalFileSystemOptionsClass*)cPtr).parentClass);
  }
}
