module Arrow.LocalFileSystemClass;

import Arrow.FileSystemClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LocalFileSystemClass
{
  GArrowLocalFileSystemClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.LocalFileSystemClass");

    cInstance = *cast(GArrowLocalFileSystemClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FileSystemClass parentClass()
  {
    return new FileSystemClass(cast(GArrowFileSystemClass*)&(cast(GArrowLocalFileSystemClass*)cPtr).parentClass);
  }
}
