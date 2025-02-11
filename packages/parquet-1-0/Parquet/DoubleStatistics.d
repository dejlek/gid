module Parquet.DoubleStatistics;

import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class DoubleStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gparquet_double_statistics_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  double getMax()
  {
    double _retval;
    _retval = gparquet_double_statistics_get_max(cast(GParquetDoubleStatistics*)cPtr);
    return _retval;
  }

  double getMin()
  {
    double _retval;
    _retval = gparquet_double_statistics_get_min(cast(GParquetDoubleStatistics*)cPtr);
    return _retval;
  }
}
