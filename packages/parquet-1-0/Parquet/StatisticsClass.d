module Parquet.StatisticsClass;

import GObject.ObjectClass;
import Gid.gid;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class StatisticsClass
{
  GParquetStatisticsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.StatisticsClass");

    cInstance = *cast(GParquetStatisticsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GParquetStatisticsClass*)cPtr).parentClass);
  }
}
