module ArrowDataset.DirectoryPartitioningClass;

import ArrowDataset.KeyValuePartitioningClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class DirectoryPartitioningClass
{
  GADatasetDirectoryPartitioningClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.DirectoryPartitioningClass");

    cInstance = *cast(GADatasetDirectoryPartitioningClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property KeyValuePartitioningClass parentClass()
  {
    return new KeyValuePartitioningClass(cast(GADatasetKeyValuePartitioningClass*)&(cast(GADatasetDirectoryPartitioningClass*)cPtr).parentClass);
  }
}
