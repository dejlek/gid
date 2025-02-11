module Parquet.BooleanStatisticsClass;

import Gid.gid;
import Parquet.StatisticsClass;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class BooleanStatisticsClass
{
  GParquetBooleanStatisticsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.BooleanStatisticsClass");

    cInstance = *cast(GParquetBooleanStatisticsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property StatisticsClass parentClass()
  {
    return new StatisticsClass(cast(GParquetStatisticsClass*)&(cast(GParquetBooleanStatisticsClass*)cPtr).parentClass);
  }
}
