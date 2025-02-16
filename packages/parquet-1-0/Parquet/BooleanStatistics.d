module Parquet.BooleanStatistics;

import Gid.gid;
import Parquet.Statistics;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class BooleanStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_boolean_statistics_get_type != &gidSymbolNotFound ? gparquet_boolean_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool getMax()
  {
    bool _retval;
    _retval = gparquet_boolean_statistics_get_max(cast(GParquetBooleanStatistics*)cPtr);
    return _retval;
  }

  bool getMin()
  {
    bool _retval;
    _retval = gparquet_boolean_statistics_get_min(cast(GParquetBooleanStatistics*)cPtr);
    return _retval;
  }
}
