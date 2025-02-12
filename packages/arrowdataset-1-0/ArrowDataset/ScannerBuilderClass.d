module ArrowDataset.ScannerBuilderClass;

import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GObject.ObjectClass;
import Gid.gid;

class ScannerBuilderClass
{
  GADatasetScannerBuilderClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.ScannerBuilderClass");

    cInstance = *cast(GADatasetScannerBuilderClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GADatasetScannerBuilderClass*)cPtr).parentClass);
  }
}
