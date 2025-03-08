module parquet.int32_statistics;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class Int32Statistics : parquet.statistics.Statistics
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_int32_statistics_get_type != &gidSymbolNotFound ? gparquet_int32_statistics_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  int getMax()
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_max(cast(GParquetInt32Statistics*)cPtr);
    return _retval;
  }

  /** */
  int getMin()
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_min(cast(GParquetInt32Statistics*)cPtr);
    return _retval;
  }
}
