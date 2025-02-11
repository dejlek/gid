module Parquet.ArrowFileWriterClass;

import GObject.ObjectClass;
import Gid.gid;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class ArrowFileWriterClass
{
  GParquetArrowFileWriterClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.ArrowFileWriterClass");

    cInstance = *cast(GParquetArrowFileWriterClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GParquetArrowFileWriterClass*)cPtr).parentClass);
  }
}
