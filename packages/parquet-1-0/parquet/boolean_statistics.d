module parquet.boolean_statistics;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

class BooleanStatistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
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
