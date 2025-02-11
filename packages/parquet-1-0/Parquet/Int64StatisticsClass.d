module Parquet.Int64StatisticsClass;

import Gid.gid;
import Parquet.StatisticsClass;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class Int64StatisticsClass
{
  GParquetInt64StatisticsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.Int64StatisticsClass");

    cInstance = *cast(GParquetInt64StatisticsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property StatisticsClass parentClass()
  {
    return new StatisticsClass(cast(GParquetStatisticsClass*)&(cast(GParquetInt64StatisticsClass*)cPtr).parentClass);
  }
}
