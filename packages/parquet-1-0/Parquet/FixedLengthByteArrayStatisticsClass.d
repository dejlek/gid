module Parquet.FixedLengthByteArrayStatisticsClass;

import Gid.gid;
import Parquet.StatisticsClass;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class FixedLengthByteArrayStatisticsClass
{
  GParquetFixedLengthByteArrayStatisticsClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Parquet.FixedLengthByteArrayStatisticsClass");

    cInstance = *cast(GParquetFixedLengthByteArrayStatisticsClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property StatisticsClass parentClass()
  {
    return new StatisticsClass(cast(GParquetStatisticsClass*)&(cast(GParquetFixedLengthByteArrayStatisticsClass*)cPtr).parentClass);
  }
}
