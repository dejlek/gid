module Parquet.FloatStatistics;

import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class FloatStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gparquet_float_statistics_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  float getMax()
  {
    float _retval;
    _retval = gparquet_float_statistics_get_max(cast(GParquetFloatStatistics*)cPtr);
    return _retval;
  }

  float getMin()
  {
    float _retval;
    _retval = gparquet_float_statistics_get_min(cast(GParquetFloatStatistics*)cPtr);
    return _retval;
  }
}
