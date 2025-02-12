module ArrowDataset.KeyValuePartitioningClass;

import ArrowDataset.PartitioningClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class KeyValuePartitioningClass
{
  GADatasetKeyValuePartitioningClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.KeyValuePartitioningClass");

    cInstance = *cast(GADatasetKeyValuePartitioningClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property PartitioningClass parentClass()
  {
    return new PartitioningClass(cast(GADatasetPartitioningClass*)&(cast(GADatasetKeyValuePartitioningClass*)cPtr).parentClass);
  }
}
