module ArrowDataset.FileSystemDatasetClass;

import ArrowDataset.DatasetClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class FileSystemDatasetClass
{
  GADatasetFileSystemDatasetClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.FileSystemDatasetClass");

    cInstance = *cast(GADatasetFileSystemDatasetClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property DatasetClass parentClass()
  {
    return new DatasetClass(cast(GADatasetDatasetClass*)&(cast(GADatasetFileSystemDatasetClass*)cPtr).parentClass);
  }
}
