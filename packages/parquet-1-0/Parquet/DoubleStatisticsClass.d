module Parquet.DoubleStatisticsClass;

import Gid.gid;
import Parquet.StatisticsClass;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class DoubleStatisticsClass
{
  GParquetDoubleStatisticsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.DoubleStatisticsClass");

    cInstance = *cast(GParquetDoubleStatisticsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property StatisticsClass parentClass()
  {
    return new StatisticsClass(cast(GParquetStatisticsClass*)&(cast(GParquetDoubleStatisticsClass*)cPtr).parentClass);
  }
}
