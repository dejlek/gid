module Arrow.AzureFileSystemClass;

import Arrow.FileSystemClass;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class AzureFileSystemClass
{
  GArrowAzureFileSystemClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Arrow.AzureFileSystemClass");

    cInstance = *cast(GArrowAzureFileSystemClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FileSystemClass parentClass()
  {
    return new FileSystemClass(cast(GArrowFileSystemClass*)&(cast(GArrowAzureFileSystemClass*)cPtr).parentClass);
  }
}
