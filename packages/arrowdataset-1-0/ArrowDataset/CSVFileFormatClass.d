module ArrowDataset.CSVFileFormatClass;

import ArrowDataset.FileFormatClass;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class CSVFileFormatClass
{
  GADatasetCSVFileFormatClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for ArrowDataset.CSVFileFormatClass");

    cInstance = *cast(GADatasetCSVFileFormatClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FileFormatClass parentClass()
  {
    return new FileFormatClass(cast(GADatasetFileFormatClass*)&(cast(GADatasetCSVFileFormatClass*)cPtr).parentClass);
  }
}
