module parquet.float_statistics;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class FloatStatistics : parquet.statistics.Statistics
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_float_statistics_get_type != &gidSymbolNotFound ? gparquet_float_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  float getMax()
  {
    float _retval;
    _retval = gparquet_float_statistics_get_max(cast(GParquetFloatStatistics*)cPtr);
    return _retval;
  }

  /** */
  float getMin()
  {
    float _retval;
    _retval = gparquet_float_statistics_get_min(cast(GParquetFloatStatistics*)cPtr);
    return _retval;
  }
}
