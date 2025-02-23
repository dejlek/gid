module parquet.int64_statistics;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

class Int64Statistics : Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_int64_statistics_get_type != &gidSymbolNotFound ? gparquet_int64_statistics_get_type() : cast(GType)0;
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
