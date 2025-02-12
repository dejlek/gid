module ArrowDataset.ScannerClass;

import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import GObject.ObjectClass;
import Gid.gid;

class ScannerClass
{
  GADatasetScannerClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.ScannerClass");

    cInstance = *cast(GADatasetScannerClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GADatasetScannerClass*)cPtr).parentClass);
  }
}
