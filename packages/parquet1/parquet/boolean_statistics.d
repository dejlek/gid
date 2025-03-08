module parquet.boolean_statistics;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class BooleanStatistics : parquet.statistics.Statistics
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_boolean_statistics_get_type != &gidSymbolNotFound ? gparquet_boolean_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  bool getMax()
  {
    bool _retval;
    _retval = gparquet_boolean_statistics_get_max(cast(GParquetBooleanStatistics*)cPtr);
    return _retval;
  }

  /** */
  bool getMin()
  {
    bool _retval;
    _retval = gparquet_boolean_statistics_get_min(cast(GParquetBooleanStatistics*)cPtr);
    return _retval;
  }
}
