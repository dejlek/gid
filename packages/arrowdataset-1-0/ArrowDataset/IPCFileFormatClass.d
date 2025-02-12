module ArrowDataset.IPCFileFormatClass;

import ArrowDataset.FileFormatClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class IPCFileFormatClass
{
  GADatasetIPCFileFormatClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.IPCFileFormatClass");

    cInstance = *cast(GADatasetIPCFileFormatClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FileFormatClass parentClass()
  {
    return new FileFormatClass(cast(GADatasetFileFormatClass*)&(cast(GADatasetIPCFileFormatClass*)cPtr).parentClass);
  }
}
