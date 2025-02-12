module ArrowDataset.FileSystemDatasetFactoryClass;

import ArrowDataset.DatasetFactoryClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class FileSystemDatasetFactoryClass
{
  GADatasetFileSystemDatasetFactoryClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.FileSystemDatasetFactoryClass");

    cInstance = *cast(GADatasetFileSystemDatasetFactoryClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DatasetFactoryClass parentClass()
  {
    return new DatasetFactoryClass(cast(GADatasetDatasetFactoryClass*)&(cast(GADatasetFileSystemDatasetFactoryClass*)cPtr).parentClass);
  }
}
