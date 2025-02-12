module ArrowDataset.HivePartitioningClass;

import ArrowDataset.KeyValuePartitioningClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class HivePartitioningClass
{
  GADatasetHivePartitioningClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.HivePartitioningClass");

    cInstance = *cast(GADatasetHivePartitioningClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property KeyValuePartitioningClass parentClass()
  {
    return new KeyValuePartitioningClass(cast(GADatasetKeyValuePartitioningClass*)&(cast(GADatasetHivePartitioningClass*)cPtr).parentClass);
  }
}
