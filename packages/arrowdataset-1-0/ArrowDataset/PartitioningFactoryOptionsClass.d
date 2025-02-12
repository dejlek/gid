module ArrowDataset.PartitioningFactoryOptionsClass;

import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GObject.ObjectClass;
import Gid.gid;

class PartitioningFactoryOptionsClass
{
  GADatasetPartitioningFactoryOptionsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.PartitioningFactoryOptionsClass");

    cInstance = *cast(GADatasetPartitioningFactoryOptionsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GADatasetPartitioningFactoryOptionsClass*)cPtr).parentClass);
  }
}
