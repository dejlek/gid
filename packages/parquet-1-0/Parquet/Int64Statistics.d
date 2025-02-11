module Parquet.Int64Statistics;

import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class Int64Statistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gparquet_int64_statistics_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  long getMax()
  {
    long _retval;
    _retval = gparquet_int64_statistics_get_max(cast(GParquetInt64Statistics*)cPtr);
    return _retval;
  }

  long getMin()
  {
    long _retval;
    _retval = gparquet_int64_statistics_get_min(cast(GParquetInt64Statistics*)cPtr);
    return _retval;
  }
}
