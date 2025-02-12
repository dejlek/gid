module ArrowDataset.HivePartitioningOptionsClass;

import ArrowDataset.KeyValuePartitioningOptionsClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class HivePartitioningOptionsClass
{
  GADatasetHivePartitioningOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.HivePartitioningOptionsClass");

    cInstance = *cast(GADatasetHivePartitioningOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property KeyValuePartitioningOptionsClass parentClass()
  {
    return new KeyValuePartitioningOptionsClass(cast(GADatasetKeyValuePartitioningOptionsClass*)&(cast(GADatasetHivePartitioningOptionsClass*)cPtr).parentClass);
  }
}
