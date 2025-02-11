module Parquet.Int32StatisticsClass;

import Gid.gid;
import Parquet.StatisticsClass;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class Int32StatisticsClass
{
  GParquetInt32StatisticsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.Int32StatisticsClass");

    cInstance = *cast(GParquetInt32StatisticsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property StatisticsClass parentClass()
  {
    return new StatisticsClass(cast(GParquetStatisticsClass*)&(cast(GParquetInt32StatisticsClass*)cPtr).parentClass);
  }
}
